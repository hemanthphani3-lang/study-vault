import 'dart:convert';

/// Immutable domain and data model representing research notes and annotations.
class NoteModel {
  const NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.resourceId,
    this.resourceType = 'general',
    this.colorHex,
    this.tags = const <String>[],
    this.isPinned = false,
    this.readingPosition,
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
  final String title;
  final String content;
  final String? resourceId;
  final String resourceType;
  final String? colorHex;
  final List<String> tags;
  final bool isPinned;
  final String? readingPosition;

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

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    String? resourceId,
    String? resourceType,
    String? colorHex,
    List<String>? tags,
    bool? isPinned,
    String? readingPosition,
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
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      colorHex: colorHex ?? this.colorHex,
      tags: tags ?? this.tags,
      isPinned: isPinned ?? this.isPinned,
      readingPosition: readingPosition ?? this.readingPosition,
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
      'title': title,
      'content': content,
      'resourceId': resourceId,
      'resourceType': resourceType,
      'colorHex': colorHex,
      'tags': tags,
      'isPinned': isPinned,
      'readingPosition': readingPosition,
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

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    List<String> parsedTags = <String>[];
    if (json['tags'] is List) {
      parsedTags = (json['tags'] as List<dynamic>).map((dynamic e) => e.toString()).toList();
    } else if (json['tagsJson'] is String) {
      try {
        final dynamic decoded = jsonDecode(json['tagsJson'] as String);
        if (decoded is List) {
          parsedTags = decoded.map((dynamic e) => e.toString()).toList();
        }
      } catch (_) {}
    }

    return NoteModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      resourceId: json['resourceId'] as String?,
      resourceType: json['resourceType'] as String? ?? 'general',
      colorHex: json['colorHex'] as String?,
      tags: parsedTags,
      isPinned: json['isPinned'] as bool? ?? false,
      readingPosition: json['readingPosition'] as String?,
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
