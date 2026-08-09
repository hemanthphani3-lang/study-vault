import '../crypto/sha256_helper.dart';

/// Fingerprint Service generating cryptographic node fingerprints.
class FingerprintService {
  const FingerprintService();

  /// Computes a standard SHA-256 fingerprint for a public key hex string.
  /// Formatted as: SHA256:XX:XX:XX:XX:XX:XX:XX:XX
  String computeFingerprint(String publicKeyHex) {
    return Sha256Helper.computeFingerprint(publicKeyHex);
  }

  /// Computes a 64-char raw SHA-256 hex digest for node identity verification.
  String computeNodeDigest(String nodeId, String publicKeyHex, String platform) {
    return Sha256Helper.hashString('$nodeId:$publicKeyHex:$platform');
  }
}
