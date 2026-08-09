import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/database/daos/search_dao.dart';
import 'package:study_vault/core/services/database/app_database.dart';
import 'package:study_vault/domain/search/models/search_filter.dart';
import 'package:study_vault/domain/search/models/search_result_item.dart';
import 'package:study_vault/domain/search/models/search_sort_option.dart';
import 'package:study_vault/shared/enums/resource_type.dart';

void main() {
  group('Search Engine & SearchDao Test Suite', () {
    late AppDatabase db;
    late SearchDao searchDao;

    setUp(() async {
      db = AppDatabase(NativeDatabase.memory());
      searchDao = SearchDao(db);

      // Seed Books
      await db.into(db.books).insert(
            BooksCompanion(
              id: const Value<String>('book-1'),
              title: const Value<String>('Quantum Error Correction with Surface Codes'),
              authorsJson: const Value<String>('["Prof. David Thorne", "Dr. Alice Turing"]'),
              language: const Value<String>('en'),
              pageCount: const Value<int>(420),
              format: const Value<String>('pdf'),
              sizeBytes: const Value<int>(28311552),
              publicationYear: const Value<int>(2026),
              doi: const Value<String>('10.1038/quantum.2026.01'),
              cid: const Value<String>('bafybeiquantum551c'),
              verificationTier: const Value<String>('verified'),
              categoryId: const Value<String>('cat_phys'),
              peerSeeders: const Value<int>(64),
              isDownloaded: const Value<bool>(true),
              createdAt: Value<DateTime>(DateTime.now()),
              updatedAt: Value<DateTime>(DateTime.now()),
            ),
          );

      await db.into(db.books).insert(
            BooksCompanion(
              id: const Value<String>('book-2'),
              title: const Value<String>('Principles of Distributed Systems & Consensus'),
              authorsJson: const Value<String>('["Dr. Leslie Lamport", "Prof. Marcus Chen"]'),
              language: const Value<String>('en'),
              pageCount: const Value<int>(512),
              format: const Value<String>('epub'),
              sizeBytes: const Value<int>(15728640),
              publicationYear: const Value<int>(2024),
              doi: const Value<String>('10.1145/distributed.2024.08'),
              cid: const Value<String>('bafybeidistributed882a'),
              verificationTier: const Value<String>('peerReviewed'),
              categoryId: const Value<String>('cat_cs'),
              peerSeeders: const Value<int>(180),
              isDownloaded: const Value<bool>(false),
              createdAt: Value<DateTime>(DateTime.now()),
              updatedAt: Value<DateTime>(DateTime.now()),
            ),
          );

      // Seed Research Papers
      await db.into(db.researchPapers).insert(
            ResearchPapersCompanion(
              id: const Value<String>('paper-1'),
              title: const Value<String>('CRISPR-Cas12 Genomic Sequencing Dataset Benchmark'),
              abstractText: const Value<String>('High throughput genomic cleavage and off-target analysis.'),
              authorsJson: const Value<String>('["Global Bioinformatics Initiative", "Dr. Jennifer Doudna"]'),
              format: const Value<String>('pdf'),
              sizeBytes: const Value<int>(52428800),
              publicationYear: const Value<int>(2025),
              doi: const Value<String>('10.1038/s41586-025-04289-w'),
              cid: const Value<String>('bafybeicrisprdataset91b'),
              verificationTier: const Value<String>('verified'),
              categoryId: const Value<String>('cat_bio'),
              peerSeeders: const Value<int>(310),
              isDownloaded: const Value<bool>(false),
              isPeerReviewed: const Value<bool>(true),
              citationsCount: const Value<int>(94),
              createdAt: Value<DateTime>(DateTime.now()),
              updatedAt: Value<DateTime>(DateTime.now()),
            ),
          );
    });

    tearDown(() async {
      await db.close();
    });

    test('Case-insensitive exact and partial matching', () async {
      final List<SearchResultItem> results = await searchDao.search(
        const SearchFilter(query: 'quantum'),
      );

      expect(results.isNotEmpty, isTrue);
      expect(results.first.resource.title, contains('Quantum Error Correction'));
      expect(results.first.score, greaterThan(20.0));
    });

    test('Multi-word token search matches Title & Authors across fields', () async {
      final List<SearchResultItem> results = await searchDao.search(
        const SearchFilter(query: 'surface codes thorne'),
      );

      expect(results.isNotEmpty, isTrue);
      expect(results.first.resource.id, equals('book-1'));
      expect(results.first.matchedKeywords, containsAll(<String>['surface', 'codes', 'thorne']));
    });

    test('Filter by ResourceType returns only specified types', () async {
      final List<SearchResultItem> bookResults = await searchDao.search(
        const SearchFilter(resourceType: ResourceType.book),
      );
      expect(bookResults.every((SearchResultItem r) => r.resource.type == ResourceType.book), isTrue);

      final List<SearchResultItem> paperResults = await searchDao.search(
        const SearchFilter(resourceType: ResourceType.paper),
      );
      expect(paperResults.every((SearchResultItem r) => r.resource.type == ResourceType.paper), isTrue);
    });

    test('Filter by isDownloaded flag', () async {
      final List<SearchResultItem> downloaded = await searchDao.search(
        const SearchFilter(isDownloaded: true),
      );

      expect(downloaded.length, equals(1));
      expect(downloaded.first.resource.id, equals('book-1'));
    });

    test('Filter by publication year range', () async {
      final List<SearchResultItem> recent = await searchDao.search(
        const SearchFilter(minYear: 2025),
      );

      expect(recent.length, equals(2));
      expect(recent.any((SearchResultItem r) => r.resource.publicationYear == 2024), isFalse);
    });

    test('Sorting by highest seeders', () async {
      final List<SearchResultItem> results = await searchDao.search(
        const SearchFilter(),
        sort: SearchSortOption.highestSeeders,
      );

      expect(results.length, equals(3));
      expect(results.first.resource.peerSeeders, equals(310));
      expect(results.last.resource.peerSeeders, equals(64));
    });

    test('Sorting alphabetically by title', () async {
      final List<SearchResultItem> results = await searchDao.search(
        const SearchFilter(),
        sort: SearchSortOption.titleAsc,
      );

      expect(results.first.resource.title.startsWith('CRISPR'), isTrue);
    });

    test('Search history records query and increments hit count', () async {
      await searchDao.recordSearchHistory('distributed systems', resultCount: 5);
      await searchDao.recordSearchHistory('distributed systems', resultCount: 5);

      final List<String> recents = await searchDao.getRecentSearches();
      expect(recents, contains('distributed systems'));

      final RecentSearche? row = await (db.select(db.recentSearches)
            ..where(($RecentSearchesTable tbl) => tbl.term.equals('distributed systems')))
          .getSingleOrNull();

      expect(row != null, isTrue);
      expect(row!.hitCount, equals(2));
    });

    test('Autocomplete suggestions return prefix matches', () async {
      await searchDao.recordSearchHistory('Zero-Knowledge Proofs');
      await searchDao.recordSearchHistory('ZK-Rollups for Archives');

      final List<String> suggestions = await searchDao.getSuggestions('zk');
      expect(suggestions.isNotEmpty, isTrue);
      expect(suggestions.first.toLowerCase(), startsWith('zk'));
    });

    test('Clear search history soft deletes entries', () async {
      await searchDao.recordSearchHistory('Quantum Cryptography');
      await searchDao.clearSearchHistory();

      final List<String> recents = await searchDao.getRecentSearches();
      expect(recents.isEmpty, isTrue);
    });
  });
}
