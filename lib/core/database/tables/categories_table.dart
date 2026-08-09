import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Categories table organizing academic disciplines, taxonomy, and collections.
@TableIndex(name: 'categories_slug_idx', columns: {#slug})
@TableIndex(name: 'categories_display_order_idx', columns: {#displayOrder})
@TableIndex(name: 'categories_is_deleted_idx', columns: {#isDeleted})
class Categories extends Table with BaseSyncTable {
  /// Category slug or unique code (e.g. 'cs', 'math', 'physics', 'bio').
  TextColumn get slug => text().withLength(min: 1, max: 100)();

  /// Human-readable category title.
  TextColumn get name => text().withLength(min: 1, max: 200)();

  /// Discipline description.
  TextColumn get description => text().nullable()();

  /// Canonical icon identifier mapping to AppIcons.
  TextColumn get iconName => text().withDefault(const Constant('category'))();

  /// Accent color hex string for category cards and glows.
  TextColumn get accentColorHex => text().withDefault(const Constant('#8B7DFF'))();

  /// Parent category ID for nested taxonomic hierarchies.
  TextColumn get parentCategoryId => text().nullable()();

  /// Number of indexed resources under this category.
  IntColumn get itemCount => integer().withDefault(const Constant(0))();

  /// Sort priority for UI display.
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();
}
