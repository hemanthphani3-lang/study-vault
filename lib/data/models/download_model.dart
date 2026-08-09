/// Immutable domain and data model representing local file hydration and download telemetry.
class DownloadModel {
  const DownloadModel({
    required this.id,
    required this.resourceId,
    this.resourceType = 'book',
    required this.title,
    this.filePath,
    this.fileSizeBytes = 0,
    this.bytesDownloaded = 0,
    this.downloadStatus = 'pending',
    this.downloadSpeedBps = 0,
    this.progress = 0.0,
    this.errorMessage,
    this.cid,
    this.peerCount = 0,
    this.completedAt,
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
  final String resourceId;
  final String resourceType;
  final String title;
  final String? filePath;
  final int fileSizeBytes;
  final int bytesDownloaded;
  final String downloadStatus;
  final int downloadSpeedBps;
  final double progress;
  final String? errorMessage;
  final String? cid;
  final int peerCount;
  final DateTime? completedAt;

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

  DownloadModel copyWith({
    String? id,
    String? resourceId,
    String? resourceType,
    String? title,
    String? filePath,
    int? fileSizeBytes,
    int? bytesDownloaded,
    String? downloadStatus,
    int? downloadSpeedBps,
    double? progress,
    String? errorMessage,
    String? cid,
    int? peerCount,
    DateTime? completedAt,
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
    return DownloadModel(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      bytesDownloaded: bytesDownloaded ?? this.bytesDownloaded,
      downloadStatus: downloadStatus ?? this.downloadStatus,
      downloadSpeedBps: downloadSpeedBps ?? this.downloadSpeedBps,
      progress: progress ?? this.progress,
      errorMessage: errorMessage ?? this.errorMessage,
      cid: cid ?? this.cid,
      peerCount: peerCount ?? this.peerCount,
      completedAt: completedAt ?? this.completedAt,
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
      'resourceId': resourceId,
      'resourceType': resourceType,
      'title': title,
      'filePath': filePath,
      'fileSizeBytes': fileSizeBytes,
      'bytesDownloaded': bytesDownloaded,
      'downloadStatus': downloadStatus,
      'downloadSpeedBps': downloadSpeedBps,
      'progress': progress,
      'errorMessage': errorMessage,
      'cid': cid,
      'peerCount': peerCount,
      'completedAt': completedAt?.toIso8601String(),
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

  factory DownloadModel.fromJson(Map<String, dynamic> json) {
    return DownloadModel(
      id: json['id'] as String? ?? '',
      resourceId: json['resourceId'] as String? ?? '',
      resourceType: json['resourceType'] as String? ?? 'book',
      title: json['title'] as String? ?? '',
      filePath: json['filePath'] as String?,
      fileSizeBytes: json['fileSizeBytes'] as int? ?? 0,
      bytesDownloaded: json['bytesDownloaded'] as int? ?? 0,
      downloadStatus: json['downloadStatus'] as String? ?? 'pending',
      downloadSpeedBps: json['downloadSpeedBps'] as int? ?? 0,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      errorMessage: json['errorMessage'] as String?,
      cid: json['cid'] as String?,
      peerCount: json['peerCount'] as int? ?? 0,
      completedAt: json['completedAt'] != null ? DateTime.tryParse(json['completedAt'] as String) : null,
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
