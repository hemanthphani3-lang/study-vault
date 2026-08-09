# SVE-003: StudyVault Discovery Protocol (SVDP)

**Status**: Standard Specification  
**Category**: Networking & Peer Coordination  
**Author**: StudyVault Core Engineering Team  
**Version**: 1.0.0  
**Date**: August 2026  

---

## 1. Abstract

This document specifies the **StudyVault Discovery Protocol (SVDP)**, an application-layer peer discovery protocol designed for privacy-preserving, decentralized academic metadata lookup across global peer-to-peer networks. SVDP enables mobile and desktop nodes to discover active seeders hosting academic metadata records without exposing personal user data, private keys, or local file storage.

---

## 2. Purpose & Motivation

Traditional P2P discovery protocols (e.g., BitTorrent DHT / Mainline DHT) often leak node IP addresses indiscriminately or fail to account for device capabilities (e.g., mobile battery constraints vs. desktop relays). SVDP addresses this by introducing:
1. **Capability-Aware Ranking**: Prioritizes high-uptime desktop relays over resource-constrained mobile clients.
2. **Metadata-Only Discovery**: Ensures no binary file contents are queried or transferred during the discovery phase.
3. **Cryptographic Identity Integration**: Binds discovery endpoints directly to self-sovereign Ed25519 node identities and SHA-256 fingerprints (SVE-002 / SVIP).
4. **Geographic Proximity Awareness**: Ranks regional peer seeders closer to the requesting client to minimize network latency.

---

## 3. Protocol Architecture & Topology

```
+-------------------------------------------------------------------+
|                        Client Node (Flutter)                      |
+-------------------------------------------------------------------+
                                  │
                                  ▼  HTTP REST (/api/v1/discovery/peers)
+-------------------------------------------------------------------+
|                 FastAPI Gateway Service (Port 8000)               |
+-------------------------------------------------------------------+
                                  │
                                  ▼  Internal RPC / REST
+-------------------------------------------------------------------+
|             GMPCS Tracker Microservice (Port 8001)                |
+-------------------------------------------------------------------+
                                  │
                                  ▼  Read
+-------------------------------------------------------------------+
|                 Metadata Availability Index (SQLite)              |
+-------------------------------------------------------------------+
```

---

## 4. Message Specifications & Payloads

### A. Peer Discovery Request (`GET /api/v1/discovery/peers`)
Query Parameters:
- `metadata_id` (string, required): Academic metadata ID (e.g., `res_math_101`).
- `country_code` (string, optional): Client ISO 3166-1 alpha-2 country code (e.g., `US`).
- `limit` (integer, optional, default: 50): Maximum number of peers to return.

### B. Peer Discovery Response (`200 OK`)
```json
{
  "success": true,
  "data": {
    "metadata_id": "res_math_101",
    "total_seeders": 14,
    "peers": [
      {
        "peer_id": "peer_node_alpha_01",
        "node_id": "node_a9f8b7c6",
        "public_key": "4a5b6c...",
        "fingerprint": "SHA256:AA:BB:CC:DD:EE:FF:11:22",
        "country": "US",
        "region": "us-east",
        "capabilities": ["metadata_relay", "peer_seeder", "full_node"],
        "ping_ms": 35,
        "availability": "online",
        "metadata_match": true,
        "trust_score": 1.0,
        "rank_score": 98.5,
        "connection_method": "direct_p2p"
      }
    ]
  },
  "message": "Discovered 14 active peer seeders."
}
```

---

## 5. Peer Ranking Algorithm

The Peer Ranking Engine computes a composite floating-point score $S \in [0, 100]$ for each online peer node:

$$S = w_a \cdot A + w_c \cdot C + w_g \cdot G + w_l \cdot L$$

Where:
- **$A$ (Availability Freshness, Weight $w_a = 0.40$)**: $A = 100$ if last heartbeat $\le 60\text{s}$; decays linearly to $0$ at $180\text{s}$.
- **$C$ (Capability Score, Weight $w_c = 0.30$)**: $+40$ for `peer_seeder`, $+30$ for `full_node`, $+30$ for `metadata_relay`.
- **$G$ (Geographic Proximity, Weight $w_g = 0.20$)**: $100$ if client country matches peer country; $50$ if same region; $20$ otherwise.
- **$L$ (Latency Score, Weight $w_l = 0.10$)**: $L = \max(0, 100 - \text{ping\_ms})$.

---

## 6. Timeout, Retry & Failure Recovery

| Scenario | Threshold | Action |
|----------|-----------|--------|
| **Tracker Unreachable** | 5.0 seconds | Fallback to local cached peer list and set connection status to `local_fallback`. |
| **Peer Ping Timeout** | 3.0 seconds | Deprioritize peer rank score by $-30.0$ points. |
| **Retry Backoff** | Exponential | Initial delay $1.0\text{s}$, multiplier $2.0$, max backoff $16.0\text{s}$, max retries $3$. |

---

## 7. Security & Privacy Considerations

1. **Private Key Protection**: Private keys are strictly prohibited from appearing in SVDP messages.
2. **Metadata-Only Principle**: SVDP endpoints reject binary payload transmission requests.
3. **Enumeration Protection**: Peer responses are capped at `limit=100` and randomized among equal-ranked peers to prevent cluster mapping.

---

## 8. Performance Targets

- **Peer Lookup Latency**: $< 150\text{ms}$ (p95) on local gateway.
- **Ranking Engine Throughput**: $> 10,000$ peers scored per second per CPU core.
- **Memory Footprint**: $< 2\text{MB}$ overhead for client discovery state.
