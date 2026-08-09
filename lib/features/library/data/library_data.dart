import '../../../../shared/models/resource_preview.dart';
import '../domain/library_domain.dart';
import '../presentation/providers/library_provider.dart';

/// Concrete Library repository implementation.
class LibraryRepositoryImpl implements ILibraryRepository {
  const LibraryRepositoryImpl();

  @override
  Future<List<ResourcePreview>> getSavedResources() async {
    return LibraryState.initial.savedItems;
  }

  @override
  Future<void> removeSavedResource(String id) async {
    // Sprint 1 scaffold
  }
}
