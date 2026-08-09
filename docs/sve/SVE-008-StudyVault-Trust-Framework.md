# SVE-008: StudyVault Trust Framework (SVTF/1.0)

**Status**: Standard Specification  
**Category**: Distributed Trust & Peer Reputation  
**Author**: StudyVault Core Engineering Team  
**Version**: 1.0.0  
**Date**: August 2026  

---

## 1. Abstract

This specification defines the **StudyVault Trust Framework (SVTF/1.0)**, a decentralized, 5-dimensional peer reputation engine that continuously evaluates node reliability and issues a composite Trust Score $T \in [0.0, 100.0]$. SVTF operates as a passive event telemetry consumer across the StudyVault protocol stack (SVIP, SVDP, SVTP, SVSG, DCA, SVCS), providing transparent reputation data to optimize peer discovery ranking and chunk allocation — without central authority or permanent blacklisting.

---

## 2. Purpose & Trust Model

In decentralized P2P systems, nodes exhibit varying degrees of performance, availability, and protocol adherence. SVTF solves peer evaluation without centralized authority through three principles:
1. **Multi-Factor Trust Evaluation**: Scores combine Availability ($S_{avail}$), Integrity ($S_{integrity}$), Reliability ($S_{reliability}$), Security ($S_{security}$), and Freshness ($S_{freshness}$).
2. **Passive Observability**: SVTF subscribes to network protocol events. It never controls transfer authorization directly (SVSG retains authorization gate authority).
3. **No Permanent Blacklists & Bounded Scores**: Scores are strictly bounded in $[0.0, 100.0]$. Nodes in `restricted` state rebuild trust through verified successful behavior.

---

## 3. Trust Score Formula & Component Breakdown

$$T = w_a \cdot S_{avail} + w_i \cdot S_{integrity} + w_r \cdot S_{reliability} + w_s \cdot S_{security} + w_f \cdot S_{freshness}$$

- **$w_a = 0.25$ (Availability Weight)**: Heartbeat uptime ratio $\frac{\text{heartbeats}}{\text{heartbeats} + \text{timeouts}}$.
- **$w_i = 0.25$ (Integrity Weight)**: CID multihash verification ratio $\frac{\text{integrity\_succ}}{\text{integrity\_succ} + \text{integrity\_fail}}$.
- **$w_r = 0.25$ (Reliability Weight)**: Transfer completion ratio $\frac{\text{transfers\_succ}}{\text{transfers\_succ} + \text{transfers\_fail}}$.
- **$w_s = 0.15$ (Security Weight)**: $100.0 - (20.0 \times \text{security\_violations})$.
- **$w_f = 0.10$ (Freshness Weight)**: Decays by $5.0$ points per hour of node inactivity.

---

## 4. State Machine & Node Lifecycle

```
           +-------------+
           |   UNKNOWN   |
           +------+------+
                  | (Register / First Event)
                  v
           +-------------+
           |     NEW     | (T = 50.0)
           +------+------+
                  |
        +---------+---------+
        |                   |
        v                   v
+---------------+   +---------------+
|    TRUSTED    |   |    WARNING    | (30 ≤ T < 50)
+-------+-------+   +-------+-------+
        |                   |
        v                   v
+---------------+   +---------------+
| HIGHLY_TRUSTED|   |  RESTRICTED   | (T < 30)
+---------------+   +-------+-------+
                            | (Sustained Success)
                            v
                    +---------------+
                    |   RECOVERY    |
                    +---------------+
```

| Trust State | Score Range | Description |
|-------------|-------------|-------------|
| `unknown` | N/A | Node not indexed in SVTF registry. |
| `newNode` | $50.0$ | Newly registered node undergoing initial baseline evaluation. |
| `trusted` | $70.0 \le T < 90.0$ | Highly reliable peer with proven uptime and integrity. |
| `highlyTrusted` | $T \ge 90.0$ | Exemplary seeder node eligible for priority chunk scheduling. |
| `warning` | $30.0 \le T < 50.0$ | Node exhibiting intermittent timeouts or failed transfers. |
| `restricted` | $T < 30.0$ | Low-performing node; peer ranking engine de-prioritizes selection. |
| `recovery` | $30.0 \le T < 70.0$ (from Restricted) | Node actively rebuilding score via successful transfers. |

---

## 5. Performance Targets

- **Event Processing Latency**: $< 2\text{ms}$ per network event update.
- **Score Calculation Throughput**: $> 50,000$ composite score calculations per second.
- **Memory Footprint**: $< 100\text{ bytes}$ per node history record.
