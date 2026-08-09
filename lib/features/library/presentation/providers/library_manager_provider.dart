import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/data_providers.dart';
import '../../../../core/managers/favorite_manager.dart';
import '../../../../core/managers/local_library_manager.dart';
import '../../../../data/models/favorite_model.dart';
import '../../../../data/models/resource_model.dart';
import '../../../../shared/enums/resource_type.dart';
import '../../../../shared/enums/verification_tier.dart';
import '../../../../shared/models/resource_preview.dart';

/// State of the local offline academic vault and storage telemetry.
class LibraryState {
  const LibraryState({
    required this.savedItems,
    required this.selectedTab,
    this.capacityFraction = 0.14,
    this.formattedUsage = '1.42 GB / 10.0 GB',
    this.isLoading = false,
  });

  final List<ResourcePreview> savedItems;
  final ResourceType? selectedTab;
  final double capacityFraction;
  final String formattedUsage;
  final bool isLoading;

  static const LibraryState initial = LibraryState(
    savedItems: <ResourcePreview>[
      ResourcePreview(
        id: 'sv-res-001',
        title: 'Decentralized Academic Storage: Zero-Knowledge Verification Networks',
        authors: <String>['Dr. Elena Vance', 'Prof. Marcus Chen'],
        year: 2026,
        type: ResourceType.paper,
        verificationTier: VerificationTier.verified,
        sizeBytes: 14680064,
        peerSeeders: 34,
        cid: 'bafybeicg24pknox2zox7e22f254e2q3w5i6k7a8b9c0d1e2f3g4h5i6j7k',
        institution: 'Global Academic Protocol Lab',
        doi: '10.1038/s41586-026-04289-w',
        isDownloaded: true,
      ),
    ],
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

      final List<ResourcePreview> previews = models.isNotEmpty
          ? models.map((ResourceModel m) => ResourcePreview(
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
              )).toList()
          : LibraryState.initial.savedItems;

      state = state.copyWith(
        savedItems: previews,
        capacityFraction: fraction > 0 ? fraction : 0.14,
        formattedUsage: usage.isNotEmpty ? usage : '1.42 GB / 10.0 GB',
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
