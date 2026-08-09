import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// ReadingProgress table tracking document pagination, reading time, and bookmark anchors.
@TableIndex(name: 'reading_progress_resource_id_idx', columns: {#resourceId})
@TableIndex(name: 'reading_progress_last_read_idx', columns: {#lastReadAt})
@TableIndex(name: 'reading_progress_is_deleted_idx', columns: {#isDeleted})
class ReadingProgress extends Table with BaseSyncTable {
  /// Target resource identifier.
  TextColumn get resourceId => text()();

  /// Resource type discriminator ('book', 'paper', 'note').
  TextColumn get resourceType => text().withDefault(const Constant('book'))();

  /// Resource title for fast dashboard rendering without joins.
  TextColumn get title => text().withLength(min: 1, max: 500)();

  /// Current page index (1-indexed).
  IntColumn get currentPage => integer().withDefault(const Constant(1))();

  /// Total page count.
  IntColumn get totalPages => integer().withDefault(const Constant(1))();

  /// Reading progress percentage as float (0.0 to 1.0).
  RealColumn get progress => real().withDefault(const Constant(0.0))();

  /// Canonical location marker (EPUB CFI, PDF bookmark, or Markdown offset).
  TextColumn get lastReadPosition => text().nullable()();

  /// Cumulative reading time in seconds.
  IntColumn get timeSpentSeconds => integer().withDefault(const Constant(0))();

  /// Timestamp of the most recent reading session.
  DateTimeColumn get lastReadAt => dateTime().withDefault(currentDateAndTime)();
}
