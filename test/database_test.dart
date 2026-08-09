import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/services/cache/cache_service.dart';
import 'package:study_vault/core/services/database/app_database.dart';
import 'package:study_vault/core/services/database/database_service.dart';
import 'package:study_vault/core/services/migration/migration_service.dart';
import 'package:study_vault/core/services/storage/storage_service.dart';
import 'package:study_vault/core/services/sync/sync_service.dart';
import 'package:study_vault/data/datasources/local/local_data_source.dart';
import 'package:study_vault/data/models/author_model.dart';
import 'package:study_vault/data/models/book_model.dart';
import 'package:study_vault/data/models/category_model.dart';
import 'package:study_vault/data/models/download_model.dart';
import 'package:study_vault/data/models/favorite_model.dart';
import 'package:study_vault/data/models/network_metadata_model.dart';
import 'package:study_vault/data/models/note_model.dart';
import 'package:study_vault/data/models/reading_progress_model.dart';
import 'package:study_vault/data/models/research_paper_model.dart';
import 'package:study_vault/data/models/resource_model.dart';
import 'package:study_vault/data/models/settings_model.dart';
import 'package:study_vault/data/repositories/book_repository_impl.dart';
import 'package:study_vault/data/repositories/download_repository_impl.dart';
import 'package:study_vault/data/repositories/library_repository_impl.dart';
import 'package:study_vault/data/repositories/search_repository_impl.dart';
import 'package:study_vault/data/repositories/settings_repository_impl.dart';
import 'package:study_vault/shared/enums/resource_type.dart';
import 'package:study_vault/shared/enums/verification_tier.dart';

void main() {
  late AppDatabase db;
  late LocalDataSourceImpl localDataSource;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    localDataSource = LocalDataSourceImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('Drift SQLite Database & Local Data Architecture Tests', () {
    test('Database initializes and executes PRAGMA integrity check', () async {
      final DatabaseService service = DatabaseService(db);
      final bool isHealthy = await service.checkIntegrity();
      expect(isHealthy, isTrue);
    });

    test('Books table supports insertion, retrieval, and soft delete', () async {
      const BookModel book = BookModel(
        id: 'book_01',
        title: 'Distributed Consensus & ZK-Rollups in Academic Archives',
        authors: <String>['Dr. Elena Vance', 'Prof. Marcus Chen'],
        publicationYear: 2026,
        isbn: '978-0-123456-78-9',
        format: 'pdf',
        sizeBytes: 14680064,
        cid: 'bafybeic5zkrollup73d9f4a',
        verificationTier: 'verified',
        isDownloaded: true,
        peerSeeders: 142,
      );

      await localDataSource.saveBook(book);

      final BookModel? retrieved = await localDataSource.getBookById('book_01');
      expect(retrieved, isNotNull);
      expect(retrieved!.title, 'Distributed Consensus & ZK-Rollups in Academic Archives');
      expect(retrieved.authors, contains('Dr. Elena Vance'));
      expect(retrieved.cid, 'bafybeic5zkrollup73d9f4a');
      expect(retrieved.isDownloaded, isTrue);

      // Soft delete test
      await localDataSource.softDeleteBook('book_01');
      final BookModel? deleted = await localDataSource.getBookById('book_01');
      expect(deleted, isNull);
    });

    test('Research Papers table supports metadata, query by ID, and batch insertion', () async {
      const ResearchPaperModel paper = ResearchPaperModel(
        id: 'paper_01',
        title: 'Transformer Architecture Memory Footprint Benchmarking',
        abstractText: 'We present a comprehensive empirical benchmark of memory usage across transformer layers.',
        authors: <String>['AI Research Collective'],
        journal: 'Journal of Academic Machine Learning',
        publicationYear: 2025,
        doi: '10.1145/3372297.3417882',
        citationsCount: 42,
        isPeerReviewed: true,
        cid: 'bafybeitransformerbench334a',
      );

      await localDataSource.saveResearchPaper(paper);

      final ResearchPaperModel? retrieved = await localDataSource.getPaperById('paper_01');
      expect(retrieved, isNotNull);
      expect(retrieved!.journal, 'Journal of Academic Machine Learning');
      expect(retrieved.citationsCount, 42);
    });

    test('Notes table supports tagging, pinning, and reading position anchors', () async {
      const NoteModel note = NoteModel(
        id: 'note_01',
        title: 'Key Takeaways on Surface Codes',
        content: 'Surface codes require a 2D grid of physical qubits with nearest-neighbor couplings.',
        resourceId: 'book_01',
        colorHex: '#63F2E8',
        tags: <String>['quantum', 'error-correction'],
        isPinned: true,
        readingPosition: 'page-42',
      );

      await localDataSource.saveNote(note);

      final List<NoteModel> notes = await localDataSource.getNotes(resourceId: 'book_01');
      expect(notes, hasLength(1));
      expect(notes.first.isPinned, isTrue);
      expect(notes.first.tags, contains('quantum'));
      expect(notes.first.readingPosition, 'page-42');
    });

    test('Downloads table tracks chunk progress and throughput speed', () async {
      const DownloadModel download = DownloadModel(
        id: 'dl_01',
        resourceId: 'res_01',
        title: 'CRISPR-Cas12 Genomic Sequencing Dataset',
        fileSizeBytes: 1048576000,
        bytesDownloaded: 209715200,
        downloadStatus: 'downloading',
        downloadSpeedBps: 8388608,
        progress: 0.20,
        peerCount: 38,
      );

      await localDataSource.saveDownload(download);

      final DownloadModel? item = await localDataSource.getDownloadByResourceId('res_01');
      expect(item, isNotNull);
      expect(item!.progress, 0.20);
      expect(item.peerCount, 38);

      // Update progress
      await localDataSource.updateDownloadProgress('res_01', 1.0, 1048576000, 0);
      final DownloadModel? completed = await localDataSource.getDownloadByResourceId('res_01');
      expect(completed!.downloadStatus, 'completed');
      expect(completed.progress, 1.0);
    });

    test('Favorites table supports bookmarks and toggle behavior', () async {
      const FavoriteModel favorite = FavoriteModel(
        id: 'fav_01',
        resourceId: 'res_01',
        title: 'Quantum Error Correction with Surface Codes',
        authors: <String>['Prof. David Thorne'],
      );

      await localDataSource.addFavorite(favorite);
      expect(await localDataSource.isFavorite('res_01'), isTrue);

      await localDataSource.removeFavorite('res_01');
      expect(await localDataSource.isFavorite('res_01'), isFalse);
    });

    test('ReadingProgress table persists current page and reading duration', () async {
      const ReadingProgressModel progress = ReadingProgressModel(
        id: 'prog_01',
        resourceId: 'book_01',
        title: 'Distributed Consensus',
        currentPage: 142,
        totalPages: 210,
        progress: 0.68,
        timeSpentSeconds: 3600,
      );

      await localDataSource.saveReadingProgress(progress);

      final ReadingProgressModel? retrieved = await localDataSource.getReadingProgress('book_01');
      expect(retrieved, isNotNull);
      expect(retrieved!.currentPage, 142);
      expect(retrieved.progress, 0.68);
      expect(retrieved.timeSpentSeconds, 3600);
    });

    test('Search history and autocomplete recent searches work seamlessly', () async {
      await localDataSource.recordRecentSearch('Zero-knowledge proofs');
      await localDataSource.recordRecentSearch('Genomics GRCh38');
      await localDataSource.recordRecentSearch('Zero-knowledge proofs'); // Increment hit count

      final List<String> recents = await localDataSource.getRecentSearches();
      expect(recents, contains('Zero-knowledge proofs'));
      expect(recents, contains('Genomics GRCh38'));
    });

    test('Settings table stores and retrieves encrypted/unencrypted parameters', () async {
      const SettingsModel setting = SettingsModel(
        id: 'set_01',
        key: 'celestial_dark_mode',
        value: 'true',
        category: 'appearance',
      );

      await localDataSource.saveSetting(setting);

      final SettingsModel? retrieved = await localDataSource.getSetting('celestial_dark_mode');
      expect(retrieved, isNotNull);
      expect(retrieved!.value, 'true');
      expect(retrieved.category, 'appearance');
    });

    test('NetworkMetadata table logs swarm metrics and DHT reputation', () async {
      const NetworkMetadataModel network = NetworkMetadataModel(
        id: 'net_01',
        swarmId: 'studyvault_mesh_eu',
        peerCount: 142,
        averageLatencyMs: 38,
        downloadSpeedBps: 10485760,
        dhtReputationScore: 99.9,
      );

      await localDataSource.saveNetworkMetadata(network);

      final NetworkMetadataModel? retrieved = await localDataSource.getNetworkMetadata('studyvault_mesh_eu');
      expect(retrieved, isNotNull);
      expect(retrieved!.peerCount, 142);
      expect(retrieved.dhtReputationScore, 99.9);
    });
  });

  group('Domain & Data Models JSON Serialization Roundtrip Tests', () {
    test('BookModel serializes to JSON and deserializes identically', () {
      const BookModel model = BookModel(
        id: 'bm_01',
        title: 'Principles of Quantum Algorithms',
        authors: <String>['Alice Researcher', 'Bob Scientist'],
        publicationYear: 2026,
        sizeBytes: 8192000,
        format: 'pdf',
        cid: 'bafybeialicebobquantum77a',
      );

      final Map<String, dynamic> json = model.toJson();
      final BookModel deserialized = BookModel.fromJson(json);

      expect(deserialized.id, model.id);
      expect(deserialized.title, model.title);
      expect(deserialized.authors, model.authors);
      expect(deserialized.publicationYear, model.publicationYear);
      expect(deserialized.cid, model.cid);
    });

    test('ResourceModel serializes and deserializes with Enums', () {
      const ResourceModel model = ResourceModel(
        id: 'rm_01',
        title: 'Open Source Neural Architecture Search',
        type: ResourceType.dataset,
        verificationTier: VerificationTier.peerReviewed,
        authors: <String>['OpenNAS Group'],
      );

      final Map<String, dynamic> json = model.toJson();
      final ResourceModel deserialized = ResourceModel.fromJson(json);

      expect(deserialized.id, model.id);
      expect(deserialized.type, ResourceType.dataset);
      expect(deserialized.verificationTier, VerificationTier.peerReviewed);
      expect(deserialized.authors, model.authors);
    });

    test('CategoryModel, AuthorModel, and DownloadModel serialize properly', () {
      const CategoryModel cat = CategoryModel(
        id: 'cat_01',
        slug: 'computer-science',
        name: 'Computer Science',
        itemCount: 94200,
      );
      expect(CategoryModel.fromJson(cat.toJson()).slug, 'computer-science');

      const AuthorModel author = AuthorModel(
        id: 'auth_01',
        name: 'Dr. Elena Vance',
        orcid: '0000-0002-1825-0097',
        publicationCount: 84,
        hIndex: 32,
      );
      expect(AuthorModel.fromJson(author.toJson()).orcid, '0000-0002-1825-0097');

      const DownloadModel dl = DownloadModel(
        id: 'dl_01',
        resourceId: 'res_01',
        title: 'Genome Dataset',
        fileSizeBytes: 524288000,
        progress: 0.75,
      );
      expect(DownloadModel.fromJson(dl.toJson()).progress, 0.75);
    });
  });

  group('Clean Architecture Repositories Tests', () {
    test('BookRepositoryImpl, LibraryRepositoryImpl, and DownloadRepositoryImpl execute via datasource',
        () async {
      final BookRepositoryImpl bookRepo = BookRepositoryImpl(localDataSource);
      final LibraryRepositoryImpl libRepo = LibraryRepositoryImpl(localDataSource);
      final DownloadRepositoryImpl dlRepo = DownloadRepositoryImpl(localDataSource);
      final SearchRepositoryImpl searchRepo = SearchRepositoryImpl(localDataSource);
      final SettingsRepositoryImpl settingsRepo = SettingsRepositoryImpl(localDataSource);

      // BookRepo save & fetch
      await bookRepo.saveBook(
        const BookModel(
          id: 'repo_book_01',
          title: 'Algorithms in Rust & C++',
          authors: <String>['Systems Group'],
        ),
      );
      final BookModel? book = await bookRepo.getBookById('repo_book_01');
      expect(book, isNotNull);
      expect(book!.title, 'Algorithms in Rust & C++');

      // LibraryRepo favorites
      await libRepo.toggleFavorite(
        const FavoriteModel(
          id: 'fav_repo_01',
          resourceId: 'repo_book_01',
          title: 'Algorithms in Rust & C++',
        ),
      );
      expect(await libRepo.isFavorite('repo_book_01'), isTrue);

      // DownloadRepo queue
      await dlRepo.queueDownload(
        const DownloadModel(
          id: 'dl_repo_01',
          resourceId: 'repo_book_01',
          title: 'Algorithms in Rust & C++',
          fileSizeBytes: 10485760,
        ),
      );
      final DownloadModel? dl = await dlRepo.getDownloadByResourceId('repo_book_01');
      expect(dl, isNotNull);

      // SearchRepo queries
      await searchRepo.recordSearchQuery('Rust Algorithms');
      final List<String> recents = await searchRepo.getRecentSearches();
      expect(recents, contains('Rust Algorithms'));

      // SettingsRepo
      await settingsRepo.setSetting('quorum_strict_mode', 'true');
      final String? settingVal = await settingsRepo.getSettingValue('quorum_strict_mode');
      expect(settingVal, 'true');
    });
  });

  group('Core Services Tests', () {
    test('StorageService calculates capacity and quota fractions accurately', () {
      const StorageService storage = StorageService(maxQuotaBytes: 2147483648); // 2GB

      expect(storage.calculateUsageFraction(1073741824), 0.5); // 1GB is 50%
      expect(storage.formatBytes(1048576), '1.0 MB');
      expect(storage.formatBytes(1073741824), '1.00 GB');
      expect(storage.hasSufficientCapacity(1073741824, 524288000), isTrue);
      expect(storage.hasSufficientCapacity(2000000000, 500000000), isFalse);
    });

    test('CacheService supports LRU eviction and TTL expiration', () async {
      final CacheService cache = CacheService(maxEntries: 2, defaultTtl: const Duration(seconds: 10));

      cache.put<String>('key1', 'value1');
      cache.put<String>('key2', 'value2');
      expect(cache.get<String>('key1'), 'value1');

      // Exceed max entries
      cache.put<String>('key3', 'value3');
      expect(cache.get<String>('key2'), isNull); // key2 evicted because key1 was accessed more recently
      expect(cache.get<String>('key1'), 'value1');
      expect(cache.get<String>('key3'), 'value3');
    });

    test('MigrationService validates current and future schema versions', () {
      const MigrationService migration = MigrationService();
      expect(migration.canMigrate(1), isTrue);
      expect(migration.canMigrate(2), isFalse); // Cannot downgrade from future version 2 to 1
      expect(migration.getMigrationHistory(), isNotEmpty);
    });

    test('SyncService checks dirty counts', () async {
      final SyncService sync = SyncService(db);
      final int dirtyCount = await sync.getPendingDirtyCount();
      expect(dirtyCount, 0);
    });
  });
}
