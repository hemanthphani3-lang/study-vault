import 'dart:convert';

/// Immutable domain and data model representing an academic book or reference publication.
class BookModel {
  const BookModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.authors = const <String>[],
    this.publisher,
    this.publicationYear,
    this.isbn,
    this.doi,
    this.language = 'en',
    this.pageCount = 0,
    this.format = 'pdf',
    this.sizeBytes = 0,
    this.coverPath,
    this.cid,
    this.contentHash,
    this.verificationTier = 'verified',
    this.categoryId,
    this.metadata = const <String, dynamic>{},
    this.isDownloaded = false,
    this.peerSeeders = 0,
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
  final String? publisher;
  final int? publicationYear;
  final String? isbn;
  final String? doi;
  final String language;
  final int pageCount;
  final String format;
  final int sizeBytes;
  final String? coverPath;
  final String? cid;
  final String? contentHash;
  final String verificationTier;
  final String? categoryId;
  final Map<String, dynamic> metadata;
  final bool isDownloaded;
  final int peerSeeders;

  // Base sync & audit fields
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

  BookModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    int? publicationYear,
    String? isbn,
    String? doi,
    String? language,
    int? pageCount,
    String? format,
    int? sizeBytes,
    String? coverPath,
    String? cid,
    String? contentHash,
    String? verificationTier,
    String? categoryId,
    Map<String, dynamic>? metadata,
    bool? isDownloaded,
    int? peerSeeders,
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
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publicationYear: publicationYear ?? this.publicationYear,
      isbn: isbn ?? this.isbn,
      doi: doi ?? this.doi,
      language: language ?? this.language,
      pageCount: pageCount ?? this.pageCount,
      format: format ?? this.format,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      coverPath: coverPath ?? this.coverPath,
      cid: cid ?? this.cid,
      contentHash: contentHash ?? this.contentHash,
      verificationTier: verificationTier ?? this.verificationTier,
      categoryId: categoryId ?? this.categoryId,
      metadata: metadata ?? this.metadata,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      peerSeeders: peerSeeders ?? this.peerSeeders,
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
      'publisher': publisher,
      'publicationYear': publicationYear,
      'isbn': isbn,
      'doi': doi,
      'language': language,
      'pageCount': pageCount,
      'format': format,
      'sizeBytes': sizeBytes,
      'coverPath': coverPath,
      'cid': cid,
      'contentHash': contentHash,
      'verificationTier': verificationTier,
      'categoryId': categoryId,
      'metadata': metadata,
      'isDownloaded': isDownloaded,
      'peerSeeders': peerSeeders,
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

  factory BookModel.fromJson(Map<String, dynamic> json) {
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

    Map<String, dynamic> parsedMeta = <String, dynamic>{};
    if (json['metadata'] is Map<String, dynamic>) {
      parsedMeta = json['metadata'] as Map<String, dynamic>;
    } else if (json['metadataJson'] is String) {
      try {
        final dynamic decoded = jsonDecode(json['metadataJson'] as String);
        if (decoded is Map<String, dynamic>) {
          parsedMeta = decoded;
        }
      } catch (_) {}
    }

    return BookModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      authors: parsedAuthors,
      publisher: json['publisher'] as String?,
      publicationYear: json['publicationYear'] as int?,
      isbn: json['isbn'] as String?,
      doi: json['doi'] as String?,
      language: json['language'] as String? ?? 'en',
      pageCount: json['pageCount'] as int? ?? 0,
      format: json['format'] as String? ?? 'pdf',
      sizeBytes: json['sizeBytes'] as int? ?? 0,
      coverPath: json['coverPath'] as String?,
      cid: json['cid'] as String?,
      contentHash: json['contentHash'] as String?,
      verificationTier: json['verificationTier'] as String? ?? 'verified',
      categoryId: json['categoryId'] as String?,
      metadata: parsedMeta,
      isDownloaded: json['isDownloaded'] as bool? ?? false,
      peerSeeders: json['peerSeeders'] as int? ?? 0,
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
