import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/data/models/resource_model.dart';
import 'package:study_vault/data/models/search_history_model.dart';
import 'package:study_vault/domain/repositories/search_repository.dart';
import 'package:study_vault/domain/search/models/search_filter.dart';
import 'package:study_vault/domain/search/models/search_result_item.dart';
import 'package:study_vault/domain/search/models/search_sort_option.dart';
import 'package:study_vault/features/search/presentation/providers/search_provider.dart';
import 'package:study_vault/shared/enums/resource_type.dart';
import 'package:study_vault/shared/enums/verification_tier.dart';

class MockSearchRepository implements ISearchRepository {
  final List<String> recentSearches = <String>['zkSNARK', 'Transformer'];
  final List<SearchHistoryModel> history = <SearchHistoryModel>[];

  @override
  Future<void> clearHistory() async {
    recentSearches.clear();
    history.clear();
  }

  @override
  Future<List<String>> getRecentSearches({int limit = 10}) async {
    return recentSearches;
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory({int limit = 20}) async {
    return history;
  }

  @override
  Future<List<String>> getSuggestions(String prefix, {int limit = 8}) async {
    return <String>['$prefix proof', '$prefix network'];
  }

  @override
  Future<void> recordSearchQuery(String query, {int resultCount = 0, Map<String, dynamic> filters = const <String, dynamic>{}}) async {
    if (!recentSearches.contains(query)) {
      recentSearches.insert(0, query);
    }
  }

  @override
  Future<void> removeRecentSearch(String term) async {
    recentSearches.remove(term);
  }

  @override
  Future<List<ResourceModel>> search(String query, {String? categoryId}) async {
    return <ResourceModel>[];
  }

  @override
  Future<List<SearchResultItem>> searchAdvanced(
    SearchFilter filter, {
    SearchSortOption sort = SearchSortOption.mostRelevant,
    int limit = 50,
    int offset = 0,
  }) async {
    return <SearchResultItem>[
      const SearchResultItem(
        resource: ResourceModel(
          id: 'res-1',
          title: 'Decentralized zkSNARK Systems',
          authors: <String>['Dr. Elena Vance'],
          type: ResourceType.paper,
          verificationTier: VerificationTier.verified,
          peerSeeders: 120,
          isDownloaded: true,
        ),
        score: 100.0,
      ),
    ];
  }
}

void main() {
  group('SearchNotifier & Riverpod State Tests', () {
    late MockSearchRepository mockRepo;
    late SearchNotifier notifier;

    setUp(() {
      mockRepo = MockSearchRepository();
      notifier = SearchNotifier(mockRepo);
    });

    test('Initial state contains empty results and idle status', () {
      expect(notifier.state.results.isEmpty, isTrue);
      expect(notifier.state.status, equals(SearchStatus.idle));
    });

    test('Search executes and updates results and status', () async {
      await notifier.search('zkSNARK');
      expect(notifier.state.status, equals(SearchStatus.success));
      expect(notifier.state.results.length, equals(1));
      expect(notifier.state.results.first.title, contains('zkSNARK'));
    });

    test('Filter updates reload search with new filter criteria', () async {
      notifier.setFilter(ResourceType.paper);
      expect(notifier.state.filter.resourceType, equals(ResourceType.paper));
    });

    test('Sort updates change active sorting option', () async {
      notifier.setSortOption(SearchSortOption.highestSeeders);
      expect(notifier.state.sortOption, equals(SearchSortOption.highestSeeders));
    });

    test('Delete recent search removes term from state', () async {
      await notifier.loadRecentSearches();
      await notifier.deleteRecentSearch('zkSNARK');
      expect(notifier.state.recentSearches.contains('zkSNARK'), isFalse);
    });

    test('Clear all history empties state recent list', () async {
      await notifier.clearAllHistory();
      expect(notifier.state.recentSearches.isEmpty, isTrue);
    });

    test('Reset returns state to initial', () {
      notifier.reset();
      expect(notifier.state.query, isEmpty);
      expect(notifier.state.status, equals(SearchStatus.idle));
    });
  });
}
