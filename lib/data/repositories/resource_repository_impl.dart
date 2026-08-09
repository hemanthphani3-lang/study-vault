import '../../domain/repositories/resource_repository.dart';
import '../../domain/search/models/search_filter.dart';
import '../../domain/search/models/search_result_item.dart';
import '../datasources/local/local_data_source.dart';
import '../models/resource_model.dart';

/// Concrete repository implementation for unified resources.
class ResourceRepositoryImpl implements IResourceRepository {
  const ResourceRepositoryImpl(this._localDataSource);

  final ILocalDataSource _localDataSource;

  @override
  Future<List<ResourceModel>> getResources({int limit = 100, int offset = 0, String? query}) {
    return _localDataSource.getAllResources(limit: limit, offset: offset, query: query);
  }

  @override
  Future<ResourceModel?> getResourceById(String id) {
    return _localDataSource.getResourceById(id);
  }

  @override
  Future<List<ResourceModel>> filterResources(SearchFilter filter) async {
    final List<SearchResultItem> results = await _localDataSource.searchAdvanced(filter);
    return results.map((SearchResultItem item) => item.resource).toList();
  }
}
