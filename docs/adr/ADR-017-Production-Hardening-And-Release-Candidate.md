# ADR-017: Production Hardening, System Observability, and Release Candidate (v0.17.0-rc1)

## Status
Accepted

## Context
StudyVault has completed implementation across all 6 core P2P protocols (SVIP Identity, SVDP Discovery, SVTP Transfer, SVSG Security Gateway, DCA Content Addressing, SVCS Content Sharing, SVTF Trust Framework). Sprint 17 focuses on production hardening, latency benchmarking, zero-trust security audit, failure resilience, and continuous integration pipeline automation.

## Decision
1. **System Integration Strategy**: Enforce single-pass end-to-end integration tests (`test/e2e_integration_test.dart`) executing the full pipeline from SVIP node registration to SVTF reputation score updates.
2. **Performance Hardening**: Establish strict operational benchmarks ($< 2\text{s}$ cold startup, $< 200\text{ms}$ search query, $< 2\text{s}$ metadata sync, $< 1\text{s}$ transfer startup).
3. **Continuous Integration**: Implement GitHub Actions automated quality gate (`.github/workflows/ci.yml`) validating static analysis, Dart unit tests, backend pytests, and tracker pytests on every push and pull request.
4. **Zero-Trust Preservation**: Retain 11-stage SVSG authorization gate without fallback bypasses or manual file uploads.

## Consequences
- Guarantees $100\%$ protocol compliance and regression protection across all 6 StudyVault protocols.
- Enables automated release candidate packaging for Version 1.0 Release Candidate.
