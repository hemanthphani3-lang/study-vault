import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// SearchHistory table logging executed queries, telemetry, and filter configurations.
@TableIndex(name: 'search_history_query_idx', columns: {#query})
@TableIndex(name: 'search_history_searched_at_idx', columns: {#searchedAt})
@TableIndex(name: 'search_history_is_deleted_idx', columns: {#isDeleted})
class SearchHistory extends Table with BaseSyncTable {
  /// Query string entered by the user.
  TextColumn get query => text().withLength(min: 1, max: 500)();

  /// Total matches returned for this query execution.
  IntColumn get resultCount => integer().withDefault(const Constant(0))();

  /// JSON-encoded filter parameters applied to this search.
  TextColumn get filtersJson => text().withDefault(const Constant('{}'))();

  /// Timestamp when search was triggered.
  DateTimeColumn get searchedAt => dateTime().withDefault(currentDateAndTime)();
}
