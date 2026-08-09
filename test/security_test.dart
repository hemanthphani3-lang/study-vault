import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/crypto/ed25519.dart';
import 'package:study_vault/core/security/policy_engine.dart';
import 'package:study_vault/core/security/security_audit_logger.dart';
import 'package:study_vault/core/security/security_models.dart';
import 'package:study_vault/core/security/verification_pipeline.dart';
import 'package:study_vault/core/transfer/transfer_manager.dart';
import 'package:study_vault/core/transfer/transfer_session.dart';

void main() {
  group('PolicyEngine & Verification Pipeline', () {
    late PolicyEngine policyEngine;
    late SecurityAuditLogger auditLogger;
    late VerificationPipeline pipeline;

    setUp(() {
      policyEngine = PolicyEngine();
      auditLogger = SecurityAuditLogger();
      pipeline = VerificationPipeline(policyEngine: policyEngine, auditLogger: auditLogger);
    });

    test('Valid request passes 11-stage verification and receives auth token', () {
      final keyPair = Ed25519.generateKeyPair();
      final DateTime now = DateTime.now().toUtc();
      const String nonce = 'nonce_valid_001';
      const String nodeId = 'node_client_01';

      final String signature = Ed25519.signMessage(
        '$nodeId:${now.toIso8601String()}:$nonce',
        keyPair,
      );

      final request = SecurityAuthRequest(
        nodeId: nodeId,
        publicKeyHex: keyPair.publicKeyHex,
        fingerprint: 'SHA256:AA:BB:CC:DD:EE:FF:11:22',
        signatureHex: signature,
        timestamp: now,
        nonce: nonce,
        metadataId: 'res_math_101',
        targetPeerId: 'node_seeder_01',
        fileSizeBytes: 500000,
      );

      final response = pipeline.executePipeline(request);

      expect(response.isAuthorized, isTrue);
      expect(response.status, SecurityState.authorized);
      expect(response.authToken, startsWith('svsg_auth_'));
      expect(response.validationResults['signature_valid'], isTrue);
      expect(response.validationResults['nonce_uniqueness'], isTrue);
    });

    test('Replay attack with duplicate nonce is rejected', () {
      final keyPair = Ed25519.generateKeyPair();
      final DateTime now = DateTime.now().toUtc();
      const String nonce = 'nonce_replay_test';
      const String nodeId = 'node_client_02';

      final String signature = Ed25519.signMessage(
        '$nodeId:${now.toIso8601String()}:$nonce',
        keyPair,
      );

      final request = SecurityAuthRequest(
        nodeId: nodeId,
        publicKeyHex: keyPair.publicKeyHex,
        fingerprint: 'SHA256:AA:BB:CC:DD:EE:FF:11:22',
        signatureHex: signature,
        timestamp: now,
        nonce: nonce,
        metadataId: 'res_math_101',
        targetPeerId: 'node_seeder_01',
        fileSizeBytes: 500000,
      );

      // Attempt 1: Success
      final resp1 = pipeline.executePipeline(request);
      expect(resp1.isAuthorized, isTrue);

      // Attempt 2 (identical nonce): Rejected!
      final resp2 = pipeline.executePipeline(request);
      expect(resp2.isAuthorized, isFalse);
      expect(resp2.status, SecurityState.rejected);
      expect(resp2.validationResults['nonce_uniqueness'], isFalse);
    });

    test('Expired timestamp (>300s drift) is rejected', () {
      final keyPair = Ed25519.generateKeyPair();
      final DateTime expiredTime = DateTime.now().toUtc().subtract(const Duration(seconds: 400));
      const String nonce = 'nonce_expired_001';
      const String nodeId = 'node_client_03';

      final request = SecurityAuthRequest(
        nodeId: nodeId,
        publicKeyHex: keyPair.publicKeyHex,
        fingerprint: 'SHA256:AA:BB:CC:DD:EE:FF:11:22',
        signatureHex: '11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff',
        timestamp: expiredTime,
        nonce: nonce,
        metadataId: 'res_math_101',
        targetPeerId: 'node_seeder_01',
        fileSizeBytes: 500000,
      );

      final response = pipeline.executePipeline(request);
      expect(response.isAuthorized, isFalse);
      expect(response.validationResults['timestamp_freshness'], isFalse);
    });

    test('Protocol version mismatch is rejected', () {
      final request = SecurityAuthRequest(
        nodeId: 'node_test',
        publicKeyHex: '0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9',
        fingerprint: 'SHA256:AA:BB:CC:DD:EE:FF:11:22',
        signatureHex: '11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff',
        timestamp: DateTime.now().toUtc(),
        nonce: 'nonce_version_bad',
        metadataId: 'res_math_101',
        targetPeerId: 'node_seeder_01',
        fileSizeBytes: 500000,
        svsgVersion: 'INVALID_VER/0.1',
      );

      final response = pipeline.executePipeline(request);
      expect(response.isAuthorized, isFalse);
      expect(response.validationResults['protocol_version'], isFalse);
    });
  });

  group('Sanitized Security Audit Logger', () {
    test('Audit logger sanitizes private keys and secrets', () {
      final logger = SecurityAuditLogger();
      logger.logEvent(
        nodeId: 'node_test',
        sessionId: 'sess_001',
        eventType: 'POLICY_VIOLATION',
        policyDecision: 'REJECTED',
        details: 'Attempted login with privKey=0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9',
      );

      expect(logger.logs.length, 1);
      final log = logger.logs.first;
      expect(log.details, contains('[PRIVATE_KEY_MASKED]'));
      expect(log.details, isNot(contains('0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9')));
    });
  });

  group('TransferManager Authorization Enforcement', () {
    test('TransferManager rejects transfers without valid SVSG auth token', () async {
      final manager = TransferManager();
      final session = await manager.startTransfer(
        metadataId: 'res_unauthorized',
        title: 'Unauthorized Download.pdf',
        targetPeerId: 'node_peer_untrusted',
        fileSizeBytes: 100000,
        authToken: null, // Missing token
      );

      expect(session.status, TransferState.failed);
      expect(session.errorMessage, contains('SVSG Security Gateway Authorization Required'));
    });

    test('TransferManager accepts transfers with valid SVSG auth token', () async {
      final manager = TransferManager();
      final session = await manager.startTransfer(
        metadataId: 'res_authorized',
        title: 'Authorized Download.pdf',
        targetPeerId: 'node_peer_trusted',
        fileSizeBytes: 100000,
        authToken: 'svsg_auth_0a1b2c3d4e5f60718293a4b5c6d7e8f9', // Valid SVSG token
      );

      expect(session.status, isNot(TransferState.failed));
    });
  });
}
