import '../../data/models/resource_model.dart';
import '../search/models/search_filter.dart';

/// Domain contract for managing unified academic resources across disciplines.
abstract interface class IResourceRepository {
  Future<List<ResourceModel>> getResources({int limit = 100, int offset = 0, String? query});
  Future<ResourceModel?> getResourceById(String id);
  Future<List<ResourceModel>> filterResources(SearchFilter filter);
}
