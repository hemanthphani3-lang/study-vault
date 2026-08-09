import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/network/api_client.dart';
import 'package:study_vault/core/sharing/advertisement_service.dart';
import 'package:study_vault/core/sharing/content_sharing_manager.dart';
import 'package:study_vault/core/sharing/sharing_models.dart';
import 'package:study_vault/core/sharing/sharing_policy_engine.dart';
import 'package:study_vault/core/sharing/tracker_publisher.dart';

void main() {
  group('SharingPolicyEngine', () {
    late SharingPolicyEngine engine;

    setUp(() {
      engine = SharingPolicyEngine(
        initialPolicy: const SharingPolicy(
          allowMobileData: false,
          minBatteryLevelPercentage: 20,
          requireCharging: false,
          maxSharedQuotaBytes: 10737418240,
          maxConcurrentUploads: 5,
        ),
      );
    });

    test('isSharingPermitted requires Wi-Fi when allowMobileData is false', () {
      final wifiPermitted = engine.isSharingPermitted(
        isWifiConnected: true,
        batteryPercentage: 80,
        isCharging: false,
        currentSharedSizeBytes: 1000,
        activeUploadsCount: 0,
      );
      expect(wifiPermitted, isTrue);

      final mobilePermitted = engine.isSharingPermitted(
        isWifiConnected: false,
        batteryPercentage: 80,
        isCharging: false,
        currentSharedSizeBytes: 1000,
        activeUploadsCount: 0,
      );
      expect(mobilePermitted, isFalse);
    });

    test('isSharingPermitted pauses when battery is below threshold and not charging', () {
      final lowBatteryPermitted = engine.isSharingPermitted(
        isWifiConnected: true,
        batteryPercentage: 15,
        isCharging: false,
        currentSharedSizeBytes: 1000,
        activeUploadsCount: 0,
      );
      expect(lowBatteryPermitted, isFalse);

      final chargingLowBatteryPermitted = engine.isSharingPermitted(
        isWifiConnected: true,
        batteryPercentage: 15,
        isCharging: true,
        currentSharedSizeBytes: 1000,
        activeUploadsCount: 0,
      );
      expect(chargingLowBatteryPermitted, isTrue);
    });
  });

  group('AdvertisementService Payload Sanitization', () {
    test('createPayload creates sanitized advertisement without local file paths or private keys', () {
      final adService = AdvertisementService();
      final payload = adService.createPayload(
        nodeId: 'node_alpha_01',
        metadataId: 'res_paper_101',
        cid: 'bafybeic11223344556677889900112233445566',
      );

      final jsonMap = payload.toJson();
      expect(jsonMap.containsKey('node_id'), isTrue);
      expect(jsonMap.containsKey('metadata_id'), isTrue);
      expect(jsonMap.containsKey('cid'), isTrue);
      expect(jsonMap.containsKey('local_path'), isFalse);
      expect(jsonMap.containsKey('private_key'), isFalse);
      expect(jsonMap.containsKey('secret'), isFalse);
    });
  });

  group('ContentSharingManager Automatic Workflow', () {
    late ContentSharingManager manager;

    setUp(() {
      final client = ApiClient();
      final publisher = TrackerPublisher(apiClient: client);
      manager = ContentSharingManager(
        nodeId: 'node_test_01',
        trackerPublisher: publisher,
      );
    });

    test('registerCompletedDownload automatically advertises verified download', () async {
      final record = await manager.registerCompletedDownload(
        metadataId: 'res_math_101',
        title: 'Linear Algebra.pdf',
        cid: 'bafybeic00112233445566778899001122334455',
        fileSizeBytes: 1048576,
      );

      expect(record.status, SharingStatus.advertised);
      expect(manager.advertisedCatalog.length, 1);

      final telemetry = manager.getTelemetry();
      expect(telemetry.totalSharedCount, 1);
      expect(telemetry.advertisedCount, 1);
    });

    test('unadvertiseResource removes resource from active tracker announcements', () async {
      final record = await manager.registerCompletedDownload(
        metadataId: 'res_physics_101',
        title: 'Classical Mechanics.pdf',
        cid: 'bafybeic99887766554433221100998877665544',
        fileSizeBytes: 2048576,
      );

      expect(record.isAdvertised, isTrue);

      await manager.unadvertiseResource(record.cid);
      expect(manager.advertisedCatalog.isEmpty, isTrue);
    });
  });
}
