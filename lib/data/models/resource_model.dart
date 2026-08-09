import 'dart:convert';
import '../../shared/enums/resource_type.dart';
import '../../shared/enums/verification_tier.dart';

/// Unified academic resource model bridging books, research papers, datasets, and digital notes.
class ResourceModel {
  const ResourceModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.authors = const <String>[],
    this.type = ResourceType.paper,
    this.verificationTier = VerificationTier.verified,
    this.publicationYear,
    this.format = 'pdf',
    this.sizeBytes = 0,
    this.coverPath,
    this.cid,
    this.contentHash,
    this.doi,
    this.categoryId,
    this.peerSeeders = 0,
    this.isDownloaded = false,
    this.downloadProgress = 0.0,
    this.metadata = const <String, dynamic>{},
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
  final String? subtitle;
  final List<String> authors;
  final ResourceType type;
  final VerificationTier verificationTier;
  final int? publicationYear;
  final String format;
  final int sizeBytes;
  final String? coverPath;
  final String? cid;
  final String? contentHash;
  final String? doi;
  final String? categoryId;
  final int peerSeeders;
  final bool isDownloaded;
  final double downloadProgress;
  final Map<String, dynamic> metadata;

  // Sync & auditing
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

  ResourceModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    List<String>? authors,
    ResourceType? type,
    VerificationTier? verificationTier,
    int? publicationYear,
    String? format,
    int? sizeBytes,
    String? coverPath,
    String? cid,
    String? contentHash,
    String? doi,
    String? categoryId,
    int? peerSeeders,
    bool? isDownloaded,
    double? downloadProgress,
    Map<String, dynamic>? metadata,
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
    return ResourceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      type: type ?? this.type,
      verificationTier: verificationTier ?? this.verificationTier,
      publicationYear: publicationYear ?? this.publicationYear,
      format: format ?? this.format,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      coverPath: coverPath ?? this.coverPath,
      cid: cid ?? this.cid,
      contentHash: contentHash ?? this.contentHash,
      doi: doi ?? this.doi,
      categoryId: categoryId ?? this.categoryId,
      peerSeeders: peerSeeders ?? this.peerSeeders,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      downloadProgress: downloadProgress ?? this.downloadProgress,
      metadata: metadata ?? this.metadata,
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
      'subtitle': subtitle,
      'authors': authors,
      'type': type.name,
      'verificationTier': verificationTier.name,
      'publicationYear': publicationYear,
      'format': format,
      'sizeBytes': sizeBytes,
      'coverPath': coverPath,
      'cid': cid,
      'contentHash': contentHash,
      'doi': doi,
      'categoryId': categoryId,
      'peerSeeders': peerSeeders,
      'isDownloaded': isDownloaded,
      'downloadProgress': downloadProgress,
      'metadata': metadata,
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

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
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

    ResourceType parsedType = ResourceType.paper;
    if (json['type'] is String) {
      for (final ResourceType val in ResourceType.values) {
        if (val.name.toLowerCase() == (json['type'] as String).toLowerCase()) {
          parsedType = val;
          break;
        }
      }
    }

    VerificationTier parsedTier = VerificationTier.verified;
    if (json['verificationTier'] is String) {
      for (final VerificationTier val in VerificationTier.values) {
        if (val.name.toLowerCase() == (json['verificationTier'] as String).toLowerCase()) {
          parsedTier = val;
          break;
        }
      }
    }

    return ResourceModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      authors: parsedAuthors,
      type: parsedType,
      verificationTier: parsedTier,
      publicationYear: json['publicationYear'] as int?,
      format: json['format'] as String? ?? 'pdf',
      sizeBytes: json['sizeBytes'] as int? ?? 0,
      coverPath: json['coverPath'] as String?,
      cid: json['cid'] as String?,
      contentHash: json['contentHash'] as String?,
      doi: json['doi'] as String?,
      categoryId: json['categoryId'] as String?,
      peerSeeders: json['peerSeeders'] as int? ?? 0,
      isDownloaded: json['isDownloaded'] as bool? ?? false,
      downloadProgress: (json['downloadProgress'] as num?)?.toDouble() ?? 0.0,
      metadata: json['metadata'] is Map<String, dynamic> ? json['metadata'] as Map<String, dynamic> : const <String, dynamic>{},
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
