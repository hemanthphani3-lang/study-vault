import '../../../../shared/models/resource_preview.dart';
import '../../../data/models/resource_model.dart';

/// Wrapped search result with relevance score and telemetry.
class SearchResultItem {
  const SearchResultItem({
    required this.resource,
    this.score = 1.0,
    this.matchedKeywords = const <String>[],
    this.highlightField,
  });

  final ResourceModel resource;
  final double score;
  final List<String> matchedKeywords;
  final String? highlightField;

  /// Converts the underlying [ResourceModel] into a lightweight [ResourcePreview] for UI rendering.
  ResourcePreview toPreview() {
    return ResourcePreview(
      id: resource.id,
      title: resource.title,
      authors: resource.authors,
      year: resource.publicationYear ?? 2026,
      type: resource.type,
      verificationTier: resource.verificationTier,
      sizeBytes: resource.sizeBytes,
      peerSeeders: resource.peerSeeders,
      cid: resource.cid ?? '',
      isDownloaded: resource.isDownloaded,
    );
  }
}
