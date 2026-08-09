import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/dca/cid_manager.dart';
import 'package:study_vault/core/dca/dca_models.dart';
import 'package:study_vault/core/dca/integrity_service.dart';
import 'package:study_vault/core/dca/ipfs_adapter.dart';
import 'package:study_vault/core/dca/storage_manager.dart';

void main() {
  group('CidManager', () {
    late CidManager cidManager;

    setUp(() {
      cidManager = CidManager();
    });

    test('generateCid produces valid CIDv1 prefix bafybeic', () {
      final Uint8List payload = Uint8List.fromList(List.generate(1024, (i) => i % 256));
      final String cid = cidManager.generateCid(payload);

      expect(cid, startsWith('bafybeic'));
      expect(cid.length, 40); // 8 prefix + 32 hex
      expect(cidManager.isValidCidFormat(cid), isTrue);
    });

    test('verifyContentCid accurately detects matching vs corrupted payload', () {
      final Uint8List validPayload = Uint8List.fromList(List.generate(512, (i) => i % 256));
      final String validCid = cidManager.generateCid(validPayload);

      final matchResult = cidManager.verifyContentCid(validCid, validPayload);
      expect(matchResult.isValid, isTrue);

      final Uint8List tamperedPayload = Uint8List.fromList(List.generate(512, (i) => (i + 1) % 256));
      final mismatchResult = cidManager.verifyContentCid(validCid, tamperedPayload);
      expect(mismatchResult.isValid, isFalse);
    });
  });

  group('IpfsAdapter & LocalContentRegistry', () {
    late IpfsAdapter adapter;

    setUp(() {
      adapter = IpfsAdapter();
    });

    test('storeContent writes to registry and pins by default', () async {
      final Uint8List bytes = Uint8List.fromList(List.generate(2048, (i) => i % 256));
      final record = await adapter.storeContent(bytes, metadataId: 'res_math_101');

      expect(record.cid, startsWith('bafybeic'));
      expect(record.fileSizeBytes, 2048);
      expect(record.pinStatus, PinStatus.pinned);

      final retrieved = await adapter.retrieveContent(record.cid);
      expect(retrieved, equals(bytes));

      final pins = await adapter.listPins();
      expect(pins.length, 1);
      expect(pins.first.cid, record.cid);
    });

    test('unpinContent and pinContent update pinning state', () async {
      final Uint8List bytes = Uint8List.fromList(List.generate(1024, (i) => i % 256));
      final record = await adapter.storeContent(bytes, metadataId: 'res_physics_201');

      final unpinned = await adapter.unpinContent(record.cid);
      expect(unpinned, isTrue);

      final pinsAfterUnpin = await adapter.listPins();
      expect(pinsAfterUnpin.isEmpty, isTrue);

      final pinnedAgain = await adapter.pinContent(record.cid);
      expect(pinnedAgain, isTrue);

      final pinsAfterRepin = await adapter.listPins();
      expect(pinsAfterRepin.length, 1);
    });

    test('getStorageMetrics returns accurate telemetry', () async {
      final Uint8List bytes1 = Uint8List.fromList(List.generate(1000, (i) => i % 256));
      final Uint8List bytes2 = Uint8List.fromList(List.generate(2000, (i) => i % 256));

      await adapter.storeContent(bytes1, metadataId: 'res_1');
      await adapter.storeContent(bytes2, metadataId: 'res_2');

      final metrics = await adapter.getStorageMetrics();
      expect(metrics.totalCidCount, 2);
      expect(metrics.pinnedCidCount, 2);
      expect(metrics.totalSizeBytes, 3000);
      expect(metrics.quotaSizeBytes, 10737418240);
    });
  });

  group('IntegrityService & StorageManager', () {
    late IpfsAdapter adapter;
    late IntegrityService integrityService;
    late StorageManager storageManager;

    setUp(() {
      adapter = IpfsAdapter();
      integrityService = IntegrityService(dcaInterface: adapter);
      storageManager = StorageManager(dcaInterface: adapter);
    });

    test('IntegrityService audits pinned content cleanly', () async {
      final Uint8List bytes = Uint8List.fromList(List.generate(4096, (i) => i % 256));
      await adapter.storeContent(bytes, metadataId: 'res_audit_01');

      final results = await integrityService.auditAllContent();
      expect(results.length, 1);
      expect(results.first.isValid, isTrue);
    });

    test('StorageManager tracks quota usage', () async {
      final metrics = await storageManager.fetchMetrics();
      expect(metrics.quotaSizeBytes, 10737418240);
      expect(metrics.usageRatio, 0.0);
    });
  });
}
