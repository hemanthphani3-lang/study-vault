import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/data_providers.dart';
import '../../../../core/sync/sync_status.dart';
import '../../../../domain/repositories/sync_repository.dart';

// ─── Sync State Notifier ──────────────────────────────────────────────────────

/// Riverpod [Notifier] that owns the full sync lifecycle.
///
/// States: idle → synchronizing → success | upToDate | offline | error
class SyncNotifier extends Notifier<SyncState> {
  @override
  SyncState build() => const SyncState(status: SyncStatus.idle);

  ISyncRepository get _repo => ref.read(syncRepositoryProvider);

  /// Trigger a full incremental sync cycle.
  /// The state transitions: synchronizing → [result].
  Future<void> sync() async {
    if (state.isLoading) return; // Prevent concurrent cycles

    state = state.copyWith(status: SyncStatus.synchronizing);

    final SyncState result = await _repo.syncNow();
    state = result;
  }

  /// Force a full re-sync by resetting the cursor and re-running.
  Future<void> forceFullSync() async {
    _repo.resetCursor();
    await sync();
  }

  /// Marks the state as offline without attempting a network call.
  void markOffline() {
    state = const SyncState(
      status: SyncStatus.offline,
      errorMessage: 'No internet connection. Reading from local cache.',
    );
  }
}

// ─── Provider Declaration ─────────────────────────────────────────────────────

final NotifierProvider<SyncNotifier, SyncState> syncProvider =
    NotifierProvider<SyncNotifier, SyncState>(SyncNotifier.new);

// ─── Derived Selectors ────────────────────────────────────────────────────────

/// Whether a sync is currently in progress.
final Provider<bool> isSyncingProvider = Provider<bool>((Ref ref) {
  return ref.watch(syncProvider.select((SyncState s) => s.isLoading));
});

/// Whether the app is in offline mode.
final Provider<bool> isOfflineProvider = Provider<bool>((Ref ref) {
  return ref.watch(syncProvider.select((SyncState s) => s.isOffline));
});

/// The last successful sync timestamp, or null if never synced.
final Provider<DateTime?> lastSyncAtProvider = Provider<DateTime?>((Ref ref) {
  return ref.watch(syncProvider.select((SyncState s) => s.lastSyncAt));
});

/// The number of records synced in the last completed cycle.
final Provider<int> syncedCountProvider = Provider<int>((Ref ref) {
  return ref.watch(syncProvider.select((SyncState s) => s.syncedCount));
});
