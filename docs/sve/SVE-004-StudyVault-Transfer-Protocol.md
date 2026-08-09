# SVE-004: StudyVault Transfer Protocol (SVTP/1.0)

**Status**: Standard Specification  
**Category**: Networking & P2P Resource Transfer  
**Author**: StudyVault Core Engineering Team  
**Version**: 1.0.0  
**Date**: August 2026  

---

## 1. Abstract

This specification defines **StudyVault Transfer Protocol (SVTP/1.0)**, an application-layer peer-to-peer file transfer protocol designed for high-performance, resumable, and cryptographically verified transfer of academic resources (books, research papers, datasets). SVTP provides chunked parallel downloading, SHA-256 chunk integrity verification, session pause/resume capabilities, and bandwidth control — completely independent of central servers or file relay gateways.

---

## 2. Purpose & Motivation

In distributed academic networks, direct peer transfers face challenges such as network interruptions, heterogeneous peer upload speeds, and integrity spoofing. SVTP solves these challenges by:
1. **Configurable Fixed Chunking**: Splitting resources into 256KB default chunks.
2. **SHA-256 Per-Chunk Integrity**: Verifying each chunk upon arrival to prevent corruption.
3. **Resumable Transfers**: Preserving missing chunk bitmasks so interrupted transfers resume without redownloading complete files.
4. **Decoupled Architecture**: Operating strictly between client peer nodes without passing file bytes through backend servers.

---

## 3. Protocol Architecture & Transfer Lifecycle

```
  Client Node (Receiver)                                Peer Seeder Node
          │                                                    │
          ├───────────── 1. HANDSHAKE (SVTP/1.0) ──────────────►│
          │◄──────────── 2. HANDSHAKE_ACK (SessionID) ─────────┤
          │                                                    │
          ├───────────── 3. CHUNK_NEGOTIATE (ChunkSize) ──────►│
          │◄──────────── 4. CHUNK_MANIFEST (Hashes) ───────────┤
          │                                                    │
          ├───────────── 5. REQUEST_CHUNK (Index 0) ──────────►│
          │◄──────────── 6. CHUNK_DATA (Payload + SHA256) ─────┤
          │                                                    │
          │ (Verify SHA-256 Checksum)                          │
          │ (Repeat for Chunks 1..N)                           │
          │                                                    │
          ├───────────── 7. TRANSFER_COMPLETE ────────────────►│
```

---

## 4. State Machine & Transfer States

```
           +-------+
           | IDLE  |
           +---+---+
               |
               v
        +--------------+
        | CONNECTING   |
        +------+-------+
               |
               v
        +--------------+
        | HANDSHAKING  |
        +------+-------+
               |
               v
        +--------------+
        | NEGOTIATING  |
        +------+-------+
               |
               v
        +--------------+  (Pause Requested)   +--------+
        | DOWNLOADING  | <------------------> | PAUSED |
        +------+-------+                      +---+----+
               |                                  |
               v                                  v
        +--------------+                   +--------------+
        |  VERIFYING   |                   |  CANCELLED   |
        +------+-------+                   +--------------+
               |
               v
        +--------------+
        |  COMPLETED   |
        +--------------+
```

| State | Description |
|-------|-------------|
| `idle` | Transfer initialized, awaiting start trigger. |
| `connecting` | Establishing P2P connection to target peer. |
| `handshaking` | Exchanging SVTP protocol version and Ed25519 identity challenge. |
| `negotiating` | Exchanging chunk manifest and checksum map. |
| `downloading` | Receiving binary chunk payloads. |
| `paused` | Transfer suspended; chunk state preserved locally. |
| `resuming` | Re-querying missing chunk index to continue transfer. |
| `verifying` | Assembling chunks and executing full-file digest validation. |
| `completed` | Resource successfully assembled and verified. |
| `cancelled` | Transfer aborted by user; session teardown complete. |
| `failed` | Unrecoverable network or integrity failure. |

---

## 5. Packet & Chunk Format Specification

Default Chunk Size: $262,144\text{ bytes } (256\text{ KB})$.

```
+-------------------+-------------------+-------------------+-------------------+
|  Chunk Index (4B) | Payload Size (4B) | SHA-256 Hash (32B)| Binary Data (N B) |
+-------------------+-------------------+-------------------+-------------------+
```

---

## 6. Recovery & Retry Strategy

1. **Chunk Retry Limit**: Each missing or corrupted chunk is retried up to $3$ times.
2. **Missing Chunk Recovery**: Receiver requests `getMissingChunkIndices()` payload on reconnect.
3. **Peer Switching Placeholder**: Prepare session manager to switch target peers if primary seeder disconnects.

---

## 7. Performance Targets

- **Chunk Processing Rate**: $> 500\text{ MB/sec}$ hash verification throughput.
- **Resume Overhead**: $< 10\text{ms}$ bitmask lookup time.
- **Memory Overhead**: Streams chunks directly to disk/buffer; keeps $< 2\text{MB}$ in RAM per session.
