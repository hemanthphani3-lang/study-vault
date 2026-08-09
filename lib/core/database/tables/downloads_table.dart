import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Downloads table tracking local asset hydration and chunked P2P transfer progress.
@TableIndex(name: 'downloads_resource_id_idx', columns: {#resourceId})
@TableIndex(name: 'downloads_status_idx', columns: {#downloadStatus})
@TableIndex(name: 'downloads_is_deleted_idx', columns: {#isDeleted})
@TableIndex(name: 'downloads_created_at_idx', columns: {#createdAt})
class Downloads extends Table with BaseSyncTable {
  /// Target resource identifier.
  TextColumn get resourceId => text()();

  /// Resource type discriminator ('book', 'paper', 'dataset', 'note').
  TextColumn get resourceType => text().withDefault(const Constant('book'))();

  /// Human-readable title of the downloading artifact.
  TextColumn get title => text().withLength(min: 1, max: 500)();

  /// Local relative or absolute destination file path on disk.
  TextColumn get filePath => text().nullable()();

  /// Total target file size in bytes.
  IntColumn get fileSizeBytes => integer().withDefault(const Constant(0))();

  /// Bytes currently downloaded and verified.
  IntColumn get bytesDownloaded => integer().withDefault(const Constant(0))();

  /// Download lifecycle status ('pending', 'downloading', 'paused', 'completed', 'failed').
  TextColumn get downloadStatus => text().withDefault(const Constant('pending'))();

  /// Real-time throughput in bytes per second.
  IntColumn get downloadSpeedBps => integer().withDefault(const Constant(0))();

  /// Linear progress fraction (0.0 to 1.0).
  RealColumn get progress => real().withDefault(const Constant(0.0))();

  /// Error message in case of transfer or cryptographic integrity failure.
  TextColumn get errorMessage => text().nullable()();

  /// Content identifier for P2P chunk resolution.
  TextColumn get cid => text().nullable()();

  /// Connected seeder peer count during download.
  IntColumn get peerCount => integer().withDefault(const Constant(0))();

  /// Timestamp when download and SHA-256 verification finished.
  DateTimeColumn get completedAt => dateTime().nullable()();
}
