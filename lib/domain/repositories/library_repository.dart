import '../../data/models/favorite_model.dart';
import '../../data/models/reading_progress_model.dart';
import '../../data/models/resource_model.dart';

/// Domain contract for managing saved offline artifacts, reading progress, and favorites.
abstract interface class ILibraryRepository {
  Future<List<ResourceModel>> getSavedResources({String? categoryId, String? query});
  Future<void> removeSavedResource(String id);
  Future<List<FavoriteModel>> getFavorites();
  Future<bool> isFavorite(String resourceId);
  Future<void> toggleFavorite(FavoriteModel favorite);
  Future<ReadingProgressModel?> getReadingProgress(String resourceId);
  Future<void> updateReadingProgress(ReadingProgressModel progress);
  Stream<List<FavoriteModel>> watchFavorites();
  Stream<List<ReadingProgressModel>> watchRecentReading();
  Future<int> getVaultStorageUsageBytes();
}
