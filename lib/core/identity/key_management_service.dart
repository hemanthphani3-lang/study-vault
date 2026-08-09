import '../crypto/ed25519.dart';
import '../crypto/sha256_helper.dart';

/// Key Management Service managing Ed25519 cryptographic key lifecycle.
/// Private key NEVER leaves the local process memory / secure storage.
class KeyManagementService {
  KeyManagementService();

  Ed25519KeyPair? _keyPair;

  /// Loads existing key pair or generates a new Ed25519 key pair on first launch.
  Future<Ed25519KeyPair> getOrGenerateKeyPair({String? storedPrivKeyHex}) async {
    if (_keyPair != null) return _keyPair!;

    if (storedPrivKeyHex != null && storedPrivKeyHex.length == 64) {
      final seed = Sha256Helper.fromHex(storedPrivKeyHex);
      _keyPair = Ed25519.deriveKeyPairFromSeed(seed);
    } else {
      _keyPair = Ed25519.generateKeyPair();
    }
    return _keyPair!;
  }

  /// Returns the 64-character hex encoded Ed25519 public key.
  String get publicKeyHex {
    if (_keyPair == null) throw StateError('Keypair not initialized.');
    return _keyPair!.publicKeyHex;
  }

  /// Digitally signs a string [message] using the node's Ed25519 private key.
  String sign(String message) {
    if (_keyPair == null) throw StateError('Keypair not initialized.');
    return Ed25519.signMessage(message, _keyPair!);
  }

  /// Verifies a digital signature against [message] and [publicKeyHex].
  bool verify({required String message, required String signatureHex, required String publicKeyHex}) {
    return Ed25519.verifySignature(
      message: message,
      signatureHex: signatureHex,
      publicKeyHex: publicKeyHex,
    );
  }
}
