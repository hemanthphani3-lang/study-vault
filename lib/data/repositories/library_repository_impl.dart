import '../../domain/repositories/library_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../models/favorite_model.dart';
import '../models/reading_progress_model.dart';
import '../models/resource_model.dart';

/// Concrete repository implementation for Library using [ILocalDataSource].
class LibraryRepositoryImpl implements ILibraryRepository {
  const LibraryRepositoryImpl(this._localDataSource);

  final ILocalDataSource _localDataSource;

  @override
  Future<List<ResourceModel>> getSavedResources({String? categoryId, String? query}) {
    return _localDataSource.getAllResources(query: query);
  }

  @override
  Future<void> removeSavedResource(String id) {
    return _localDataSource.softDeleteBook(id);
  }

  @override
  Future<List<FavoriteModel>> getFavorites() {
    return _localDataSource.getFavorites();
  }

  @override
  Future<bool> isFavorite(String resourceId) {
    return _localDataSource.isFavorite(resourceId);
  }

  @override
  Future<void> toggleFavorite(FavoriteModel favorite) async {
    final bool favorited = await _localDataSource.isFavorite(favorite.resourceId);
    if (favorited) {
      await _localDataSource.removeFavorite(favorite.resourceId);
    } else {
      await _localDataSource.addFavorite(favorite);
    }
  }

  @override
  Future<ReadingProgressModel?> getReadingProgress(String resourceId) {
    return _localDataSource.getReadingProgress(resourceId);
  }

  @override
  Future<void> updateReadingProgress(ReadingProgressModel progress) {
    return _localDataSource.saveReadingProgress(progress);
  }

  @override
  Stream<List<FavoriteModel>> watchFavorites() {
    return _localDataSource.watchFavorites();
  }

  @override
  Stream<List<ReadingProgressModel>> watchRecentReading() {
    return _localDataSource.watchRecentReading();
  }

  @override
  Future<int> getVaultStorageUsageBytes() {
    return _localDataSource.getEstimatedDatabaseSizeBytes();
  }
}
