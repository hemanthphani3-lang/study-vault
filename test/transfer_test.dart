import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/crypto/sha256_helper.dart';
import 'package:study_vault/core/transfer/bandwidth_limiter.dart';
import 'package:study_vault/core/transfer/chunk_manager.dart';
import 'package:study_vault/core/transfer/chunk_model.dart';
import 'package:study_vault/core/transfer/transfer_manager.dart';
import 'package:study_vault/core/transfer/transfer_session.dart';

void main() {
  group('ChunkManager & SHA-256 Verification', () {
    late ChunkManager manager;

    setUp(() {
      manager = ChunkManager(chunkSizeBytes: 256); // 256 byte test chunks
    });

    test('prepareManifest splits file into correct number of chunks', () {
      final manifest = manager.prepareManifest(1000); // 1000 bytes -> 4 chunks (256*3 + 232)
      expect(manifest.length, 4);
      expect(manifest[0].sizeBytes, 256);
      expect(manifest[3].sizeBytes, 232);
    });

    test('processReceivedChunk verifies SHA-256 checksum correctly', () {
      final Uint8List payload = Uint8List.fromList(List.generate(256, (i) => i % 256));
      final String expectedHash = Sha256Helper.toHex(Sha256Helper.digest(payload));

      const chunk = ChunkModel(index: 0, sizeBytes: 256, checksumHex: 'SHA256_PENDING_0');
      final verified = manager.processReceivedChunk(chunk, payload);

      expect(verified.status, ChunkStatus.verified);
      expect(verified.isVerified, isTrue);
      expect(verified.checksumHex, expectedHash);
    });

    test('getMissingChunkIndices returns unverified chunks', () {
      final chunks = <ChunkModel>[
        const ChunkModel(index: 0, sizeBytes: 256, checksumHex: 'c0', status: ChunkStatus.verified),
        const ChunkModel(index: 1, sizeBytes: 256, checksumHex: 'c1', status: ChunkStatus.pending),
        const ChunkModel(index: 2, sizeBytes: 256, checksumHex: 'c2', status: ChunkStatus.corrupted),
      ];

      final missing = manager.getMissingChunkIndices(chunks);
      expect(missing, equals(<int>[1, 2]));
    });

    test('assembleChunks combines verified payload bytes losslessly', () {
      final Uint8List data0 = Uint8List.fromList(<int>[1, 2, 3]);
      final Uint8List data1 = Uint8List.fromList(<int>[4, 5, 6]);

      final chunks = <ChunkModel>[
        ChunkModel(index: 0, sizeBytes: 3, checksumHex: 'c0', status: ChunkStatus.verified, data: data0),
        ChunkModel(index: 1, sizeBytes: 3, checksumHex: 'c1', status: ChunkStatus.verified, data: data1),
      ];

      final assembled = manager.assembleChunks(chunks);
      expect(assembled, equals(Uint8List.fromList(<int>[1, 2, 3, 4, 5, 6])));
    });
  });

  group('BandwidthLimiter', () {
    test('bandwidth limiter calculates speed and ETA', () {
      final limiter = BandwidthLimiter();
      limiter.updateProgress(0);
      limiter.updateProgress(1024 * 1024); // 1 MB downloaded

      expect(limiter.formattedSpeed, contains('B/s'));
      final int eta = limiter.estimateEtaSeconds(1024 * 1024);
      expect(eta, greaterThanOrEqualTo(0));
    });
  });

  group('TransferManager Session Lifecycle', () {
    late TransferManager transferManager;

    setUp(() {
      transferManager = TransferManager();
    });

    test('startTransfer creates session and initiates state transitions', () async {
      final mockData = Uint8List.fromList(List.generate(1024, (i) => i % 256));
      final session = await transferManager.startTransfer(
        metadataId: 'res_test_001',
        title: 'Test Paper.pdf',
        targetPeerId: 'node_peer_1',
        fileSizeBytes: mockData.length,
        authToken: 'svsg_auth_test_token_01',
        mockSourceBuffer: mockData,
      );

      expect(session.sessionId, startsWith('sess_'));
      expect(session.fileSizeBytes, 1024);

      // Await lifecycle state transitions
      await Future<void>.delayed(const Duration(milliseconds: 600));

      final active = transferManager.getSession(session.sessionId);
      expect(active, isNotNull);
      expect(
        active!.status == TransferState.downloading ||
            active.status == TransferState.verifying ||
            active.status == TransferState.completed,
        isTrue,
      );
    });

    test('pauseTransfer and resumeTransfer update state machine cleanly', () async {
      final mockData = Uint8List.fromList(List.generate(500000, (i) => i % 256));
      final session = await transferManager.startTransfer(
        metadataId: 'res_pause_test',
        title: 'Pause Test.pdf',
        targetPeerId: 'node_peer_2',
        fileSizeBytes: mockData.length,
        authToken: 'svsg_auth_test_token_02',
      );

      await Future<void>.delayed(const Duration(milliseconds: 400));
      final paused = transferManager.pauseTransfer(session.sessionId);
      expect(paused.status, TransferState.paused);

      final resumed = transferManager.resumeTransfer(session.sessionId);
      expect(resumed.status, TransferState.resuming);
    });

    test('cancelTransfer stops transfer session', () async {
      final session = await transferManager.startTransfer(
        metadataId: 'res_cancel_test',
        title: 'Cancel Test.pdf',
        targetPeerId: 'node_peer_3',
        fileSizeBytes: 100000,
        authToken: 'svsg_auth_test_token_03',
      );

      final cancelled = transferManager.cancelTransfer(session.sessionId);
      expect(cancelled.status, TransferState.cancelled);
    });
  });
}
