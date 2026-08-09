# SVE-006: Distributed Content Addressing (DCA / IPFS)

**Status**: Standard Specification  
**Category**: Distributed Storage & Content Addressing  
**Author**: StudyVault Core Engineering Team  
**Version**: 1.0.0  
**Date**: August 2026  

---

## 1. Abstract

This specification defines the **Distributed Content Addressing (DCA)** subsystem for StudyVault, incorporating IPFS (InterPlanetary File System) as the underlying storage adapter. DCA decouples higher application protocols (SVTP, Peer Caching, UI) from specific storage implementations by using immutable cryptographic Content Identifiers (CIDv1). Educational resources are indexed, verified, and pinned based on their binary payload content hashes rather than location URLs or central server paths.

---

## 2. Purpose & Architecture

In location-based addressing, file references break if a central server shuts down or moves a URL path. DCA resolves this by guaranteeing **content immutability**:
1. **Content-Based Addressing**: Content is identified by CIDv1 (`bafybeic...`), generated via multihash SHA-256 over raw payload bytes.
2. **Provider Agnosticism**: Application code calls `DcaInterface`. The `IpfsAdapter` handles IPFS interaction, allowing future pluggable backends (e.g. Arweave, Filecoin, S3) without modifying application protocols.
3. **Automated Pinning & Quota Control**: Pinning prevents garbage collection of active academic resources, while enforcing local disk quotas ($10\text{GB}$ default).

```
  Higher Application Protocols (SVTP / Security Gateway / Mobile UI)
                               │
                               ▼
                   DcaInterface (Abstraction)
                               │
            ┌──────────────────┴──────────────────┐
            ▼                                     ▼
      IpfsAdapter                           LocalContentRegistry
   (Kubo / IPFS Gateway)                 (CID -> Metadata & Path)
```

---

## 3. CID Specification & Multihash Structure

SVE-006 adopts CIDv1 base32 multihash encoding:
- **Version**: `0x01` (CIDv1)
- **Multicodec**: `0x55` (raw binary payload)
- **Multihash Code**: `0x12` (SHA-256)
- **Digest Length**: `0x20` (32 bytes)
- **Base Encoding**: RFC 4648 Base32 lower-case with `b` prefix (e.g. `bafybeic...`).

---

## 4. State Machine & Content Lifecycle

```
           +-----------+
           | UNKNOWN   |
           +-----+-----+
                 |
                 v
           +-----------+
           | STORED    | (Bytes written, CID computed)
           +-----+-----+
                 |
                 v
           +-----------+
           | PINNED    | (Pin status active, safe from GC)
           +-----+-----+
                 |
        +--------+--------+
        |                 |
        v                 v
  +-----------+     +-----------+
  | UNPINNED  |     | CORRUPTED |
  +-----------+     +-----------+
```

| State | Description |
|-------|-------------|
| `unknown` | Content CID not indexed in local registry. |
| `stored` | Payload bytes stored locally; CID validated. |
| `pinned` | Content pinned in IPFS storage adapter; protected from GC. |
| `unpinned` | Pin removed; eligible for storage quota pruning. |
| `corrupted` | Integrity audit detected SHA-256 / multihash mismatch. |

---

## 5. Performance Targets

- **CID Computation Rate**: $> 100\text{ MB/sec}$ throughput.
- **CID Verification Latency**: $< 5\text{ms}$ for cached records.
- **Registry Lookup Speed**: $< 2\text{ms}$ index search.
- **Pinning Throughput**: $> 1,000$ CID pins per minute.
