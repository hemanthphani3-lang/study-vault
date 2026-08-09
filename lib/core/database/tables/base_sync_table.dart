import 'package:drift/drift.dart';

/// Standard base mixin providing primary key, timestamps, soft delete,
/// and future P2P / distributed sync fields across all StudyVault tables.
mixin BaseSyncTable on Table {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  TextColumn get id => text()();

  /// Creation timestamp.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// Last modification timestamp.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  /// Timestamp when the record was soft-deleted.
  DateTimeColumn get deletedAt => dateTime().nullable()();

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();

  /// Timestamp when the record was last synchronized with a remote or peer node.
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();

  /// Remote or global canonical identifier (e.g., global URI or CID).
  TextColumn get remoteId => text().nullable()();

  /// Monotonic version counter for conflict resolution.
  IntColumn get version => integer().withDefault(const Constant(1))();

  /// Indicates if the record has local uncommitted changes waiting for sync.
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();

  /// Peer or node ID that originally created or last modified this record.
  TextColumn get nodeId => text().nullable()();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}
