import '../../../../shared/models/resource_preview.dart';

/// Clean Architecture domain contract for local library.
abstract interface class ILibraryRepository {
  Future<List<ResourcePreview>> getSavedResources();
  Future<void> removeSavedResource(String id);
}
