import 'package:drift/drift.dart';
import 'app_database.dart';

/// Service managing SQLite lifecycle, PRAGMA optimizations, vacuuming, and health checks.
class DatabaseService {
  const DatabaseService(this._db);

  final AppDatabase _db;

  /// Runs SQLite PRAGMA integrity_check.
  Future<bool> checkIntegrity() async {
    try {
      final List<QueryRow> result = await _db.customSelect('PRAGMA integrity_check;').get();
      if (result.isNotEmpty) {
        final dynamic status = result.first.data['integrity_check'];
        return status == 'ok';
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Compacts and reorganizes SQLite storage to reclaim disk space.
  Future<void> vacuum() async {
    await _db.customStatement('VACUUM;');
  }

  /// Executes database checkpointing in WAL mode.
  Future<void> checkpoint() async {
    await _db.customStatement('PRAGMA wal_checkpoint(TRUNCATE);');
  }

  /// Retrieves estimated database size on disk in bytes.
  Future<int> getDatabaseSizeBytes() async {
    try {
      final List<QueryRow> pageCountRes = await _db.customSelect('PRAGMA page_count;').get();
      final List<QueryRow> pageSizeRes = await _db.customSelect('PRAGMA page_size;').get();
      if (pageCountRes.isNotEmpty && pageSizeRes.isNotEmpty) {
        final int pageCount = pageCountRes.first.read<int>('page_count');
        final int pageSize = pageSizeRes.first.read<int>('page_size');
        return pageCount * pageSize;
      }
    } catch (_) {}
    return 0;
  }

  /// Closes database connection safely on app shutdown.
  Future<void> close() async {
    await _db.close();
  }
}
