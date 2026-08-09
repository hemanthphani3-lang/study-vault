import 'advertisement_service.dart';
import 'sharing_models.dart';
import 'sharing_policy_engine.dart';
import 'tracker_publisher.dart';

/// Central Automatic Content Sharing Manager for SVCS/1.0.
/// Automatically advertises verified downloaded resources to the network.
class ContentSharingManager {
  ContentSharingManager({
    required String nodeId,
    SharingPolicyEngine? policyEngine,
    AdvertisementService? advertisementService,
    required TrackerPublisher trackerPublisher,
  })  : _nodeId = nodeId,
        _policyEngine = policyEngine ?? SharingPolicyEngine(),
        _advertisementService = advertisementService ?? AdvertisementService(),
        _trackerPublisher = trackerPublisher;

  final String _nodeId;
  final SharingPolicyEngine _policyEngine;
  final AdvertisementService _advertisementService;
  final TrackerPublisher _trackerPublisher;

  final Map<String, SharedResourceRecord> _catalog = <String, SharedResourceRecord>{};

  // Hardware / Network state (mocked or polled)
  bool isWifiConnected = true;
  int batteryPercentage = 85;
  bool isCharging = false;
  int activeUploadsCount = 0;

  List<SharedResourceRecord> get catalog => _catalog.values.toList();
  List<SharedResourceRecord> get advertisedCatalog =>
      _catalog.values.where((SharedResourceRecord r) => r.isAdvertised).toList();

  /// Invoked automatically when a download completes, passes SVSG & DCA CID pinning.
  Future<SharedResourceRecord> registerCompletedDownload({
    required String metadataId,
    required String title,
    required String cid,
    required int fileSizeBytes,
  }) async {
    final now = DateTime.now().toUtc();
    var record = SharedResourceRecord(
      metadataId: metadataId,
      cid: cid,
      title: title,
      fileSizeBytes: fileSizeBytes,
      status: SharingStatus.eligible,
      createdAt: now,
    );

    _catalog[cid] = record;
    await evaluateAndAdvertise(cid);
    return _catalog[cid]!;
  }

  /// Evaluates sharing policy for a resource and advertises it to the tracker if permitted.
  Future<bool> evaluateAndAdvertise(String cid) async {
    var record = _catalog[cid];
    if (record == null) return false;

    final int currentTotalSize = _catalog.values
        .where((SharedResourceRecord r) => r.isAdvertised)
        .fold(0, (int sum, SharedResourceRecord r) => sum + r.fileSizeBytes);

    final bool permitted = _policyEngine.isSharingPermitted(
      isWifiConnected: isWifiConnected,
      batteryPercentage: batteryPercentage,
      isCharging: isCharging,
      currentSharedSizeBytes: currentTotalSize,
      activeUploadsCount: activeUploadsCount,
    );

    if (permitted) {
      final payload = _advertisementService.createPayload(
        nodeId: _nodeId,
        metadataId: record.metadataId,
        cid: record.cid,
      );

      final bool pubSuccess = await _trackerPublisher.publishAdvertisement(payload);
      if (pubSuccess) {
        record = record.copyWith(
          status: SharingStatus.advertised,
          advertisedAt: DateTime.now().toUtc(),
        );
        _catalog[cid] = record;
        return true;
      }
    } else {
      record = record.copyWith(status: SharingStatus.paused);
      _catalog[cid] = record;
    }
    return false;
  }

  /// Evaluates sharing state across all catalog items (e.g. when network or battery state changes).
  Future<void> reevaluateAllPolicies() async {
    for (final cid in _catalog.keys) {
      await evaluateAndAdvertise(cid);
    }
  }

  /// Manually unadvertises a resource.
  Future<void> unadvertiseResource(String cid) async {
    var record = _catalog[cid];
    if (record != null) {
      await _trackerPublisher.withdrawAdvertisement(_nodeId, cid);
      _catalog[cid] = record.copyWith(status: SharingStatus.unadvertised);
    }
  }

  SharingTelemetry getTelemetry() {
    final int advertised = advertisedCatalog.length;
    final int paused = _catalog.values.where((SharedResourceRecord r) => r.status == SharingStatus.paused).length;
    final int totalUpload = _catalog.values.fold(0, (int sum, SharedResourceRecord r) => sum + r.totalUploadBytes);

    return SharingTelemetry(
      totalSharedCount: _catalog.length,
      advertisedCount: advertised,
      pausedCount: paused,
      totalUploadBytes: totalUpload,
      currentUploadSpeedBps: 0.0,
    );
  }
}
