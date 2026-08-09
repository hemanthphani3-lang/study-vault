/// Immutable domain and data model representing reading sessions and bookmark progress.
class ReadingProgressModel {
  const ReadingProgressModel({
    required this.id,
    required this.resourceId,
    this.resourceType = 'book',
    required this.title,
    this.currentPage = 1,
    this.totalPages = 1,
    this.progress = 0.0,
    this.lastReadPosition,
    this.timeSpentSeconds = 0,
    this.lastReadAt,
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
  final int currentPage;
  final int totalPages;
  final double progress;
  final String? lastReadPosition;
  final int timeSpentSeconds;
  final DateTime? lastReadAt;

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

  ReadingProgressModel copyWith({
    String? id,
    String? resourceId,
    String? resourceType,
    String? title,
    int? currentPage,
    int? totalPages,
    double? progress,
    String? lastReadPosition,
    int? timeSpentSeconds,
    DateTime? lastReadAt,
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
    return ReadingProgressModel(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      title: title ?? this.title,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      progress: progress ?? this.progress,
      lastReadPosition: lastReadPosition ?? this.lastReadPosition,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      lastReadAt: lastReadAt ?? this.lastReadAt,
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
      'currentPage': currentPage,
      'totalPages': totalPages,
      'progress': progress,
      'lastReadPosition': lastReadPosition,
      'timeSpentSeconds': timeSpentSeconds,
      'lastReadAt': lastReadAt?.toIso8601String(),
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

  factory ReadingProgressModel.fromJson(Map<String, dynamic> json) {
    return ReadingProgressModel(
      id: json['id'] as String? ?? '',
      resourceId: json['resourceId'] as String? ?? '',
      resourceType: json['resourceType'] as String? ?? 'book',
      title: json['title'] as String? ?? '',
      currentPage: json['currentPage'] as int? ?? 1,
      totalPages: json['totalPages'] as int? ?? 1,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      lastReadPosition: json['lastReadPosition'] as String?,
      timeSpentSeconds: json['timeSpentSeconds'] as int? ?? 0,
      lastReadAt: json['lastReadAt'] != null ? DateTime.tryParse(json['lastReadAt'] as String) : null,
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
