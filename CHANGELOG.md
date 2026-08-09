# StudyVault Changelog

All notable changes to the StudyVault Distributed Knowledge Network (DKN) are documented in this file.

---

## [1.0.0] - 2026-08-09 - Project Genesis Release 🎉

### Summary
Initial stable public release of the **StudyVault Distributed Knowledge Network (v1.0.0)**. StudyVault is an open-source, policy-governed P2P platform delivering censorship-resistant, decentralized access to academic literature, research papers, and educational resources worldwide.

### Added Protocols & Features
- **SVIP (SVE-002)**: Cryptographic Ed25519 node identities and digital signatures.
- **SVDP (SVE-003)**: Dynamic seeder peer discovery and metadata query routing.
- **SVTP (SVE-004)**: 256KB chunked P2P transfer engine with SHA-256 integrity verification and missing chunk bitmasks.
- **SVSG (SVE-005)**: 11-stage Zero Trust security verification pipeline and session token issuance.
- **DCA (SVE-006)**: Provider-agnostic CIDv1 base32 multihash storage and IPFS adapter integration.
- **SVCS (SVE-007)**: Verification-first automatic P2P seeding and sanitized tracker announcements.
- **SVTF (SVE-008)**: 5-dimensional composite peer trust framework ($T \in [0, 100]$) and passive event observer.
- **Aurora Design System**: High-fidelity dark mode UI with Riverpod state management.
- **FastAPI & Tracker Services**: Asynchronous Python backend APIs and peer tracker gateway.
- **CI/CD Quality Gate**: Automated GitHub Actions workflow (`.github/workflows/ci.yml`).

---

## [0.17.0-rc1] - 2026-08-09 - Production Hardening
- End-to-end integration test suite (`test/e2e_integration_test.dart`).
- Latency benchmarks: startup $<0.5\text{s}$, search $<15\text{ms}$, sync $<0.4\text{s}$.
- GitHub Actions CI/CD configuration.

---

## [0.16.0-alpha] - 2026-08-09 - StudyVault Trust Framework (SVTF)
- Implemented 5-dimensional peer reputation engine and score calculator.

---

## [0.15.0-alpha] - 2026-08-09 - Content Sharing Protocol (SVCS)
- Implemented automatic policy-governed P2P seeding and tracker announcements.
