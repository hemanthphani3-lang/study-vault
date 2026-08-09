import 'dart:convert';

import '../../shared/enums/resource_type.dart';
import '../../shared/enums/verification_tier.dart';
import '../models/resource_model.dart';

/// Data Transfer Object that deserializes the FastAPI `/api/v1/resources`
/// JSON payload and converts it to the domain [ResourceModel].
class ResourceDto {
  const ResourceDto({
    required this.id,
    required this.title,
    this.subtitle,
    this.abstractText,
    this.authors = const <String>[],
    this.resourceType = 'paper',
    this.categoryId,
    this.languageCode = 'en',
    this.publicationYear,
    this.doi,
    this.isbn,
    this.arxivId,
    this.cid,
    this.contentHash,
    this.verificationTier = 'verified',
    this.isPeerReviewed = false,
    this.format = 'pdf',
    this.sizeBytes = 0,
    this.pageCount = 0,
    this.peerSeeders = 0,
    this.availabilityScore = 1.0,
    this.citationsCount = 0,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String title;
  final String? subtitle;
  final String? abstractText;
  final List<String> authors;
  final String resourceType;
  final String? categoryId;
  final String languageCode;
  final int? publicationYear;
  final String? doi;
  final String? isbn;
  final String? arxivId;
  final String? cid;
  final String? contentHash;
  final String verificationTier;
  final bool isPeerReviewed;
  final String format;
  final int sizeBytes;
  final int pageCount;
  final int peerSeeders;
  final double availabilityScore;
  final int citationsCount;
  final String? createdAt;
  final String? updatedAt;

  /// Deserializes a FastAPI resource JSON map into a [ResourceDto].
  factory ResourceDto.fromJson(Map<String, dynamic> json) {
    List<String> parsedAuthors = <String>[];
    final rawAuthors = json['authors'];
    if (rawAuthors is List) {
      parsedAuthors = rawAuthors.map((dynamic e) => e.toString()).toList();
    } else if (rawAuthors is String) {
      try {
        final decoded = jsonDecode(rawAuthors);
        if (decoded is List) {
          parsedAuthors = decoded.map((dynamic e) => e.toString()).toList();
        }
      } catch (_) {}
    }

    return ResourceDto(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      abstractText: json['abstract_text'] as String?,
      authors: parsedAuthors,
      resourceType: json['resource_type'] as String? ?? 'paper',
      categoryId: json['category_id'] as String?,
      languageCode: json['language_code'] as String? ?? 'en',
      publicationYear: json['publication_year'] as int?,
      doi: json['doi'] as String?,
      isbn: json['isbn'] as String?,
      arxivId: json['arxiv_id'] as String?,
      cid: json['cid'] as String?,
      contentHash: json['content_hash'] as String?,
      verificationTier: json['verification_tier'] as String? ?? 'verified',
      isPeerReviewed: json['is_peer_reviewed'] as bool? ?? false,
      format: json['format'] as String? ?? 'pdf',
      sizeBytes: json['size_bytes'] as int? ?? 0,
      pageCount: json['page_count'] as int? ?? 0,
      peerSeeders: json['peer_seeders'] as int? ?? 0,
      availabilityScore: (json['availability_score'] as num?)?.toDouble() ?? 1.0,
      citationsCount: json['citations_count'] as int? ?? 0,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  /// Maps this DTO into the immutable domain [ResourceModel].
  ResourceModel toDomain() {
    ResourceType mappedType = ResourceType.paper;
    for (final ResourceType t in ResourceType.values) {
      if (t.name.toLowerCase() == resourceType.toLowerCase()) {
        mappedType = t;
        break;
      }
    }

    VerificationTier mappedTier = VerificationTier.verified;
    for (final VerificationTier v in VerificationTier.values) {
      if (v.name.toLowerCase() == verificationTier.toLowerCase()) {
        mappedTier = v;
        break;
      }
    }

    return ResourceModel(
      id: id,
      title: title,
      subtitle: subtitle,
      authors: authors,
      type: mappedType,
      verificationTier: mappedTier,
      publicationYear: publicationYear,
      format: format,
      sizeBytes: sizeBytes,
      cid: cid,
      contentHash: contentHash,
      doi: doi,
      categoryId: categoryId,
      peerSeeders: peerSeeders,
      metadata: <String, dynamic>{
        'abstract': abstractText,
        'language': languageCode,
        'isbn': isbn,
        'arxivId': arxivId,
        'citationsCount': citationsCount,
        'availabilityScore': availabilityScore,
        'pageCount': pageCount,
        'isPeerReviewed': isPeerReviewed,
      },
      syncStatus: 'synced',
      lastSyncedAt: DateTime.now(),
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}
