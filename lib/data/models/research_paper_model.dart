import 'dart:convert';

/// Immutable domain and data model representing an academic research paper or journal publication.
class ResearchPaperModel {
  const ResearchPaperModel({
    required this.id,
    required this.title,
    this.abstractText = '',
    this.authors = const <String>[],
    this.journal,
    this.conference,
    this.volume,
    this.issue,
    this.pages,
    this.doi,
    this.arxivId,
    this.pubmedId,
    this.publicationYear,
    this.isPeerReviewed = true,
    this.citationsCount = 0,
    this.cid,
    this.contentHash,
    this.sizeBytes = 0,
    this.format = 'pdf',
    this.categoryId,
    this.verificationTier = 'peerReviewed',
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
  final String abstractText;
  final List<String> authors;
  final String? journal;
  final String? conference;
  final String? volume;
  final String? issue;
  final String? pages;
  final String? doi;
  final String? arxivId;
  final String? pubmedId;
  final int? publicationYear;
  final bool isPeerReviewed;
  final int citationsCount;
  final String? cid;
  final String? contentHash;
  final int sizeBytes;
  final String format;
  final String? categoryId;
  final String verificationTier;
  final bool isDownloaded;
  final int peerSeeders;

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

  ResearchPaperModel copyWith({
    String? id,
    String? title,
    String? abstractText,
    List<String>? authors,
    String? journal,
    String? conference,
    String? volume,
    String? issue,
    String? pages,
    String? doi,
    String? arxivId,
    String? pubmedId,
    int? publicationYear,
    bool? isPeerReviewed,
    int? citationsCount,
    String? cid,
    String? contentHash,
    int? sizeBytes,
    String? format,
    String? categoryId,
    String? verificationTier,
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
    return ResearchPaperModel(
      id: id ?? this.id,
      title: title ?? this.title,
      abstractText: abstractText ?? this.abstractText,
      authors: authors ?? this.authors,
      journal: journal ?? this.journal,
      conference: conference ?? this.conference,
      volume: volume ?? this.volume,
      issue: issue ?? this.issue,
      pages: pages ?? this.pages,
      doi: doi ?? this.doi,
      arxivId: arxivId ?? this.arxivId,
      pubmedId: pubmedId ?? this.pubmedId,
      publicationYear: publicationYear ?? this.publicationYear,
      isPeerReviewed: isPeerReviewed ?? this.isPeerReviewed,
      citationsCount: citationsCount ?? this.citationsCount,
      cid: cid ?? this.cid,
      contentHash: contentHash ?? this.contentHash,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      format: format ?? this.format,
      categoryId: categoryId ?? this.categoryId,
      verificationTier: verificationTier ?? this.verificationTier,
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
      'abstractText': abstractText,
      'authors': authors,
      'journal': journal,
      'conference': conference,
      'volume': volume,
      'issue': issue,
      'pages': pages,
      'doi': doi,
      'arxivId': arxivId,
      'pubmedId': pubmedId,
      'publicationYear': publicationYear,
      'isPeerReviewed': isPeerReviewed,
      'citationsCount': citationsCount,
      'cid': cid,
      'contentHash': contentHash,
      'sizeBytes': sizeBytes,
      'format': format,
      'categoryId': categoryId,
      'verificationTier': verificationTier,
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

  factory ResearchPaperModel.fromJson(Map<String, dynamic> json) {
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

    return ResearchPaperModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      abstractText: json['abstractText'] as String? ?? '',
      authors: parsedAuthors,
      journal: json['journal'] as String?,
      conference: json['conference'] as String?,
      volume: json['volume'] as String?,
      issue: json['issue'] as String?,
      pages: json['pages'] as String?,
      doi: json['doi'] as String?,
      arxivId: json['arxivId'] as String?,
      pubmedId: json['pubmedId'] as String?,
      publicationYear: json['publicationYear'] as int?,
      isPeerReviewed: json['isPeerReviewed'] as bool? ?? true,
      citationsCount: json['citationsCount'] as int? ?? 0,
      cid: json['cid'] as String?,
      contentHash: json['contentHash'] as String?,
      sizeBytes: json['sizeBytes'] as int? ?? 0,
      format: json['format'] as String? ?? 'pdf',
      categoryId: json['categoryId'] as String?,
      verificationTier: json['verificationTier'] as String? ?? 'peerReviewed',
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
