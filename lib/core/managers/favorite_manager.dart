import '../../data/models/favorite_model.dart';
import '../../domain/repositories/library_repository.dart';

/// Local manager for bookmarking, pinning, and querying favorite academic artifacts.
class FavoriteManager {
  const FavoriteManager(this._libraryRepo);

  final ILibraryRepository _libraryRepo;

  /// Retrieves list of all bookmarked favorites.
  Future<List<FavoriteModel>> getFavorites() {
    return _libraryRepo.getFavorites();
  }

  /// Checks if a resource is currently favorited.
  Future<bool> isFavorite(String resourceId) {
    return _libraryRepo.isFavorite(resourceId);
  }

  /// Toggles bookmark state for a given resource.
  Future<void> toggleFavorite(FavoriteModel favorite) {
    return _libraryRepo.toggleFavorite(favorite);
  }

  /// Real-time stream of all favorite changes.
  Stream<List<FavoriteModel>> watchFavorites() {
    return _libraryRepo.watchFavorites();
  }
}
