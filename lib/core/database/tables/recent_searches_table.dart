import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// RecentSearches table providing instant search bar autocomplete and suggestion chips.
@TableIndex(name: 'recent_searches_term_idx', columns: {#term})
@TableIndex(name: 'recent_searches_last_queried_idx', columns: {#lastQueriedAt})
@TableIndex(name: 'recent_searches_is_deleted_idx', columns: {#isDeleted})
class RecentSearches extends Table with BaseSyncTable {
  /// Unique search term.
  TextColumn get term => text().withLength(min: 1, max: 300)();

  /// Total count of times this term was queried.
  IntColumn get hitCount => integer().withDefault(const Constant(1))();

  /// Most recent query timestamp.
  DateTimeColumn get lastQueriedAt => dateTime().withDefault(currentDateAndTime)();
}
