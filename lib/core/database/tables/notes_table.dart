import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Notes table for personal research notes, academic annotations, and highlights.
@TableIndex(name: 'notes_resource_id_idx', columns: {#resourceId})
@TableIndex(name: 'notes_is_pinned_idx', columns: {#isPinned})
@TableIndex(name: 'notes_is_deleted_idx', columns: {#isDeleted})
@TableIndex(name: 'notes_updated_at_idx', columns: {#updatedAt})
class Notes extends Table with BaseSyncTable {
  /// Note title.
  TextColumn get title => text().withLength(min: 1, max: 250)();

  /// Markdown-formatted body content.
  TextColumn get content => text()();

  /// Optional parent academic resource identifier (Book, Paper, etc.).
  TextColumn get resourceId => text().nullable()();

  /// Type of the associated resource ('book', 'paper', 'dataset', 'general').
  TextColumn get resourceType => text().withDefault(const Constant('general'))();

  /// Accent color hex for UI badges and card tints (e.g. '#63F2E8').
  TextColumn get colorHex => text().nullable()();

  /// JSON array of string tags (e.g. `["zk-proofs", "cryptography"]`).
  TextColumn get tagsJson => text().withDefault(const Constant('[]'))();

  /// Whether the note is pinned to top of the notes view.
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();

  /// Reading position anchor or page number where annotation was created.
  TextColumn get readingPosition => text().nullable()();
}
