/// Input and cryptographic hash validators for StudyVault.
abstract final class Validators {
  /// Validates IPFS CID v0/v1 string format.
  static bool isValidCid(String? value) {
    if (value == null || value.trim().isEmpty) return false;
    final String clean = value.trim();
    // Basic IPFS CID check (Qm... 46 chars or bafy... 59+ chars)
    return (clean.startsWith('Qm') && clean.length == 46) ||
        (clean.startsWith('bafy') && clean.length >= 50);
  }

  /// Validates academic search query.
  static bool isValidQuery(String? value) {
    return value != null && value.trim().length >= 2;
  }

  /// Validates peer multiaddr or libp2p node ID.
  static bool isValidPeerId(String? value) {
    return value != null && value.trim().length >= 10;
  }
}
