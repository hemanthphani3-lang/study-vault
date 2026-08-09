import '../../domain/repositories/search_repository.dart';
import '../../domain/search/models/search_filter.dart';
import '../../domain/search/models/search_result_item.dart';
import '../../domain/search/models/search_sort_option.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';
import '../models/resource_model.dart';
import '../models/search_history_model.dart';

/// Concrete repository implementation for Search combining [ILocalDataSource] and [IRemoteDataSource].
class SearchRepositoryImpl implements ISearchRepository {
  const SearchRepositoryImpl(this._localDataSource, [this._remoteDataSource]);

  final ILocalDataSource _localDataSource;
  final IRemoteDataSource? _remoteDataSource;

  @override
  Future<List<ResourceModel>> search(String query, {String? categoryId}) async {
    final List<ResourceModel> local = await _localDataSource.getAllResources(query: query);
    if (local.isEmpty && query.isNotEmpty && _remoteDataSource != null) {
      try {
        final List<ResourceModel> remote = await _remoteDataSource.queryRemoteMesh(query);
        for (final ResourceModel r in remote) {
          await _localDataSource.insertResource(r);
        }
        return _localDataSource.getAllResources(query: query);
      } catch (_) {}
    }
    return local;
  }

  @override
  Future<List<SearchResultItem>> searchAdvanced(
    SearchFilter filter, {
    SearchSortOption sort = SearchSortOption.mostRelevant,
    int limit = 50,
    int offset = 0,
  }) async {
    final List<SearchResultItem> localItems = await _localDataSource.searchAdvanced(
      filter,
      sort: sort,
      limit: limit,
      offset: offset,
    );

    if (localItems.isEmpty && filter.query != null && filter.query!.isNotEmpty && _remoteDataSource != null) {
      try {
        final List<ResourceModel> remoteResources = await _remoteDataSource.queryRemoteMesh(filter.query!);
        for (final ResourceModel r in remoteResources) {
          await _localDataSource.insertResource(r);
        }
        return _localDataSource.searchAdvanced(filter, sort: sort, limit: limit, offset: offset);
      } catch (_) {}
    }

    return localItems;
  }


  @override
  Future<List<String>> getSuggestions(String prefix, {int limit = 8}) {
    return _localDataSource.getSuggestions(prefix, limit: limit);
  }

  @override
  Future<List<String>> getRecentSearches({int limit = 10}) {
    return _localDataSource.getRecentSearches(limit: limit);
  }

  @override
  Future<void> recordSearchQuery(String query, {int resultCount = 0, Map<String, dynamic> filters = const <String, dynamic>{}}) async {
    await _localDataSource.recordSearchQuery(query, resultCount: resultCount, filters: filters);
  }

  @override
  Future<void> removeRecentSearch(String term) {
    return _localDataSource.removeRecentSearch(term);
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory({int limit = 20}) {
    return _localDataSource.getSearchHistory(limit: limit);
  }

  @override
  Future<void> clearHistory() {
    return _localDataSource.clearSearchHistory();
  }
}
