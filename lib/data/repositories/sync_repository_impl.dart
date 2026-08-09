import '../../core/sync/metadata_sync_manager.dart';
import '../../core/sync/sync_status.dart';
import '../../domain/repositories/sync_repository.dart';

/// Concrete implementation of [ISyncRepository] backed by [MetadataSyncManager].
class SyncRepositoryImpl implements ISyncRepository {
  const SyncRepositoryImpl(this._manager);

  final MetadataSyncManager _manager;

  @override
  Future<SyncState> syncNow() => _manager.execute();

  @override
  void resetCursor() => _manager.resetSyncCursor();

  @override
  DateTime? get lastSyncedAt => _manager.lastSyncTimestamp;
}
