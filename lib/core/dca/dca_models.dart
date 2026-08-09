enum PinStatus { pinned, direct, recursive, unpinned, failed }

/// Local Content Registry Record for a DCA item.
class ContentRecord {
  const ContentRecord({
    required this.cid,
    required this.localPath,
    required this.metadataId,
    this.pinStatus = PinStatus.pinned,
    required this.fileSizeBytes,
    required this.checksumHex,
    required this.createdTime,
    required this.lastAccessTime,
    this.referenceCount = 1,
  });

  final String cid;
  final String localPath;
  final String metadataId;
  final PinStatus pinStatus;
  final int fileSizeBytes;
  final String checksumHex;
  final DateTime createdTime;
  final DateTime lastAccessTime;
  final int referenceCount;

  bool get isPinned => pinStatus == PinStatus.pinned || pinStatus == PinStatus.direct;

  ContentRecord copyWith({
    String? cid,
    String? localPath,
    String? metadataId,
    PinStatus? pinStatus,
    int? fileSizeBytes,
    String? checksumHex,
    DateTime? createdTime,
    DateTime? lastAccessTime,
    int? referenceCount,
  }) {
    return ContentRecord(
      cid: cid ?? this.cid,
      localPath: localPath ?? this.localPath,
      metadataId: metadataId ?? this.metadataId,
      pinStatus: pinStatus ?? this.pinStatus,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      checksumHex: checksumHex ?? this.checksumHex,
      createdTime: createdTime ?? this.createdTime,
      lastAccessTime: lastAccessTime ?? this.lastAccessTime,
      referenceCount: referenceCount ?? this.referenceCount,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cid': cid,
      'local_path': localPath,
      'metadata_id': metadataId,
      'pin_status': pinStatus.name,
      'file_size_bytes': fileSizeBytes,
      'checksum': checksumHex,
      'created_time': createdTime.toIso8601String(),
      'last_access_time': lastAccessTime.toIso8601String(),
      'reference_count': referenceCount,
    };
  }

  factory ContentRecord.fromJson(Map<String, dynamic> json) {
    return ContentRecord(
      cid: json['cid'] as String? ?? '',
      localPath: json['local_path'] as String? ?? '',
      metadataId: json['metadata_id'] as String? ?? '',
      pinStatus: PinStatus.values.firstWhere(
        (PinStatus p) => p.name == json['pin_status'],
        orElse: () => PinStatus.pinned,
      ),
      fileSizeBytes: json['file_size_bytes'] as int? ?? 0,
      checksumHex: json['checksum'] as String? ?? '',
      createdTime: json['created_time'] != null ? DateTime.parse(json['created_time'] as String) : DateTime.now(),
      lastAccessTime: json['last_access_time'] != null ? DateTime.parse(json['last_access_time'] as String) : DateTime.now(),
      referenceCount: json['reference_count'] as int? ?? 1,
    );
  }
}

/// Telemetry metrics for DCA subsystem storage.
class StorageMetrics {
  const StorageMetrics({
    required this.totalCidCount,
    required this.pinnedCidCount,
    required this.totalSizeBytes,
    required this.quotaSizeBytes,
    required this.integrityFailuresCount,
  });

  final int totalCidCount;
  final int pinnedCidCount;
  final int totalSizeBytes;
  final int quotaSizeBytes;
  final int integrityFailuresCount;

  double get usageRatio => quotaSizeBytes == 0 ? 0.0 : (totalSizeBytes / quotaSizeBytes).clamp(0.0, 1.0);
  double get usagePercentage => usageRatio * 100.0;
}

/// CID validation result details.
class CidValidationResult {
  const CidValidationResult({
    required this.isValid,
    required this.cid,
    required this.computedHash,
    required this.details,
  });

  final bool isValid;
  final String cid;
  final String computedHash;
  final String details;
}
