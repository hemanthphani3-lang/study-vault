/// Immutable domain and data model representing P2P swarm telemetry, peer health, and DHT metrics.
class NetworkMetadataModel {
  const NetworkMetadataModel({
    required this.id,
    required this.swarmId,
    this.peerCount = 0,
    this.averageLatencyMs = 0,
    this.downloadSpeedBps = 0,
    this.uploadSpeedBps = 0,
    this.dhtReputationScore = 100.0,
    this.totalBytesShared = 0,
    this.totalBytesReceived = 0,
    this.lastHealthCheckAt,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
    this.deletedAt,
    this.syncStatus = 'synced',
    this.lastSyncedAt,
    this.remoteId,
    this.version = 1,
    this.isDirty = false,
    this.nodeId,
  });

  final String id;
  final String swarmId;
  final int peerCount;
  final int averageLatencyMs;
  final int downloadSpeedBps;
  final int uploadSpeedBps;
  final double dhtReputationScore;
  final int totalBytesShared;
  final int totalBytesReceived;
  final DateTime? lastHealthCheckAt;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isDeleted;
  final DateTime? deletedAt;
  final String syncStatus;
  final DateTime? lastSyncedAt;
  final String? remoteId;
  final int version;
  final bool isDirty;
  final String? nodeId;

  NetworkMetadataModel copyWith({
    String? id,
    String? swarmId,
    int? peerCount,
    int? averageLatencyMs,
    int? downloadSpeedBps,
    int? uploadSpeedBps,
    double? dhtReputationScore,
    int? totalBytesShared,
    int? totalBytesReceived,
    DateTime? lastHealthCheckAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    DateTime? deletedAt,
    String? syncStatus,
    DateTime? lastSyncedAt,
    String? remoteId,
    int? version,
    bool? isDirty,
    String? nodeId,
  }) {
    return NetworkMetadataModel(
      id: id ?? this.id,
      swarmId: swarmId ?? this.swarmId,
      peerCount: peerCount ?? this.peerCount,
      averageLatencyMs: averageLatencyMs ?? this.averageLatencyMs,
      downloadSpeedBps: downloadSpeedBps ?? this.downloadSpeedBps,
      uploadSpeedBps: uploadSpeedBps ?? this.uploadSpeedBps,
      dhtReputationScore: dhtReputationScore ?? this.dhtReputationScore,
      totalBytesShared: totalBytesShared ?? this.totalBytesShared,
      totalBytesReceived: totalBytesReceived ?? this.totalBytesReceived,
      lastHealthCheckAt: lastHealthCheckAt ?? this.lastHealthCheckAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'swarmId': swarmId,
      'peerCount': peerCount,
      'averageLatencyMs': averageLatencyMs,
      'downloadSpeedBps': downloadSpeedBps,
      'uploadSpeedBps': uploadSpeedBps,
      'dhtReputationScore': dhtReputationScore,
      'totalBytesShared': totalBytesShared,
      'totalBytesReceived': totalBytesReceived,
      'lastHealthCheckAt': lastHealthCheckAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
      'syncStatus': syncStatus,
      'lastSyncedAt': lastSyncedAt?.toIso8601String(),
      'remoteId': remoteId,
      'version': version,
      'isDirty': isDirty,
      'nodeId': nodeId,
    };
  }

  factory NetworkMetadataModel.fromJson(Map<String, dynamic> json) {
    return NetworkMetadataModel(
      id: json['id'] as String? ?? '',
      swarmId: json['swarmId'] as String? ?? '',
      peerCount: json['peerCount'] as int? ?? 0,
      averageLatencyMs: json['averageLatencyMs'] as int? ?? 0,
      downloadSpeedBps: json['downloadSpeedBps'] as int? ?? 0,
      uploadSpeedBps: json['uploadSpeedBps'] as int? ?? 0,
      dhtReputationScore: (json['dhtReputationScore'] as num?)?.toDouble() ?? 100.0,
      totalBytesShared: json['totalBytesShared'] as int? ?? 0,
      totalBytesReceived: json['totalBytesReceived'] as int? ?? 0,
      lastHealthCheckAt: json['lastHealthCheckAt'] != null ? DateTime.tryParse(json['lastHealthCheckAt'] as String) : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'] as String) : null,
      isDeleted: json['isDeleted'] as bool? ?? false,
      deletedAt: json['deletedAt'] != null ? DateTime.tryParse(json['deletedAt'] as String) : null,
      syncStatus: json['syncStatus'] as String? ?? 'synced',
      lastSyncedAt: json['lastSyncedAt'] != null ? DateTime.tryParse(json['lastSyncedAt'] as String) : null,
      remoteId: json['remoteId'] as String?,
      version: json['version'] as int? ?? 1,
      isDirty: json['isDirty'] as bool? ?? false,
      nodeId: json['nodeId'] as String?,
    );
  }
}
