import 'dart:convert';

/// Immutable domain and data model representing executed academic search queries.
class SearchHistoryModel {
  const SearchHistoryModel({
    required this.id,
    required this.query,
    this.resultCount = 0,
    this.filters = const <String, dynamic>{},
    this.searchedAt,
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
  final String query;
  final int resultCount;
  final Map<String, dynamic> filters;
  final DateTime? searchedAt;

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

  SearchHistoryModel copyWith({
    String? id,
    String? query,
    int? resultCount,
    Map<String, dynamic>? filters,
    DateTime? searchedAt,
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
    return SearchHistoryModel(
      id: id ?? this.id,
      query: query ?? this.query,
      resultCount: resultCount ?? this.resultCount,
      filters: filters ?? this.filters,
      searchedAt: searchedAt ?? this.searchedAt,
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
      'query': query,
      'resultCount': resultCount,
      'filters': filters,
      'searchedAt': searchedAt?.toIso8601String(),
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

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> parsedFilters = <String, dynamic>{};
    if (json['filters'] is Map<String, dynamic>) {
      parsedFilters = json['filters'] as Map<String, dynamic>;
    } else if (json['filtersJson'] is String) {
      try {
        final dynamic decoded = jsonDecode(json['filtersJson'] as String);
        if (decoded is Map<String, dynamic>) {
          parsedFilters = decoded;
        }
      } catch (_) {}
    }

    return SearchHistoryModel(
      id: json['id'] as String? ?? '',
      query: json['query'] as String? ?? '',
      resultCount: json['resultCount'] as int? ?? 0,
      filters: parsedFilters,
      searchedAt: json['searchedAt'] != null ? DateTime.tryParse(json['searchedAt'] as String) : null,
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
