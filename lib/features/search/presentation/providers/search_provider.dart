import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/data_providers.dart';
import '../../../../data/models/search_history_model.dart';
import '../../../../domain/repositories/search_repository.dart';
import '../../../../domain/search/models/search_filter.dart';
import '../../../../domain/search/models/search_result_item.dart';
import '../../../../domain/search/models/search_sort_option.dart';
import '../../../../shared/enums/resource_type.dart';
import '../../../../shared/models/resource_preview.dart';

/// Search engine lifecycle and execution status.
enum SearchStatus {
  idle,
  loading,
  success,
  empty,
  error,
}

/// State representation for deep academic discovery, filtering, and autocomplete.
class SearchState {
  const SearchState({
    required this.query,
    required this.filter,
    required this.sortOption,
    required this.results,
    required this.recentSearches,
    required this.searchHistory,
    required this.suggestions,
    required this.status,
    this.errorMessage,
    this.totalCount = 0,
    this.hasMore = false,
  });

  final String query;
  final SearchFilter filter;
  final SearchSortOption sortOption;
  final List<ResourcePreview> results;
  final List<String> recentSearches;
  final List<SearchHistoryModel> searchHistory;
  final List<String> suggestions;
  final SearchStatus status;
  final String? errorMessage;
  final int totalCount;
  final bool hasMore;

  // Backward compatibility getters
  bool get isSearching => status == SearchStatus.loading;
  ResourceType? get selectedFilter => filter.resourceType;

  static const List<ResourcePreview> defaultMockResults = <ResourcePreview>[];

  static const SearchState initial = SearchState(
    query: '',
    filter: SearchFilter.empty,
    sortOption: SearchSortOption.mostRelevant,
    results: <ResourcePreview>[],
    recentSearches: <String>[],
    searchHistory: <SearchHistoryModel>[],
    suggestions: <String>[],
    status: SearchStatus.idle,
    totalCount: 0,
    hasMore: false,
  );


  SearchState copyWith({
    String? query,
    SearchFilter? filter,
    SearchSortOption? sortOption,
    List<ResourcePreview>? results,
    List<String>? recentSearches,
    List<SearchHistoryModel>? searchHistory,
    List<String>? suggestions,
    SearchStatus? status,
    String? errorMessage,
    int? totalCount,
    bool? hasMore,
    ResourceType? selectedFilter,
  }) {
    return SearchState(
      query: query ?? this.query,
      filter: filter ?? (selectedFilter != null ? this.filter.copyWith(resourceType: selectedFilter) : this.filter),
      sortOption: sortOption ?? this.sortOption,
      results: results ?? this.results,
      recentSearches: recentSearches ?? this.recentSearches,
      searchHistory: searchHistory ?? this.searchHistory,
      suggestions: suggestions ?? this.suggestions,
      status: status ?? this.status,
      errorMessage: errorMessage,
      totalCount: totalCount ?? this.totalCount,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// StateNotifier driving the academic search engine, ranking, and telemetry.
class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier(this._searchRepo) : super(SearchState.initial) {
    loadRecentSearches();
  }

  final ISearchRepository _searchRepo;

  /// Loads persisted recent searches from local SQLite database.
  Future<void> loadRecentSearches() async {
    try {
      final List<String> recents = await _searchRepo.getRecentSearches(limit: 10);
      if (recents.isNotEmpty) {
        state = state.copyWith(recentSearches: recents);
      }
    } catch (_) {}
  }

  /// Executes query search against local SQLite index.
  Future<void> search(String query) async {
    final String clean = query.trim();
    if (clean.isEmpty && state.filter.isEmpty) {
      state = state.copyWith(
        query: '',
        results: SearchState.defaultMockResults,
        status: SearchStatus.idle,
      );
      return;
    }

    state = state.copyWith(query: clean, status: SearchStatus.loading);

    try {
      final SearchFilter activeFilter = state.filter.copyWith(query: clean);
      final List<SearchResultItem> items = await _searchRepo.searchAdvanced(
        activeFilter,
        sort: state.sortOption,
        limit: 50,
      );

      final List<ResourcePreview> previews = items.map((SearchResultItem i) => i.toPreview()).toList();

      final List<ResourcePreview> effectiveResults = previews;

      if (clean.isNotEmpty) {
        await _searchRepo.recordSearchQuery(clean, resultCount: effectiveResults.length);
        await loadRecentSearches();
      }

      state = state.copyWith(
        results: effectiveResults,
        status: effectiveResults.isNotEmpty ? SearchStatus.success : SearchStatus.empty,
        totalCount: effectiveResults.length,
      );
    } catch (e) {
      state = state.copyWith(
        status: SearchStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// Updates search query string and triggers search.
  void updateQuery(String newQuery) {
    search(newQuery);
  }

  /// Updates active resource type filter chip.
  void setFilter(ResourceType? filterType) {
    final SearchFilter updatedFilter = state.filter.copyWith(
      resourceType: filterType,
      clearResourceType: filterType == null,
    );
    state = state.copyWith(filter: updatedFilter);
    search(state.query);
  }

  /// Applies advanced multi-dimensional filter.
  void applyFilter(SearchFilter filter) {
    state = state.copyWith(filter: filter);
    search(state.query);
  }

  /// Updates sorting option and re-orders results.
  void setSortOption(SearchSortOption sort) {
    state = state.copyWith(sortOption: sort);
    search(state.query);
  }

  /// Loads prefix autocomplete suggestions.
  Future<void> loadSuggestions(String prefix) async {
    try {
      final List<String> suggestions = await _searchRepo.getSuggestions(prefix);
      state = state.copyWith(suggestions: suggestions);
    } catch (_) {}
  }

  /// Deletes a specific term from recent searches.
  Future<void> deleteRecentSearch(String term) async {
    try {
      await _searchRepo.removeRecentSearch(term);
      final List<String> updated = List<String>.from(state.recentSearches)..remove(term);
      state = state.copyWith(recentSearches: updated);
    } catch (_) {}
  }

  /// Clears all stored search history and recent searches.
  Future<void> clearAllHistory() async {
    try {
      await _searchRepo.clearHistory();
      state = state.copyWith(recentSearches: <String>[], searchHistory: <SearchHistoryModel>[]);
    } catch (_) {}
  }

  /// Resets search to default initial state.
  void reset() {
    state = SearchState.initial;
  }
}

/// Global Provider for academic search engine state.
final StateNotifierProvider<SearchNotifier, SearchState> searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((Ref ref) {
  final ISearchRepository searchRepo = ref.watch(searchRepositoryProvider);
  return SearchNotifier(searchRepo);
});

/// Dedicated query string provider for two-way binding.
final StateProvider<String> searchQueryProvider = StateProvider<String>((Ref ref) => '');
