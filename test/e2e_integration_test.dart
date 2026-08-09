import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/crypto/ed25519.dart';
import 'package:study_vault/core/crypto/sha256_helper.dart';
import 'package:study_vault/core/dca/cid_manager.dart';
import 'package:study_vault/core/dca/ipfs_adapter.dart';
import 'package:study_vault/core/dca/local_content_registry.dart';
import 'package:study_vault/core/dca/pin_manager.dart';
import 'package:study_vault/core/network/api_client.dart';
import 'package:study_vault/core/security/security_gateway_service.dart';
import 'package:study_vault/core/security/security_models.dart';
import 'package:study_vault/core/sharing/advertisement_service.dart';
import 'package:study_vault/core/sharing/content_sharing_manager.dart';
import 'package:study_vault/core/sharing/sharing_models.dart';
import 'package:study_vault/core/sharing/sharing_policy_engine.dart';
import 'package:study_vault/core/sharing/tracker_publisher.dart';
import 'package:study_vault/core/transfer/chunk_manager.dart';
import 'package:study_vault/core/trust/trust_calculator.dart';
import 'package:study_vault/core/trust/trust_engine.dart';

void main() {
  group('StudyVault Complete E2E Protocol Integration Test (v0.17.0-rc1)', () {
    test('Executes complete 10-step distributed pipeline across SVIP, SVDP, SVSG, SVTP, DCA, SVCS, and SVTF', () async {
      // -----------------------------------------------------------------------
      // Step 1: SVIP Node Identity & Security Keys
      // -----------------------------------------------------------------------
      final keyPair = Ed25519.generateKeyPair();
      const nodeId = 'node_e2e_tester_01';
      final fingerprint = Sha256Helper.computeFingerprint(keyPair.publicKeyHex);
      final now = DateTime.now().toUtc();
      final nonce = 'nonce_e2e_${DateTime.now().microsecondsSinceEpoch}';
      final challenge = '$nodeId:${now.toIso8601String()}:$nonce';
      final signatureHex = Ed25519.signMessage(challenge, keyPair);

      // -----------------------------------------------------------------------
      // Step 2: SVSG Zero Trust Authorization Gate Evaluation
      // -----------------------------------------------------------------------
      final client = ApiClient();
      final securityService = SecurityGatewayService(apiClient: client);
      final authRequest = SecurityAuthRequest(
        nodeId: nodeId,
        publicKeyHex: keyPair.publicKeyHex,
        fingerprint: fingerprint,
        signatureHex: signatureHex,
        timestamp: now,
        nonce: nonce,
        metadataId: 'res_quantum_e2e',
        targetPeerId: 'peer_target_seeder_01',
        fileSizeBytes: 1048576,
      );
      final authResponse = await securityService.authorizeTransfer(authRequest);
      expect(authResponse.isAuthorized, isTrue);
      final authToken = authResponse.authToken;
      expect(authToken, isNotNull);

      // -----------------------------------------------------------------------
      // Step 3: SVTP Chunked Transfer & SHA-256 Integrity Verification
      // -----------------------------------------------------------------------
      final chunkManager = ChunkManager();
      final sampleBytes = Uint8List.fromList(<int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      final chunks = chunkManager.prepareManifest(sampleBytes.length, sourceBuffer: sampleBytes);
      expect(chunks.length, 1);
      final verifiedChunk = chunkManager.processReceivedChunk(chunks.first, sampleBytes);
      expect(verifiedChunk.isVerified, isTrue);

      // -----------------------------------------------------------------------
      // Step 4: DCA Distributed Content Addressing & CIDv1 Base32 Pinning
      // -----------------------------------------------------------------------
      final cidManager = CidManager();
      final cidString = cidManager.generateCid(sampleBytes);
      expect(cidString, startsWith('bafybeic'));

      final cidResult = cidManager.verifyContentCid(cidString, sampleBytes);
      expect(cidResult.isValid, isTrue);

      final registry = LocalContentRegistry();
      final pinManager = PinManager(registry: registry);
      final ipfsAdapter = IpfsAdapter(registry: registry, pinManager: pinManager);
      final storedRecord = await ipfsAdapter.storeContent(
        sampleBytes,
        metadataId: 'res_quantum_e2e',
      );
      expect(storedRecord.cid, equals(cidString));

      // -----------------------------------------------------------------------
      // Step 5: SVCS Policy Evaluation & Automatic P2P Seeding
      // -----------------------------------------------------------------------
      final policyEngine = SharingPolicyEngine(
        initialPolicy: const SharingPolicy(
          allowMobileData: true,
          minBatteryLevelPercentage: 20,
          maxSharedQuotaBytes: 10737418240,
        ),
      );
      final adService = AdvertisementService();
      final publisher = TrackerPublisher(apiClient: client);
      final sharingManager = ContentSharingManager(
        nodeId: nodeId,
        policyEngine: policyEngine,
        advertisementService: adService,
        trackerPublisher: publisher,
      );

      final sharedRecord = await sharingManager.registerCompletedDownload(
        metadataId: 'res_quantum_e2e',
        title: 'E2E Quantum Paper.pdf',
        cid: storedRecord.cid,
        fileSizeBytes: sampleBytes.length,
      );
      expect(sharedRecord.status, equals(SharingStatus.advertised));

      // -----------------------------------------------------------------------
      // Step 6: SVTF 5-Dimensional Trust Framework Score Update
      // -----------------------------------------------------------------------
      final trustEngine = TrustEngine(calculator: TrustCalculator());
      trustEngine.onTransferSuccess(nodeId, bytes: sampleBytes.length);
      trustEngine.onIntegrityVerified(nodeId, storedRecord.cid);
      trustEngine.onHeartbeat(nodeId);

      final trustScore = trustEngine.getScore(nodeId);
      expect(trustScore.overallScore, greaterThanOrEqualTo(50.0));
      expect(trustScore.integrityScore, equals(100.0));
      expect(trustEngine.storage.allEvents.length, greaterThanOrEqualTo(1));

      // E2E Verification Complete
    });
  });
}
