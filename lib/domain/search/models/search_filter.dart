import '../../../shared/enums/resource_type.dart';
import '../../../shared/enums/verification_tier.dart';

/// Immutable filter criteria container for academic discovery.
class SearchFilter {
  const SearchFilter({
    this.query,
    this.resourceType,
    this.verificationTier,
    this.categoryId,
    this.author,
    this.language,
    this.isDownloaded,
    this.isFavorite,
    this.minYear,
    this.maxYear,
    this.minPeerCount,
    this.countryCode,
    this.minTrustScore,
  });

  final String? query;
  final ResourceType? resourceType;
  final VerificationTier? verificationTier;
  final String? categoryId;
  final String? author;
  final String? language;
  final bool? isDownloaded;
  final bool? isFavorite;
  final int? minYear;
  final int? maxYear;
  final int? minPeerCount;
  final String? countryCode;
  final double? minTrustScore;

  static const SearchFilter empty = SearchFilter();

  bool get isEmpty =>
      (query == null || query!.trim().isEmpty) &&
      resourceType == null &&
      verificationTier == null &&
      categoryId == null &&
      author == null &&
      language == null &&
      isDownloaded == null &&
      isFavorite == null &&
      minYear == null &&
      maxYear == null &&
      minPeerCount == null &&
      countryCode == null &&
      minTrustScore == null;

  bool get isNotEmpty => !isEmpty;

  SearchFilter copyWith({
    String? query,
    ResourceType? resourceType,
    VerificationTier? verificationTier,
    String? categoryId,
    String? author,
    String? language,
    bool? isDownloaded,
    bool? isFavorite,
    int? minYear,
    int? maxYear,
    int? minPeerCount,
    String? countryCode,
    double? minTrustScore,
    bool clearQuery = false,
    bool clearResourceType = false,
    bool clearVerificationTier = false,
    bool clearCategoryId = false,
  }) {
    return SearchFilter(
      query: clearQuery ? null : (query ?? this.query),
      resourceType: clearResourceType ? null : (resourceType ?? this.resourceType),
      verificationTier: clearVerificationTier ? null : (verificationTier ?? this.verificationTier),
      categoryId: clearCategoryId ? null : (categoryId ?? this.categoryId),
      author: author ?? this.author,
      language: language ?? this.language,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      isFavorite: isFavorite ?? this.isFavorite,
      minYear: minYear ?? this.minYear,
      maxYear: maxYear ?? this.maxYear,
      minPeerCount: minPeerCount ?? this.minPeerCount,
      countryCode: countryCode ?? this.countryCode,
      minTrustScore: minTrustScore ?? this.minTrustScore,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'query': query,
      'resourceType': resourceType?.name,
      'verificationTier': verificationTier?.name,
      'categoryId': categoryId,
      'author': author,
      'language': language,
      'isDownloaded': isDownloaded,
      'isFavorite': isFavorite,
      'minYear': minYear,
      'maxYear': maxYear,
      'minPeerCount': minPeerCount,
      'countryCode': countryCode,
      'minTrustScore': minTrustScore,
    };
  }

  factory SearchFilter.fromJson(Map<String, dynamic> json) {
    ResourceType? parsedType;
    if (json['resourceType'] is String) {
      for (final ResourceType val in ResourceType.values) {
        if (val.name.toLowerCase() == (json['resourceType'] as String).toLowerCase()) {
          parsedType = val;
          break;
        }
      }
    }

    VerificationTier? parsedTier;
    if (json['verificationTier'] is String) {
      for (final VerificationTier val in VerificationTier.values) {
        if (val.name.toLowerCase() == (json['verificationTier'] as String).toLowerCase()) {
          parsedTier = val;
          break;
        }
      }
    }

    return SearchFilter(
      query: json['query'] as String?,
      resourceType: parsedType,
      verificationTier: parsedTier,
      categoryId: json['categoryId'] as String?,
      author: json['author'] as String?,
      language: json['language'] as String?,
      isDownloaded: json['isDownloaded'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
      minYear: json['minYear'] as int?,
      maxYear: json['maxYear'] as int?,
      minPeerCount: json['minPeerCount'] as int?,
      countryCode: json['countryCode'] as String?,
      minTrustScore: (json['minTrustScore'] as num?)?.toDouble(),
    );
  }
}
