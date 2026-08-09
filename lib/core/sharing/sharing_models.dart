enum SharingStatus { unverified, eligible, advertised, paused, unadvertised }

/// User-configurable sharing policy parameters for SVCS/1.0.
class SharingPolicy {
  const SharingPolicy({
    this.allowMobileData = false,
    this.minBatteryLevelPercentage = 20,
    this.requireCharging = false,
    this.maxSharedQuotaBytes = 10737418240, // 10 GB
    this.maxConcurrentUploads = 5,
  });

  final bool allowMobileData;
  final int minBatteryLevelPercentage;
  final bool requireCharging;
  final int maxSharedQuotaBytes;
  final int maxConcurrentUploads;

  SharingPolicy copyWith({
    bool? allowMobileData,
    int? minBatteryLevelPercentage,
    bool? requireCharging,
    int? maxSharedQuotaBytes,
    int? maxConcurrentUploads,
  }) {
    return SharingPolicy(
      allowMobileData: allowMobileData ?? this.allowMobileData,
      minBatteryLevelPercentage: minBatteryLevelPercentage ?? this.minBatteryLevelPercentage,
      requireCharging: requireCharging ?? this.requireCharging,
      maxSharedQuotaBytes: maxSharedQuotaBytes ?? this.maxSharedQuotaBytes,
      maxConcurrentUploads: maxConcurrentUploads ?? this.maxConcurrentUploads,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'allow_mobile_data': allowMobileData,
      'min_battery_level': minBatteryLevelPercentage,
      'require_charging': requireCharging,
      'max_shared_quota_bytes': maxSharedQuotaBytes,
      'max_concurrent_uploads': maxConcurrentUploads,
    };
  }
}

/// Catalog entry for an automatically shared academic resource.
class SharedResourceRecord {
  const SharedResourceRecord({
    required this.metadataId,
    required this.cid,
    required this.title,
    required this.fileSizeBytes,
    this.status = SharingStatus.eligible,
    required this.createdAt,
    this.advertisedAt,
    this.totalUploadBytes = 0,
  });

  final String metadataId;
  final String cid;
  final String title;
  final int fileSizeBytes;
  final SharingStatus status;
  final DateTime createdAt;
  final DateTime? advertisedAt;
  final int totalUploadBytes;

  bool get isAdvertised => status == SharingStatus.advertised;

  SharedResourceRecord copyWith({
    String? metadataId,
    String? cid,
    String? title,
    int? fileSizeBytes,
    SharingStatus? status,
    DateTime? createdAt,
    DateTime? advertisedAt,
    int? totalUploadBytes,
  }) {
    return SharedResourceRecord(
      metadataId: metadataId ?? this.metadataId,
      cid: cid ?? this.cid,
      title: title ?? this.title,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      advertisedAt: advertisedAt ?? this.advertisedAt,
      totalUploadBytes: totalUploadBytes ?? this.totalUploadBytes,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'metadata_id': metadataId,
      'cid': cid,
      'title': title,
      'file_size_bytes': fileSizeBytes,
      'status': status.name,
      'created_at': createdAt.toIso8601String(),
      'advertised_at': advertisedAt?.toIso8601String(),
      'total_upload_bytes': totalUploadBytes,
    };
  }
}

/// Sanitized Tracker Advertisement Payload.
/// Strictly excludes local file system paths and private keys.
class AdvertisementPayload {
  const AdvertisementPayload({
    required this.nodeId,
    required this.metadataId,
    required this.cid,
    this.capabilities = const <String>['peer_seeder', 'metadata_relay'],
    this.availability = 'online',
    this.storageStatus = 'pinned',
  });

  final String nodeId;
  final String metadataId;
  final String cid;
  final List<String> capabilities;
  final String availability;
  final String storageStatus;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'node_id': nodeId,
      'metadata_id': metadataId,
      'cid': cid,
      'capabilities': capabilities,
      'availability': availability,
      'storage_status': storageStatus,
    };
  }
}

/// Telemetry metrics for SVCS sharing.
class SharingTelemetry {
  const SharingTelemetry({
    required this.totalSharedCount,
    required this.advertisedCount,
    required this.pausedCount,
    required this.totalUploadBytes,
    required this.currentUploadSpeedBps,
  });

  final int totalSharedCount;
  final int advertisedCount;
  final int pausedCount;
  final int totalUploadBytes;
  final double currentUploadSpeedBps;
}
