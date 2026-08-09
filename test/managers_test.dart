import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/managers/download_metadata_manager.dart';
import 'package:study_vault/core/managers/favorite_manager.dart';
import 'package:study_vault/core/managers/local_library_manager.dart';
import 'package:study_vault/core/managers/reading_progress_manager.dart';
import 'package:study_vault/core/managers/recent_resources_manager.dart';
import 'package:study_vault/core/services/database/app_database.dart';
import 'package:study_vault/core/services/storage/storage_service.dart';
import 'package:study_vault/data/datasources/local/local_data_source.dart';
import 'package:study_vault/data/models/book_model.dart';
import 'package:study_vault/data/models/download_model.dart';
import 'package:study_vault/data/models/favorite_model.dart';
import 'package:study_vault/data/models/reading_progress_model.dart';
import 'package:study_vault/data/models/resource_model.dart';
import 'package:study_vault/data/repositories/book_repository_impl.dart';
import 'package:study_vault/data/repositories/download_repository_impl.dart';
import 'package:study_vault/data/repositories/library_repository_impl.dart';
import 'package:study_vault/data/repositories/resource_repository_impl.dart';

void main() {
  group('Local Resource Managers Test Suite', () {
    late AppDatabase db;
    late ILocalDataSource localSource;
    late LibraryRepositoryImpl libraryRepo;
    late BookRepositoryImpl bookRepo;
    late DownloadRepositoryImpl downloadRepo;
    late ResourceRepositoryImpl resourceRepo;
    late LocalLibraryManager libraryManager;
    late FavoriteManager favoriteManager;
    late ReadingProgressManager progressManager;
    late RecentResourcesManager recentManager;
    late DownloadMetadataManager downloadManager;

    setUp(() async {
      db = AppDatabase(NativeDatabase.memory());
      localSource = LocalDataSourceImpl(db);
      libraryRepo = LibraryRepositoryImpl(localSource);
      bookRepo = BookRepositoryImpl(localSource);
      downloadRepo = DownloadRepositoryImpl(localSource);
      resourceRepo = ResourceRepositoryImpl(localSource);

      libraryManager = LocalLibraryManager(
        libraryRepository: libraryRepo,
        bookRepository: bookRepo,
        storageService: const StorageService(),
      );
      favoriteManager = FavoriteManager(libraryRepo);
      progressManager = ReadingProgressManager(libraryRepo);
      recentManager = RecentResourcesManager(resourceRepository: resourceRepo, maxRecentCount: 3);
      downloadManager = DownloadMetadataManager(downloadRepo);

      // Seed a book
      final BookModel sampleBook = BookModel(
        id: 'book-sample-1',
        title: 'Algorithms in Rust',
        authors: const <String>['Alice Rustacean'],
        language: 'en',
        pageCount: 340,
        format: 'pdf',
        sizeBytes: 10485760, // 10MB
        isDownloaded: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await bookRepo.saveBook(sampleBook);
    });

    tearDown(() async {
      await db.close();
    });

    test('LocalLibraryManager retrieves saved items and computes storage usage', () async {
      final List<ResourceModel> items = await libraryManager.getVaultResources();
      expect(items.isNotEmpty, isTrue);
      expect(items.first.id, equals('book-sample-1'));

      final double fraction = await libraryManager.getVaultCapacityFraction();
      expect(fraction, greaterThan(0.0));

      final String usage = await libraryManager.getFormattedUsage();
      expect(usage, contains('MB'));
    });

    test('FavoriteManager toggles bookmark and watches stream', () async {
      final FavoriteModel fav = FavoriteModel(
        id: 'fav-1',
        resourceId: 'book-sample-1',
        title: 'Algorithms in Rust',
        authors: const <String>['Alice Rustacean'],
        addedAt: DateTime.now(),
      );

      await favoriteManager.toggleFavorite(fav);
      bool isFav = await favoriteManager.isFavorite('book-sample-1');
      expect(isFav, isTrue);

      await favoriteManager.toggleFavorite(fav);
      isFav = await favoriteManager.isFavorite('book-sample-1');
      expect(isFav, isFalse);
    });

    test('ReadingProgressManager computes progress fraction and accumulates reading time', () async {
      await progressManager.updateProgress(
        resourceId: 'book-sample-1',
        title: 'Algorithms in Rust',
        currentPage: 85,
        totalPages: 340,
        additionalSeconds: 300,
      );

      final ReadingProgressModel? progress = await progressManager.getProgress('book-sample-1');
      expect(progress != null, isTrue);
      expect(progress!.progress, equals(0.25));
      expect(progress.timeSpentSeconds, equals(300));

      await progressManager.updateProgress(
        resourceId: 'book-sample-1',
        title: 'Algorithms in Rust',
        currentPage: 170,
        totalPages: 340,
        additionalSeconds: 300,
      );

      final ReadingProgressModel? updated = await progressManager.getProgress('book-sample-1');
      expect(updated!.progress, equals(0.5));
      expect(updated.timeSpentSeconds, equals(600));
    });

    test('RecentResourcesManager maintains LRU cap', () async {
      await recentManager.recordAccess('book-sample-1');
      final List<ResourceModel> recents = recentManager.getRecentResources();
      expect(recents.length, equals(1));
      expect(recents.first.id, equals('book-sample-1'));
    });

    test('DownloadMetadataManager queues and tracks download progress', () async {
      await downloadManager.queueDownload(
        resourceId: 'book-sample-1',
        title: 'Algorithms in Rust',
        fileSizeBytes: 10485760,
      );

      final List<DownloadModel> active = await downloadManager.getActiveDownloads();
      expect(active.isNotEmpty, isTrue);
      expect(active.first.resourceId, equals('book-sample-1'));

      await downloadManager.updateProgress('book-sample-1', 1.0, 10485760, 4194304);
      final List<DownloadModel> afterCompletion = await downloadManager.getActiveDownloads();
      expect(afterCompletion.isEmpty, isTrue);
    });
  });
}
