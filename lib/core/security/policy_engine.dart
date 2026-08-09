import '../crypto/ed25519.dart';
import 'security_models.dart';

/// Zero Trust Policy Engine evaluating security rules for SVSG/1.0 authorization.
class PolicyEngine {
  PolicyEngine({this.maxAllowedTimeDriftSeconds = 300});

  final int maxAllowedTimeDriftSeconds;
  final Set<String> _seenNonces = <String>{};

  /// Evaluates all security policies for a [SecurityAuthRequest].
  Map<String, bool> evaluatePolicies(SecurityAuthRequest request) {
    final Map<String, bool> results = <String, bool>{};

    // Rule 1: Protocol Version Check
    results['protocol_version'] = verifyProtocolVersions(request.svsgVersion, request.svtpVersion);

    // Rule 2: Timestamp Freshness Check
    results['timestamp_freshness'] = verifyTimestampFreshness(request.timestamp);

    // Rule 3: Replay Protection Nonce Check
    results['nonce_uniqueness'] = verifyNonceUniqueness(request.nonce);

    // Rule 4: Capability Match Check
    results['capability_match'] = verifyCapabilities(request.capabilities);

    // Rule 5: Cryptographic Digital Signature Check
    results['signature_valid'] = verifyDigitalSignature(request);

    // Rule 6: Public Key & Fingerprint Length Validation
    results['crypto_format'] = request.publicKeyHex.length == 64 && request.fingerprint.startsWith('SHA256:');

    return results;
  }

  bool verifyProtocolVersions(String svsgVersion, String svtpVersion) {
    return svsgVersion.toUpperCase().startsWith('SVSG/1.') && svtpVersion.toUpperCase().startsWith('SVTP/1.');
  }

  bool verifyTimestampFreshness(DateTime requestTimestamp) {
    final now = DateTime.now().toUtc();
    final reqUtc = requestTimestamp.toUtc();
    final diff = now.difference(reqUtc).inSeconds.abs();
    return diff <= maxAllowedTimeDriftSeconds;
  }

  bool verifyNonceUniqueness(String nonce) {
    if (nonce.isEmpty) return false;
    if (_seenNonces.contains(nonce)) return false; // Replay attempt detected!
    _seenNonces.add(nonce);
    
    // Ring memory cleanup for old nonces if set grows large
    if (_seenNonces.length > 10000) {
      _seenNonces.clear();
      _seenNonces.add(nonce);
    }
    return true;
  }

  bool verifyCapabilities(List<String> capabilities) {
    return capabilities.contains('peer_seeder') || capabilities.contains('metadata_relay');
  }

  bool verifyDigitalSignature(SecurityAuthRequest request) {
    if (request.signatureHex.isEmpty || request.publicKeyHex.length != 64) {
      return false;
    }
    final String challengeMessage = '${request.nodeId}:${request.timestamp.toIso8601String()}:${request.nonce}';
    return Ed25519.verifySignature(
      message: challengeMessage,
      signatureHex: request.signatureHex,
      publicKeyHex: request.publicKeyHex,
    );
  }

  /// Clears seen nonces cache (for testing or restart).
  void clearNonceCache() {
    _seenNonces.clear();
  }
}
