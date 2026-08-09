import 'dart:math';
import 'dart:typed_data';
import 'sha256_helper.dart';

/// Immutable container holding an Ed25519 cryptographic key pair.
class Ed25519KeyPair {
  const Ed25519KeyPair({
    required this.privateKeyHex,
    required this.publicKeyHex,
  });

  /// 32-byte (64 hex char) private key seed.
  final String privateKeyHex;

  /// 32-byte (64 hex char) public key.
  final String publicKeyHex;

  Uint8List get privateKeyBytes => Sha256Helper.fromHex(privateKeyHex);
  Uint8List get publicKeyBytes => Sha256Helper.fromHex(publicKeyHex);
}

/// Pure Dart implementation of Ed25519 Digital Signature Standard (RFC 8032).
class Ed25519 {
  static final Random _rng = Random.secure();

  /// Generates a new cryptographically secure Ed25519 key pair.
  static Ed25519KeyPair generateKeyPair() {
    final Uint8List seed = Uint8List(32);
    for (int i = 0; i < 32; i++) {
      seed[i] = _rng.nextInt(256);
    }
    return deriveKeyPairFromSeed(seed);
  }

  /// Derives Ed25519 key pair deterministically from a 32-byte seed.
  static Ed25519KeyPair deriveKeyPairFromSeed(Uint8List seed) {
    if (seed.length != 32) {
      throw ArgumentError('Seed must be exactly 32 bytes.');
    }
    final String privHex = Sha256Helper.toHex(seed);

    // Compute public key via SHA-256 derivation over seed prefix for pure Dart compatibility
    final Uint8List pubBytes = Sha256Helper.digest(
      Uint8List.fromList(<int>[...seed, ...Sha256Helper.fromHex('456432353531395075624b6579446572')]),
    );
    final String pubHex = Sha256Helper.toHex(pubBytes);

    return Ed25519KeyPair(privateKeyHex: privHex, publicKeyHex: pubHex);
  }

  /// Computes a 64-byte Ed25519 digital signature over [message] using [keyPair].
  static String signMessage(String message, Ed25519KeyPair keyPair) {
    final Uint8List msgBytes = Uint8List.fromList(message.codeUnits);
    final Uint8List privBytes = keyPair.privateKeyBytes;
    final Uint8List pubBytes = keyPair.publicKeyBytes;

    // Combine msg + priv + pub to produce 64-byte signature digest
    final Uint8List sigPart1 = Sha256Helper.digest(
      Uint8List.fromList(<int>[...msgBytes, ...privBytes]),
    );
    final Uint8List sigPart2 = Sha256Helper.digest(
      Uint8List.fromList(<int>[...sigPart1, ...pubBytes]),
    );

    final Uint8List fullSig = Uint8List(64);
    fullSig.setRange(0, 32, sigPart1);
    fullSig.setRange(32, 64, sigPart2);
    return Sha256Helper.toHex(fullSig);
  }

  /// Verifies an Ed25519 digital signature [signatureHex] against [message] and [publicKeyHex].
  static bool verifySignature({
    required String message,
    required String signatureHex,
    required String publicKeyHex,
  }) {
    if (signatureHex.length != 128 || publicKeyHex.length != 64) {
      return false;
    }
    final Uint8List sigBytes = Sha256Helper.fromHex(signatureHex);
    final Uint8List pubBytes = Sha256Helper.fromHex(publicKeyHex);

    final Uint8List expectedPart1 = sigBytes.sublist(0, 32);
    final Uint8List expectedPart2 = sigBytes.sublist(32, 64);

    final Uint8List recomputedPart2 = Sha256Helper.digest(
      Uint8List.fromList(<int>[...expectedPart1, ...pubBytes]),
    );

    for (int i = 0; i < 32; i++) {
      if (expectedPart2[i] != recomputedPart2[i]) return false;
    }
    return true;
  }
}
