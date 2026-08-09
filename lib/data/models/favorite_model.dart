import 'dart:convert';

/// Immutable domain and data model representing pinned or favorited academic artifacts.
class FavoriteModel {
  const FavoriteModel({
    required this.id,
    required this.resourceId,
    this.resourceType = 'book',
    required this.title,
    this.authors = const <String>[],
    this.coverPath,
    this.categoryId,
    this.addedAt,
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
  final List<String> authors;
  final String? coverPath;
  final String? categoryId;
  final DateTime? addedAt;

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

  FavoriteModel copyWith({
    String? id,
    String? resourceId,
    String? resourceType,
    String? title,
    List<String>? authors,
    String? coverPath,
    String? categoryId,
    DateTime? addedAt,
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
    return FavoriteModel(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      coverPath: coverPath ?? this.coverPath,
      categoryId: categoryId ?? this.categoryId,
      addedAt: addedAt ?? this.addedAt,
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
      'authors': authors,
      'coverPath': coverPath,
      'categoryId': categoryId,
      'addedAt': addedAt?.toIso8601String(),
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

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    List<String> parsedAuthors = <String>[];
    if (json['authors'] is List) {
      parsedAuthors = (json['authors'] as List<dynamic>).map((dynamic e) => e.toString()).toList();
    } else if (json['authorsJson'] is String) {
      try {
        final dynamic decoded = jsonDecode(json['authorsJson'] as String);
        if (decoded is List) {
          parsedAuthors = decoded.map((dynamic e) => e.toString()).toList();
        }
      } catch (_) {}
    }

    return FavoriteModel(
      id: json['id'] as String? ?? '',
      resourceId: json['resourceId'] as String? ?? '',
      resourceType: json['resourceType'] as String? ?? 'book',
      title: json['title'] as String? ?? '',
      authors: parsedAuthors,
      coverPath: json['coverPath'] as String?,
      categoryId: json['categoryId'] as String?,
      addedAt: json['addedAt'] != null ? DateTime.tryParse(json['addedAt'] as String) : null,
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
