import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/data_providers.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../data/models/search_history_model.dart';
import '../../../../domain/repositories/search_repository.dart';
import '../../../../domain/search/models/search_filter.dart';
import '../../../../domain/search/models/search_result_item.dart';
import '../../../../domain/search/models/search_sort_option.dart';
import '../../../../shared/enums/resource_type.dart';
import '../../../../shared/enums/verification_tier.dart';
import '../../../../shared/models/resource_preview.dart';
import '../widgets/pipeline_status_widget.dart';

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
    this.pipelineStage = PipelineStage.idle,
    this.pipelineMessage = '',
    this.providersSearched = const <String>[],
    this.docsIndexed = 0,
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

  // Pipeline state
  final PipelineStage pipelineStage;
  final String pipelineMessage;
  final List<String> providersSearched;
  final int docsIndexed;

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
    pipelineStage: PipelineStage.idle,
    pipelineMessage: '',
    providersSearched: <String>[],
    docsIndexed: 0,
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
    PipelineStage? pipelineStage,
    String? pipelineMessage,
    List<String>? providersSearched,
    int? docsIndexed,
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
      pipelineStage: pipelineStage ?? this.pipelineStage,
      pipelineMessage: pipelineMessage ?? this.pipelineMessage,
      providersSearched: providersSearched ?? this.providersSearched,
      docsIndexed: docsIndexed ?? this.docsIndexed,
    );
  }
}

/// StateNotifier driving the academic search engine with auto-retrieval pipeline.
class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier(this._searchRepo, this._apiClient) : super(SearchState.initial) {
    loadRecentSearches();
  }

  final ISearchRepository _searchRepo;
  final ApiClient _apiClient;

  Timer? _pollTimer;

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  /// Loads persisted recent searches from local SQLite database.
  Future<void> loadRecentSearches() async {
    try {
      final List<String> recents = await _searchRepo.getRecentSearches(limit: 10);
      if (recents.isNotEmpty) {
        state = state.copyWith(recentSearches: recents);
      }
    } catch (_) {}
  }

  /// Main search entry point — uses the auto-retrieval pipeline.
  Future<void> search(String query) async {
    final String clean = query.trim();
    if (clean.isEmpty && state.filter.isEmpty) {
      _cancelPoll();
      state = state.copyWith(
        query: '',
        results: SearchState.defaultMockResults,
        status: SearchStatus.idle,
        pipelineStage: PipelineStage.idle,
      );
      return;
    }

    _cancelPoll();
    state = state.copyWith(
      query: clean,
      status: SearchStatus.loading,
      pipelineStage: PipelineStage.localSearch,
      pipelineMessage: 'Checking your local vault...',
      results: <ResourcePreview>[],
      docsIndexed: 0,
      providersSearched: <String>[],
    );

    try {
      // Start pipeline job on backend
      final Map<String, dynamic> resp = await _apiClient.post(
        ApiEndpoints.pipelineSearch,
        <String, dynamic>{'query': clean, 'limit': 20},
      );

      final String jobId = resp['job_id'] as String? ?? '';
      final bool isDone = resp['is_done'] as bool? ?? false;
      final String state0 = resp['state'] as String? ?? 'local_search';

      _applyJobResponse(resp);

      if (isDone || state0 == 'found_local' || state0 == 'complete') {
        // Already done (rare — local search was instant)
        await _finalizeSearch(clean);
        return;
      }

      // Poll every 2 seconds until done
      _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
        await _pollJob(clean, jobId);
      });
    } catch (e) {
      // Pipeline backend unavailable — fallback to local keyword search
      await _localFallbackSearch(clean);
    }
  }

  Future<void> _pollJob(String query, String jobId) async {
    if (!mounted) {
      _cancelPoll();
      return;
    }
    try {
      final Map<String, dynamic> resp = await _apiClient.get(
        ApiEndpoints.pipelineStatus(jobId),
      );
      _applyJobResponse(resp);

      final bool isDone = resp['is_done'] as bool? ?? false;
      if (isDone) {
        _cancelPoll();
        await _finalizeSearch(query);
      }
    } catch (_) {
      _cancelPoll();
      await _localFallbackSearch(query);
    }
  }

  void _applyJobResponse(Map<String, dynamic> resp) {
    if (!mounted) return;

    final String stateStr = resp['state'] as String? ?? 'idle';
    final String message = resp['message'] as String? ?? '';
    final List<String> providers = List<String>.from(resp['providers_searched'] as List? ?? <String>[]);
    final int docsIndexed = resp['docs_indexed'] as int? ?? 0;
    final PipelineStage stage = PipelineStageX.fromState(stateStr);

    // Convert pipeline results to ResourcePreview if already available
    final List<dynamic> rawResults = resp['results'] as List? ?? <dynamic>[];
    final List<ResourcePreview> previews = rawResults
        .whereType<Map<String, dynamic>>()
        .map(_pipelineResultToPreview)
        .toList();

    state = state.copyWith(
      pipelineStage: stage,
      pipelineMessage: message,
      providersSearched: providers,
      docsIndexed: docsIndexed,
      results: previews.isNotEmpty ? previews : state.results,
      status: previews.isNotEmpty ? SearchStatus.success : SearchStatus.loading,
      totalCount: previews.length,
    );
  }

  Future<void> _finalizeSearch(String query) async {
    if (!mounted) return;

    // Also record the search in history
    if (query.isNotEmpty) {
      try {
        await _searchRepo.recordSearchQuery(query, resultCount: state.results.length);
        await loadRecentSearches();
      } catch (_) {}
    }

    final bool hasResults = state.results.isNotEmpty;
    state = state.copyWith(
      status: hasResults ? SearchStatus.success : SearchStatus.empty,
      pipelineStage: hasResults ? state.pipelineStage : PipelineStage.idle,
    );
  }

  /// Fallback when pipeline backend is unreachable — runs local keyword search.
  Future<void> _localFallbackSearch(String query) async {
    if (!mounted) return;
    try {
      final SearchFilter activeFilter = state.filter.copyWith(query: query);
      final List<SearchResultItem> items = await _searchRepo.searchAdvanced(
        activeFilter,
        sort: state.sortOption,
        limit: 50,
      );
      final List<ResourcePreview> previews = items.map((SearchResultItem i) => i.toPreview()).toList();

      if (query.isNotEmpty) {
        await _searchRepo.recordSearchQuery(query, resultCount: previews.length);
        await loadRecentSearches();
      }

      state = state.copyWith(
        results: previews,
        status: previews.isNotEmpty ? SearchStatus.success : SearchStatus.empty,
        totalCount: previews.length,
        pipelineStage: PipelineStage.idle,
      );
    } catch (e) {
      state = state.copyWith(
        status: SearchStatus.error,
        errorMessage: e.toString(),
        pipelineStage: PipelineStage.idle,
      );
    }
  }

  ResourcePreview _pipelineResultToPreview(Map<String, dynamic> r) {
    final List<String> authors = List<String>.from(r['authors'] as List? ?? <String>[]);
    return ResourcePreview(
      id: r['id'] as String? ?? '',
      title: r['title'] as String? ?? 'Untitled',
      authors: authors,
      year: (r['year'] as int?) ?? 0,
      type: ResourceType.paper,
      verificationTier: VerificationTier.verified,
      sizeBytes: 0,
      peerSeeders: int.tryParse('${r['citations'] ?? 0}') ?? 0,
      cid: '',
      doi: r['doi'] as String?,
      isDownloaded: false,
    );
  }

  void _cancelPoll() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  /// Updates search query string and triggers search.
  void updateQuery(String newQuery) => search(newQuery);

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

  void clearResults() {
    _cancelPoll();
    state = SearchState.initial;
  }

  /// Resets the search state entirely.
  void reset() => clearResults();

  /// Clears all search history records.
  Future<void> clearAllHistory() async {
    // Clear from local state; individual entries can be removed via deleteRecentSearch
    state = state.copyWith(recentSearches: <String>[], searchHistory: <SearchHistoryModel>[]);
  }

}

/// Provider for the current search query string (separate from SearchState for text-field binding).
final StateProvider<String> searchQueryProvider = StateProvider<String>((StateProviderRef<String> ref) => '');

/// Provider wiring SearchNotifier with search repository + API client.
final StateNotifierProvider<SearchNotifier, SearchState> searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((Ref ref) {
  final ISearchRepository repo = ref.watch(searchRepositoryProvider);
  final ApiClient client = ref.watch(apiClientProvider);
  return SearchNotifier(repo, client);
});
