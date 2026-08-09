import '../../data/models/resource_model.dart';
import '../../data/models/search_history_model.dart';
import '../search/models/search_filter.dart';
import '../search/models/search_result_item.dart';
import '../search/models/search_sort_option.dart';

/// Domain contract for executing academic searches, autocomplete, ranking, and history telemetry.
abstract interface class ISearchRepository {
  Future<List<ResourceModel>> search(String query, {String? categoryId});
  Future<List<SearchResultItem>> searchAdvanced(
    SearchFilter filter, {
    SearchSortOption sort = SearchSortOption.mostRelevant,
    int limit = 50,
    int offset = 0,
  });
  Future<List<String>> getSuggestions(String prefix, {int limit = 8});
  Future<List<String>> getRecentSearches({int limit = 10});
  Future<void> recordSearchQuery(String query, {int resultCount = 0, Map<String, dynamic> filters = const <String, dynamic>{}});
  Future<void> removeRecentSearch(String term);
  Future<List<SearchHistoryModel>> getSearchHistory({int limit = 20});
  Future<void> clearHistory();
}
