import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Favorites table storing bookmarked and pinned academic artifacts.
@TableIndex(name: 'favorites_resource_id_idx', columns: {#resourceId})
@TableIndex(name: 'favorites_category_idx', columns: {#categoryId})
@TableIndex(name: 'favorites_is_deleted_idx', columns: {#isDeleted})
class Favorites extends Table with BaseSyncTable {
  /// Target resource identifier.
  TextColumn get resourceId => text()();

  /// Resource type discriminator ('book', 'paper', 'dataset', 'note').
  TextColumn get resourceType => text().withDefault(const Constant('book'))();

  /// Resource title.
  TextColumn get title => text().withLength(min: 1, max: 500)();

  /// JSON array of authors.
  TextColumn get authorsJson => text().withDefault(const Constant('[]'))();

  /// Cover artwork path or URL.
  TextColumn get coverPath => text().nullable()();

  /// Category slug.
  TextColumn get categoryId => text().nullable()();

  /// Timestamp when added to user favorites.
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}
