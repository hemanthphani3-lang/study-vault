/// Enumeration of all possible sync lifecycle states.
///
/// These states drive the UI through Riverpod's state machine pattern.
enum SyncStatus {
  /// No sync has ever been attempted. App just installed or fresh start.
  idle,

  /// A sync operation is currently in progress.
  synchronizing,

  /// The most recent sync completed successfully.
  success,

  /// The most recent sync completed but no new data was received.
  upToDate,

  /// The app is operating in offline mode — no connectivity detected.
  offline,

  /// The sync operation failed due to a recoverable error.
  error,
}

/// Immutable snapshot of the current metadata sync state.
class SyncState {
  const SyncState({
    this.status = SyncStatus.idle,
    this.lastSyncAt,
    this.syncedCount = 0,
    this.errorMessage,
  });

  final SyncStatus status;

  /// UTC timestamp of the last successful sync completion.
  final DateTime? lastSyncAt;

  /// Number of records upserted in the most recent sync cycle.
  final int syncedCount;

  /// Human-readable error description when [status] is [SyncStatus.error].
  final String? errorMessage;

  SyncState copyWith({
    SyncStatus? status,
    DateTime? lastSyncAt,
    int? syncedCount,
    String? errorMessage,
  }) {
    return SyncState(
      status: status ?? this.status,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      syncedCount: syncedCount ?? this.syncedCount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoading => status == SyncStatus.synchronizing;
  bool get isOffline => status == SyncStatus.offline;
  bool get hasError => status == SyncStatus.error;
  bool get isSuccess => status == SyncStatus.success || status == SyncStatus.upToDate;
}
