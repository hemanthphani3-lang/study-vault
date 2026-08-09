import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/data_providers.dart';
import '../../../../core/managers/favorite_manager.dart';
import '../../../../core/managers/local_library_manager.dart';
import '../../../../data/models/favorite_model.dart';
import '../../../../data/models/resource_model.dart';
import '../../../../shared/enums/resource_type.dart';
import '../../../../shared/models/resource_preview.dart';

/// State of the local offline academic vault and storage telemetry.
class LibraryState {
  const LibraryState({
    required this.savedItems,
    required this.selectedTab,
    this.capacityFraction = 0.0,
    this.formattedUsage = '0.00 GB / 10.0 GB',
    this.isLoading = false,
  });

  final List<ResourcePreview> savedItems;
  final ResourceType? selectedTab;
  final double capacityFraction;
  final String formattedUsage;
  final bool isLoading;

  static const LibraryState initial = LibraryState(
    savedItems: <ResourcePreview>[],
    selectedTab: null,
  );

  LibraryState copyWith({
    List<ResourcePreview>? savedItems,
    ResourceType? selectedTab,
    double? capacityFraction,
    String? formattedUsage,
    bool? isLoading,
    bool clearTab = false,
  }) {
    return LibraryState(
      savedItems: savedItems ?? this.savedItems,
      selectedTab: clearTab ? null : (selectedTab ?? this.selectedTab),
      capacityFraction: capacityFraction ?? this.capacityFraction,
      formattedUsage: formattedUsage ?? this.formattedUsage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// StateNotifier coordinating the local vault library manager and favorites.
class LibraryNotifier extends StateNotifier<LibraryState> {
  LibraryNotifier(this._libraryManager, this._favoriteManager) : super(LibraryState.initial) {
    loadVault();
  }

  final LocalLibraryManager _libraryManager;
  final FavoriteManager _favoriteManager;

  /// Refreshes local library items and capacity usage.
  Future<void> loadVault() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<ResourceModel> models = await _libraryManager.getVaultResources();
      final double fraction = await _libraryManager.getVaultCapacityFraction();
      final String usage = await _libraryManager.getFormattedUsage();

      final List<ResourcePreview> previews = models.map((ResourceModel m) => ResourcePreview(
            id: m.id,
            title: m.title,
            authors: m.authors,
            year: m.publicationYear ?? 2026,
            type: m.type,
            verificationTier: m.verificationTier,
            sizeBytes: m.sizeBytes,
            peerSeeders: m.peerSeeders,
            cid: m.cid ?? '',
            isDownloaded: m.isDownloaded,
          )).toList();

      state = state.copyWith(
        savedItems: previews,
        capacityFraction: fraction,
        formattedUsage: usage.isNotEmpty ? usage : '0.00 GB / 10.0 GB',
        isLoading: false,
      );

    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Selects category tab filter.
  void selectTab(ResourceType? type) {
    state = state.copyWith(selectedTab: type, clearTab: type == null);
  }

  /// Removes an item from the vault.
  Future<void> removeItem(String id) async {
    await _libraryManager.removeFromVault(id);
    await loadVault();
  }

  /// Toggles favorite status for a resource.
  Future<void> toggleFavorite(ResourcePreview preview) async {
    final FavoriteModel model = FavoriteModel(
      id: 'fav_${preview.id}',
      resourceId: preview.id,
      title: preview.title,
      authors: preview.authors,
      addedAt: DateTime.now(),
    );
    await _favoriteManager.toggleFavorite(model);
  }
}

/// Provider for Library screen state management.
final StateNotifierProvider<LibraryNotifier, LibraryState> libraryProvider =
    StateNotifierProvider<LibraryNotifier, LibraryState>((Ref ref) {
  final LocalLibraryManager libraryManager = ref.watch(localLibraryManagerProvider);
  final FavoriteManager favoriteManager = ref.watch(favoriteManagerProvider);
  return LibraryNotifier(libraryManager, favoriteManager);
});
