import '../../../../shared/models/resource_preview.dart';

/// Clean Architecture domain contract for Search.
abstract interface class ISearchRepository {
  Future<List<ResourcePreview>> searchResources(String query);
}
