import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../data/models/resource_model.dart';
import '../../../domain/search/models/search_filter.dart';
import '../../../domain/search/models/search_result_item.dart';
import '../../../domain/search/models/search_sort_option.dart';
import '../../../shared/enums/resource_type.dart';
import '../../../shared/enums/verification_tier.dart';
import '../../services/database/app_database.dart';

/// Data Access Object providing high-performance local indexing, ranking, and search querying.
class SearchDao {
  const SearchDao(this._db);

  final AppDatabase _db;

  /// Executes advanced search with multi-field matching, filter conditions, relevance ranking, and pagination.
  Future<List<SearchResultItem>> search(
    SearchFilter filter, {
    SearchSortOption sort = SearchSortOption.mostRelevant,
    int limit = 50,
    int offset = 0,
  }) async {
    final List<ResourceModel> candidatePool = <ResourceModel>[];

    // 1. Query Books if filter permits
    if (filter.resourceType == null || filter.resourceType == ResourceType.book) {
      final List<Book> bookRows = await (_db.select(_db.books)
            ..where(($BooksTable tbl) => tbl.isDeleted.equals(false)))
          .get();

      for (final Book row in bookRows) {
        candidatePool.add(_mapBookToResource(row));
      }
    }

    // 2. Query Research Papers if filter permits
    if (filter.resourceType == null || filter.resourceType == ResourceType.paper || filter.resourceType == ResourceType.dataset) {
      final List<ResearchPaper> paperRows = await (_db.select(_db.researchPapers)
            ..where(($ResearchPapersTable tbl) => tbl.isDeleted.equals(false)))
          .get();

      for (final ResearchPaper row in paperRows) {
        candidatePool.add(_mapPaperToResource(row));
      }
    }

    // 3. Filter candidate pool
    final List<SearchResultItem> scoredResults = <SearchResultItem>[];
    final String cleanQuery = filter.query?.trim().toLowerCase() ?? '';
    final List<String> queryTokens = cleanQuery.isNotEmpty ? cleanQuery.split(RegExp(r'\s+')) : <String>[];

    for (final ResourceModel item in candidatePool) {
      if (!_matchesFilter(item, filter)) continue;

      double score = 1.0;
      final List<String> matchedKeywords = <String>[];
      String? highlightField;

      if (cleanQuery.isNotEmpty) {
        final String titleLower = item.title.toLowerCase();
        final String authorsLower = item.authors.join(' ').toLowerCase();
        final String doiLower = item.doi?.toLowerCase() ?? '';
        final String cidLower = item.cid?.toLowerCase() ?? '';

        // Exact match bonus
        if (titleLower == cleanQuery) {
          score += 100.0;
          highlightField = 'title';
        } else if (titleLower.startsWith(cleanQuery)) {
          score += 50.0;
          highlightField = 'title';
        } else if (titleLower.contains(cleanQuery)) {
          score += 25.0;
          highlightField = 'title';
        }

        // Tokenized multi-word search
        bool allTokensMatched = true;
        for (final String token in queryTokens) {
          bool tokenMatched = false;
          if (titleLower.contains(token)) {
            score += 10.0;
            tokenMatched = true;
            matchedKeywords.add(token);
          }
          if (authorsLower.contains(token)) {
            score += 8.0;
            tokenMatched = true;
            matchedKeywords.add(token);
            highlightField ??= 'authors';
          }
          if (doiLower.contains(token) || cidLower.contains(token)) {
            score += 15.0;
            tokenMatched = true;
            highlightField ??= 'identifier';
          }

          if (!tokenMatched) {
            allTokensMatched = false;
          }
        }

        // If query was specified but none of the tokens matched, discard
        if (!allTokensMatched && matchedKeywords.isEmpty) {
          continue;
        }
      }

      // Add popularity weighting
      score += (item.peerSeeders * 0.05);

      scoredResults.add(
        SearchResultItem(
          resource: item,
          score: score,
          matchedKeywords: matchedKeywords,
          highlightField: highlightField,
        ),
      );
    }

    // 4. Sort results
    _sortResults(scoredResults, sort);

    // 5. Paginate
    if (offset >= scoredResults.length) {
      return <SearchResultItem>[];
    }
    final int end = (offset + limit).clamp(0, scoredResults.length);
    return scoredResults.sublist(offset, end);
  }

  /// Generates fast autocomplete suggestions based on query prefix.
  Future<List<String>> getSuggestions(String prefix, {int limit = 8}) async {
    final String cleanPrefix = prefix.trim().toLowerCase();
    if (cleanPrefix.isEmpty) {
      return getRecentSearches(limit: limit);
    }

    final Set<String> suggestions = <String>{};

    // 1. Match from RecentSearches
    final List<RecentSearche> recentMatches = await (_db.select(_db.recentSearches)
          ..where(($RecentSearchesTable tbl) =>
              tbl.term.lower().like('$cleanPrefix%') & tbl.isDeleted.equals(false))
          ..limit(limit)
          ..orderBy(<OrderClauseGenerator<$RecentSearchesTable>>[
            ($RecentSearchesTable t) => OrderingTerm(expression: t.hitCount, mode: OrderingMode.desc),
          ]))
        .get();

    for (final RecentSearche r in recentMatches) {
      suggestions.add(r.term);
      if (suggestions.length >= limit) return suggestions.toList();
    }

    // 2. Match from Book Titles
    final List<Book> bookMatches = await (_db.select(_db.books)
          ..where(($BooksTable tbl) =>
              tbl.title.lower().like('%$cleanPrefix%') & tbl.isDeleted.equals(false))
          ..limit(limit))
        .get();

    for (final Book b in bookMatches) {
      suggestions.add(b.title);
      if (suggestions.length >= limit) return suggestions.toList();
    }

    // 3. Match from Research Papers
    final List<ResearchPaper> paperMatches = await (_db.select(_db.researchPapers)
          ..where(($ResearchPapersTable tbl) =>
              tbl.title.lower().like('%$cleanPrefix%') & tbl.isDeleted.equals(false))
          ..limit(limit))
        .get();

    for (final ResearchPaper p in paperMatches) {
      suggestions.add(p.title);
      if (suggestions.length >= limit) return suggestions.toList();
    }

    return suggestions.toList();
  }

  /// Records executed search query and increments frequency counter.
  Future<void> recordSearchHistory(String query, {int resultCount = 0, Map<String, dynamic> filters = const <String, dynamic>{}}) async {
    final String clean = query.trim();
    if (clean.isEmpty) return;

    // Upsert into RecentSearches
    final RecentSearche? existing = await (_db.select(_db.recentSearches)
          ..where(($RecentSearchesTable tbl) => tbl.term.equals(clean) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();

    if (existing != null) {
      await (_db.update(_db.recentSearches)..where(($RecentSearchesTable tbl) => tbl.id.equals(existing.id))).write(
        RecentSearchesCompanion(
          hitCount: Value<int>(existing.hitCount + 1),
          lastQueriedAt: Value<DateTime>(DateTime.now()),
          updatedAt: Value<DateTime>(DateTime.now()),
        ),
      );
    } else {
      await _db.into(_db.recentSearches).insert(
        RecentSearchesCompanion(
          id: Value<String>('recent_${DateTime.now().millisecondsSinceEpoch}'),
          term: Value<String>(clean),
          hitCount: const Value<int>(1),
          lastQueriedAt: Value<DateTime>(DateTime.now()),
          createdAt: Value<DateTime>(DateTime.now()),
          updatedAt: Value<DateTime>(DateTime.now()),
        ),
      );
    }

    // Insert SearchHistory log
    await _db.into(_db.searchHistory).insert(
      SearchHistoryCompanion(
        id: Value<String>('hist_${DateTime.now().millisecondsSinceEpoch}'),
        query: Value<String>(clean),
        resultCount: Value<int>(resultCount),
        filtersJson: Value<String>(jsonEncode(filters)),
        searchedAt: Value<DateTime>(DateTime.now()),
        createdAt: Value<DateTime>(DateTime.now()),
        updatedAt: Value<DateTime>(DateTime.now()),
      ),
    );
  }

  /// Returns list of recent search query strings.
  Future<List<String>> getRecentSearches({int limit = 10}) async {
    final List<RecentSearche> rows = await (_db.select(_db.recentSearches)
          ..where(($RecentSearchesTable tbl) => tbl.isDeleted.equals(false))
          ..limit(limit)
          ..orderBy(<OrderClauseGenerator<$RecentSearchesTable>>[
            ($RecentSearchesTable t) => OrderingTerm(expression: t.lastQueriedAt, mode: OrderingMode.desc),
          ]))
        .get();
    return rows.map((RecentSearche r) => r.term).toList();
  }

  /// Removes a specific search term from recent searches.
  Future<void> removeRecentSearch(String term) async {
    await (_db.update(_db.recentSearches)..where(($RecentSearchesTable tbl) => tbl.term.equals(term))).write(
      RecentSearchesCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
      ),
    );
  }

  /// Clears all recent searches and search history.
  Future<void> clearSearchHistory() async {
    await (_db.update(_db.recentSearches)).write(
      RecentSearchesCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
      ),
    );
    await (_db.update(_db.searchHistory)).write(
      SearchHistoryCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
      ),
    );
  }

  // --------------------------------------------------------------------------
  // Private Helper Methods
  // --------------------------------------------------------------------------

  bool _matchesFilter(ResourceModel item, SearchFilter filter) {
    if (filter.resourceType != null && item.type != filter.resourceType) {
      return false;
    }
    if (filter.verificationTier != null && item.verificationTier != filter.verificationTier) {
      return false;
    }
    if (filter.categoryId != null && filter.categoryId!.isNotEmpty && item.categoryId != filter.categoryId) {
      return false;
    }
    if (filter.author != null && filter.author!.isNotEmpty) {
      final String authorTerm = filter.author!.toLowerCase();
      final bool hasAuthor = item.authors.any((String a) => a.toLowerCase().contains(authorTerm));
      if (!hasAuthor) return false;
    }
    if (filter.isDownloaded != null && item.isDownloaded != filter.isDownloaded) {
      return false;
    }
    if (filter.minYear != null && (item.publicationYear == null || item.publicationYear! < filter.minYear!)) {
      return false;
    }
    if (filter.maxYear != null && (item.publicationYear == null || item.publicationYear! > filter.maxYear!)) {
      return false;
    }
    if (filter.minPeerCount != null && item.peerSeeders < filter.minPeerCount!) {
      return false;
    }
    return true;
  }

  void _sortResults(List<SearchResultItem> list, SearchSortOption sort) {
    switch (sort) {
      case SearchSortOption.mostRelevant:
        list.sort((SearchResultItem a, SearchResultItem b) => b.score.compareTo(a.score));
        break;
      case SearchSortOption.highestSeeders:
        list.sort((SearchResultItem a, SearchResultItem b) => b.resource.peerSeeders.compareTo(a.resource.peerSeeders));
        break;
      case SearchSortOption.publicationYearDesc:
        list.sort((SearchResultItem a, SearchResultItem b) =>
            (b.resource.publicationYear ?? 0).compareTo(a.resource.publicationYear ?? 0));
        break;
      case SearchSortOption.publicationYearAsc:
        list.sort((SearchResultItem a, SearchResultItem b) =>
            (a.resource.publicationYear ?? 0).compareTo(b.resource.publicationYear ?? 0));
        break;
      case SearchSortOption.titleAsc:
        list.sort((SearchResultItem a, SearchResultItem b) => a.resource.title.compareTo(b.resource.title));
        break;
      case SearchSortOption.titleDesc:
        list.sort((SearchResultItem a, SearchResultItem b) => b.resource.title.compareTo(a.resource.title));
        break;
      case SearchSortOption.authorAsc:
        list.sort((SearchResultItem a, SearchResultItem b) {
          final String authorA = a.resource.authors.isNotEmpty ? a.resource.authors.first : '';
          final String authorB = b.resource.authors.isNotEmpty ? b.resource.authors.first : '';
          return authorA.compareTo(authorB);
        });
        break;
      case SearchSortOption.recentlyOpened:
      case SearchSortOption.recentlyDownloaded:
      case SearchSortOption.peerCount:
      case SearchSortOption.availabilityScore:
      case SearchSortOption.trustScore:
        list.sort((SearchResultItem a, SearchResultItem b) => b.score.compareTo(a.score));
        break;
    }
  }

  ResourceModel _mapBookToResource(Book b) {
    List<String> authors = <String>[];
    try {
      final dynamic decoded = jsonDecode(b.authorsJson);
      if (decoded is List) {
        authors = decoded.map((dynamic e) => e.toString()).toList();
      }
    } catch (_) {}

    VerificationTier tier = VerificationTier.verified;
    for (final VerificationTier val in VerificationTier.values) {
      if (val.name.toLowerCase() == b.verificationTier.toLowerCase()) {
        tier = val;
        break;
      }
    }

    return ResourceModel(
      id: b.id,
      title: b.title,
      subtitle: b.subtitle,
      authors: authors,
      type: ResourceType.book,
      verificationTier: tier,
      publicationYear: b.publicationYear,
      format: b.format,
      sizeBytes: b.sizeBytes,
      coverPath: b.coverPath,
      cid: b.cid,
      contentHash: b.contentHash,
      doi: b.doi,
      categoryId: b.categoryId,
      peerSeeders: b.peerSeeders,
      isDownloaded: b.isDownloaded,
      createdAt: b.createdAt,
      updatedAt: b.updatedAt,
    );
  }

  ResourceModel _mapPaperToResource(ResearchPaper p) {
    List<String> authors = <String>[];
    try {
      final dynamic decoded = jsonDecode(p.authorsJson);
      if (decoded is List) {
        authors = decoded.map((dynamic e) => e.toString()).toList();
      }
    } catch (_) {}

    VerificationTier tier = VerificationTier.peerReviewed;
    for (final VerificationTier val in VerificationTier.values) {
      if (val.name.toLowerCase() == p.verificationTier.toLowerCase()) {
        tier = val;
        break;
      }
    }

    return ResourceModel(
      id: p.id,
      title: p.title,
      authors: authors,
      type: ResourceType.paper,
      verificationTier: tier,
      publicationYear: p.publicationYear,
      format: p.format,
      sizeBytes: p.sizeBytes,
      cid: p.cid,
      contentHash: p.contentHash,
      doi: p.doi,
      categoryId: p.categoryId,
      peerSeeders: p.peerSeeders,
      isDownloaded: p.isDownloaded,
      createdAt: p.createdAt,
      updatedAt: p.updatedAt,
    );
  }
}
