import '../../data/models/category_model.dart';
import '../../data/models/resource_model.dart';
import '../../domain/repositories/book_repository.dart';
import '../../domain/repositories/library_repository.dart';
import '../services/storage/storage_service.dart';

/// Local Library Manager responsible for local vault storage, category indexing, and storage allocation.
class LocalLibraryManager {
  const LocalLibraryManager({
    required ILibraryRepository libraryRepository,
    required IBookRepository bookRepository,
    required StorageService storageService,
  })  : _libraryRepo = libraryRepository,
        _storageService = storageService;

  final ILibraryRepository _libraryRepo;
  final StorageService _storageService;

  /// Retrieves all offline vault resources with optional category or query filter.
  Future<List<ResourceModel>> getVaultResources({String? categoryId, String? query}) {
    return _libraryRepo.getSavedResources(categoryId: categoryId, query: query);
  }

  /// Removes an academic resource from the local vault.
  Future<void> removeFromVault(String id) {
    return _libraryRepo.removeSavedResource(id);
  }

  /// Computes the fraction of allocated vault capacity currently occupied.
  Future<double> getVaultCapacityFraction() async {
    final int usedBytes = await _libraryRepo.getVaultStorageUsageBytes();
    return _storageService.calculateUsageFraction(usedBytes);
  }

  /// Returns human-readable storage string for vault overview.
  Future<String> getFormattedUsage() async {
    final int usedBytes = await _libraryRepo.getVaultStorageUsageBytes();
    return _storageService.formatBytes(usedBytes);
  }

  /// Returns total count of categories.
  Future<List<CategoryModel>> getCategories() async {
    return const <CategoryModel>[
      CategoryModel(id: 'cat_cs', slug: 'cs', name: 'Computer Science', itemCount: 94200),
      CategoryModel(id: 'cat_math', slug: 'math', name: 'Mathematics', itemCount: 48150),
      CategoryModel(id: 'cat_phys', slug: 'physics', name: 'Physics', itemCount: 36800),
      CategoryModel(id: 'cat_bio', slug: 'bio', name: 'Biology & Omics', itemCount: 52400),
    ];
  }
}
