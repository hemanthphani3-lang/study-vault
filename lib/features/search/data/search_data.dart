import '../../../../shared/models/resource_preview.dart';
import '../domain/search_domain.dart';

/// Concrete Search repository implementation.
class SearchRepositoryImpl implements ISearchRepository {
  const SearchRepositoryImpl();

  @override
  Future<List<ResourcePreview>> searchResources(String query) async {
    return <ResourcePreview>[];
  }
}
