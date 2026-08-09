import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/local/local_data_source.dart';
import '../../data/datasources/peer/peer_data_source.dart';
import '../../data/datasources/remote/remote_data_source.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../data/repositories/download_repository_impl.dart';
import '../../data/repositories/library_repository_impl.dart';
import '../../data/repositories/resource_repository_impl.dart';
import '../../data/repositories/search_repository_impl.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../data/repositories/sync_repository_impl.dart';
import '../../domain/repositories/book_repository.dart';
import '../../domain/repositories/download_repository.dart';
import '../../domain/repositories/library_repository.dart';
import '../../domain/repositories/resource_repository.dart';
import '../../domain/repositories/search_repository.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/repositories/sync_repository.dart';
import '../managers/download_metadata_manager.dart';
import '../managers/favorite_manager.dart';
import '../managers/local_library_manager.dart';
import '../managers/reading_progress_manager.dart';
import '../managers/recent_resources_manager.dart';
import '../network/api_client.dart';
import '../services/cache/cache_service.dart';
import '../services/database/app_database.dart';
import '../services/database/database_service.dart';
import '../services/migration/migration_service.dart';
import '../services/storage/storage_service.dart';
import '../services/sync/sync_service.dart';
import '../sync/metadata_sync_manager.dart';

// ----------------------------------------------------------------------------
// Core Database Provider
// ----------------------------------------------------------------------------

final Provider<AppDatabase> appDatabaseProvider = Provider<AppDatabase>((Ref ref) {
  final AppDatabase database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
});

// ----------------------------------------------------------------------------
// Data Sources Providers
// ----------------------------------------------------------------------------

final Provider<ILocalDataSource> localDataSourceProvider = Provider<ILocalDataSource>((Ref ref) {
  final AppDatabase db = ref.watch(appDatabaseProvider);
  return LocalDataSourceImpl(db);
});

final Provider<IRemoteDataSource> remoteDataSourceProvider = Provider<IRemoteDataSource>((Ref ref) {
  final ApiClient client = ref.watch(apiClientProvider);
  return RemoteDataSourceImpl(client);
});

final Provider<IPeerDataSource> peerDataSourceProvider = Provider<IPeerDataSource>((Ref ref) {
  return const PeerDataSourceImpl();
});

// ----------------------------------------------------------------------------
// Repositories Providers
// ----------------------------------------------------------------------------

final Provider<IBookRepository> bookRepositoryProvider = Provider<IBookRepository>((Ref ref) {
  final ILocalDataSource localSource = ref.watch(localDataSourceProvider);
  return BookRepositoryImpl(localSource);
});

final Provider<ILibraryRepository> libraryRepositoryProvider = Provider<ILibraryRepository>((Ref ref) {
  final ILocalDataSource localSource = ref.watch(localDataSourceProvider);
  return LibraryRepositoryImpl(localSource);
});

final Provider<IDownloadRepository> downloadRepositoryProvider = Provider<IDownloadRepository>((Ref ref) {
  final ILocalDataSource localSource = ref.watch(localDataSourceProvider);
  return DownloadRepositoryImpl(localSource);
});

final Provider<ISearchRepository> searchRepositoryProvider = Provider<ISearchRepository>((Ref ref) {
  final ILocalDataSource localSource = ref.watch(localDataSourceProvider);
  final IRemoteDataSource remoteSource = ref.watch(remoteDataSourceProvider);
  return SearchRepositoryImpl(localSource, remoteSource);
});


final Provider<ISettingsRepository> settingsRepositoryProvider = Provider<ISettingsRepository>((Ref ref) {
  final ILocalDataSource localSource = ref.watch(localDataSourceProvider);
  return SettingsRepositoryImpl(localSource);
});

final Provider<IResourceRepository> resourceRepositoryProvider = Provider<IResourceRepository>((Ref ref) {
  final ILocalDataSource localSource = ref.watch(localDataSourceProvider);
  return ResourceRepositoryImpl(localSource);
});

// ----------------------------------------------------------------------------
// Local Resource Managers Providers
// ----------------------------------------------------------------------------

final Provider<LocalLibraryManager> localLibraryManagerProvider = Provider<LocalLibraryManager>((Ref ref) {
  final ILibraryRepository libraryRepo = ref.watch(libraryRepositoryProvider);
  final IBookRepository bookRepo = ref.watch(bookRepositoryProvider);
  final StorageService storageService = ref.watch(storageServiceProvider);
  return LocalLibraryManager(
    libraryRepository: libraryRepo,
    bookRepository: bookRepo,
    storageService: storageService,
  );
});

final Provider<FavoriteManager> favoriteManagerProvider = Provider<FavoriteManager>((Ref ref) {
  final ILibraryRepository libraryRepo = ref.watch(libraryRepositoryProvider);
  return FavoriteManager(libraryRepo);
});

final Provider<ReadingProgressManager> readingProgressManagerProvider = Provider<ReadingProgressManager>((Ref ref) {
  final ILibraryRepository libraryRepo = ref.watch(libraryRepositoryProvider);
  return ReadingProgressManager(libraryRepo);
});

final Provider<RecentResourcesManager> recentResourcesManagerProvider = Provider<RecentResourcesManager>((Ref ref) {
  final IResourceRepository resourceRepo = ref.watch(resourceRepositoryProvider);
  return RecentResourcesManager(resourceRepository: resourceRepo);
});

final Provider<DownloadMetadataManager> downloadMetadataManagerProvider = Provider<DownloadMetadataManager>((Ref ref) {
  final IDownloadRepository downloadRepo = ref.watch(downloadRepositoryProvider);
  return DownloadMetadataManager(downloadRepo);
});

// ----------------------------------------------------------------------------
// Services Providers
// ----------------------------------------------------------------------------

final Provider<DatabaseService> databaseServiceProvider = Provider<DatabaseService>((Ref ref) {
  final AppDatabase db = ref.watch(appDatabaseProvider);
  return DatabaseService(db);
});

final Provider<StorageService> storageServiceProvider = Provider<StorageService>((Ref ref) {
  return const StorageService();
});

final Provider<MigrationService> migrationServiceProvider = Provider<MigrationService>((Ref ref) {
  return const MigrationService();
});

final Provider<CacheService> cacheServiceProvider = Provider<CacheService>((Ref ref) {
  return CacheService();
});

final Provider<SyncService> syncServiceProvider = Provider<SyncService>((Ref ref) {
  final AppDatabase db = ref.watch(appDatabaseProvider);
  return SyncService(db);
});

// ----------------------------------------------------------------------------
// Network Layer Providers
// ----------------------------------------------------------------------------

final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((Ref ref) {
  return ApiClient();
});

// ----------------------------------------------------------------------------
// Sync Repository Provider
// ----------------------------------------------------------------------------

final Provider<MetadataSyncManager> metadataSyncManagerProvider =
    Provider<MetadataSyncManager>((Ref ref) {
  final IRemoteDataSource remote = ref.watch(remoteDataSourceProvider);
  final AppDatabase db = ref.watch(appDatabaseProvider);
  return MetadataSyncManager(
    remoteSource: remote,
    database: db,
  );
});

final Provider<ISyncRepository> syncRepositoryProvider =
    Provider<ISyncRepository>((Ref ref) {
  final MetadataSyncManager manager = ref.watch(metadataSyncManagerProvider);
  return SyncRepositoryImpl(manager);
});
