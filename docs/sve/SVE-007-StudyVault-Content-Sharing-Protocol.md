# SVE-007: StudyVault Content Sharing Protocol (SVCS/1.0)

**Status**: Standard Specification  
**Category**: P2P Swarm Advertisement & Content Sharing  
**Author**: StudyVault Core Engineering Team  
**Version**: 1.0.0  
**Date**: August 2026  

---

## 1. Abstract

This specification defines the **StudyVault Content Sharing Protocol (SVCS/1.0)**, an automated, policy-governed protocol for advertising and seeding verified academic resources across the StudyVault P2P network. SVCS guarantees that nodes share ONLY resources that have passed SVSG authorization, SVTP chunk verification, and DCA CID pinning — prohibiting unverified file uploads while respecting user bandwidth, battery, and storage policies.

---

## 2. Purpose & Automatic Sharing Philosophy

Traditional file-sharing software requires users to manually select files, select folders, and configure uploads. SVCS replaces manual seeding with **Transparent Automatic Sharing**:
1. **Verification-First Rule**: Resources enter the shareable pool automatically upon completion of verified downloads. Manual file upload interfaces are strictly prohibited.
2. **Policy-Engine Governance**: Nodes seed resources only when network policies (Wi-Fi vs mobile), battery levels ($\ge 20\%$), charging states, and storage quotas permit.
3. **Zero-Knowledge Tracker Announcements**: Advertisements contain `metadata_id`, `cid`, `capabilities`, and `availability` ONLY. Local file system paths and private keys are NEVER published.

---

## 3. Protocol Architecture & Sharing Lifecycle

```
  Completed Download (SVTP + DCA)
                │
                ▼
  [Step 1] SVSG & DCA Integrity Validation Check
                │
                ▼
  [Step 2] Local Content Registry Indexing (ContentRecord)
                │
                ▼
  [Step 3] SharingPolicyEngine Evaluation
            ├── Network Check (Wi-Fi vs Mobile)
            ├── Battery Threshold Check (≥20%)
            └── Storage Quota Bounds Check
                │
                ▼ (Policy Passed)
  [Step 4] Advertisement Payload Generation (Metadata ID + CID + Node ID)
                │
                ▼
  [Step 5] Tracker Announcement (POST /api/v1/sharing/advertise)
                │
                ▼
  Resource Available to Swarm for SVDP Discovery & SVTP Transfers
```

---

## 4. State Machine & Sharing States

```
           +-------------+
           | UNVERIFIED  | (Incomplete or failed verification -> Blocked)
           +------+------+
                  |
                  v
           +-------------+
           | ELIGIBLE    | (Passed verification, awaiting policy check)
           +------+------+
                  |
         +--------+--------+
         |                 |
         v                 v
  +--------------+   +-----------+
  |  ADVERTISED  |   |  PAUSED   | (Battery low / Mobile data restriction)
  +--------------+   +-----------+
```

| State | Description |
|-------|-------------|
| `unverified` | Incomplete download or failed SVSG/DCA verification. Cannot be shared. |
| `eligible` | Verified download pinned in DCA storage; awaiting policy approval. |
| `advertised` | Active advertisement registered with global tracker gateway. |
| `paused` | Sharing suspended due to low battery ($<20\%$), mobile data restriction, or quota limit. |
| `unadvertised` | Resource removed from active tracker announcements. |

---

## 5. Performance Targets

- **Advertisement Latency**: $< 100\text{ms}$ tracker announcement time.
- **Policy Evaluation Speed**: $< 1\text{ms}$ per resource check.
- **Tracker Overhead**: $< 500\text{ B}$ per advertisement payload.
- **Resource Scale**: Capable of indexing $> 100,000$ active shared CIDs per node.
