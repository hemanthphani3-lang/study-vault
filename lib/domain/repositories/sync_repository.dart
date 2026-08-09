import '../../core/sync/sync_status.dart';

/// Domain contract for triggering metadata sync and querying sync state.
abstract interface class ISyncRepository {
  /// Executes an incremental metadata synchronization cycle.
  /// Returns the resulting [SyncState] after the cycle completes.
  Future<SyncState> syncNow();

  /// Resets the sync cursor, triggering a full re-sync on next call.
  void resetCursor();

  /// Returns the timestamp of the last successful sync, or null if never synced.
  DateTime? get lastSyncedAt;
}
