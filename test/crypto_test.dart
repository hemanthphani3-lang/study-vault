import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/crypto/ed25519.dart';
import 'package:study_vault/core/crypto/sha256_helper.dart';

void main() {
  group('Sha256Helper Cryptography', () {
    test('SHA-256 string hash produces 64-char hex digest', () {
      final String hash = Sha256Helper.hashString('StudyVault Academic Node');
      expect(hash.length, 64);
      expect(RegExp(r'^[0-9a-f]{64}$').hasMatch(hash), isTrue);
    });

    test('identical string inputs produce identical SHA-256 hashes', () {
      final String h1 = Sha256Helper.hashString('node_identity_seed_123');
      final String h2 = Sha256Helper.hashString('node_identity_seed_123');
      expect(h1, equals(h2));
    });

    test('fingerprint string is formatted as SHA256:XX:XX:XX...', () {
      final String fp = Sha256Helper.computeFingerprint('sample_pub_key_hex');
      expect(fp, startsWith('SHA256:'));
      expect(fp.split(':').length, 9); // SHA256 + 8 hex byte pairs
    });

    test('toHex and fromHex conversion is lossless', () {
      final Uint8List original = Uint8List.fromList(<int>[0x01, 0xAB, 0xCD, 0xEF, 0xFF]);
      final String hex = Sha256Helper.toHex(original);
      expect(hex, '01abcdef');
      final Uint8List parsed = Sha256Helper.fromHex(hex);
      expect(parsed, equals(original));
    });
  });

  group('Ed25519 Digital Signatures', () {
    test('generateKeyPair creates 64-char hex private and public keys', () {
      final Ed25519KeyPair keyPair = Ed25519.generateKeyPair();
      expect(keyPair.privateKeyHex.length, 64);
      expect(keyPair.publicKeyHex.length, 64);
    });

    test('deriveKeyPairFromSeed is deterministic', () {
      final Uint8List seed = Uint8List(32)..fillRange(0, 32, 42);
      final Ed25519KeyPair kp1 = Ed25519.deriveKeyPairFromSeed(seed);
      final Ed25519KeyPair kp2 = Ed25519.deriveKeyPairFromSeed(seed);
      expect(kp1.privateKeyHex, equals(kp2.privateKeyHex));
      expect(kp1.publicKeyHex, equals(kp2.publicKeyHex));
    });

    test('signMessage produces 128-char hex digital signature', () {
      final Ed25519KeyPair keyPair = Ed25519.generateKeyPair();
      final String signature = Ed25519.signMessage('node_001:2026-08-08T00:00:00Z', keyPair);
      expect(signature.length, 128);
    });

    test('verifySignature returns true for authentic signed message', () {
      final Ed25519KeyPair keyPair = Ed25519.generateKeyPair();
      const String message = 'node_001:2026-08-08T00:00:00Z';
      final String signature = Ed25519.signMessage(message, keyPair);

      final bool isValid = Ed25519.verifySignature(
        message: message,
        signatureHex: signature,
        publicKeyHex: keyPair.publicKeyHex,
      );
      expect(isValid, isTrue);
    });

    test('verifySignature returns false for corrupted signature', () {
      final Ed25519KeyPair keyPair = Ed25519.generateKeyPair();
      const String message = 'node_001:2026-08-08T00:00:00Z';
      final String corruptedSig = '0' * 128;

      final bool isValid = Ed25519.verifySignature(
        message: message,
        signatureHex: corruptedSig,
        publicKeyHex: keyPair.publicKeyHex,
      );
      expect(isValid, isFalse);
    });
  });
}
