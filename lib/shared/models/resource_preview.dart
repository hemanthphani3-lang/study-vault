import 'package:flutter/foundation.dart';
import '../enums/resource_type.dart';
import '../enums/verification_tier.dart';

/// Immutable domain model representing an academic resource preview.
@immutable
class ResourcePreview {
  const ResourcePreview({
    required this.id,
    required this.title,
    required this.authors,
    required this.year,
    required this.type,
    required this.verificationTier,
    required this.sizeBytes,
    required this.peerSeeders,
    required this.cid,
    this.institution,
    this.doi,
    this.isDownloaded = false,
  });

  final String id;
  final String title;
  final List<String> authors;
  final int year;
  final ResourceType type;
  final VerificationTier verificationTier;
  final int sizeBytes;
  final int peerSeeders;
  final String cid; // IPFS Content Identifier
  final String? institution;
  final String? doi;
  final bool isDownloaded;

  ResourcePreview copyWith({
    String? id,
    String? title,
    List<String>? authors,
    int? year,
    ResourceType? type,
    VerificationTier? verificationTier,
    int? sizeBytes,
    int? peerSeeders,
    String? cid,
    String? institution,
    String? doi,
    bool? isDownloaded,
  }) {
    return ResourcePreview(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      year: year ?? this.year,
      type: type ?? this.type,
      verificationTier: verificationTier ?? this.verificationTier,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      peerSeeders: peerSeeders ?? this.peerSeeders,
      cid: cid ?? this.cid,
      institution: institution ?? this.institution,
      doi: doi ?? this.doi,
      isDownloaded: isDownloaded ?? this.isDownloaded,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourcePreview &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
