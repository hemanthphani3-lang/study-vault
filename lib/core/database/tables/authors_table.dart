import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Authors table storing researcher profiles, ORCID IDs, affiliations, and bibliometrics.
@TableIndex(name: 'authors_name_idx', columns: {#name})
@TableIndex(name: 'authors_orcid_idx', columns: {#orcid})
@TableIndex(name: 'authors_is_deleted_idx', columns: {#isDeleted})
class Authors extends Table with BaseSyncTable {
  /// Full academic name.
  TextColumn get name => text().withLength(min: 1, max: 300)();

  /// Open Researcher and Contributor ID (e.g. '0000-0002-1825-0097').
  TextColumn get orcid => text().nullable()();

  /// Primary academic institution, university, or lab affiliation.
  TextColumn get institution => text().nullable()();

  /// Researcher biography and field of study.
  TextColumn get bio => text().nullable()();

  /// Avatar image URL or local cached path.
  TextColumn get avatarUrl => text().nullable()();

  /// Total publications indexed in network.
  IntColumn get publicationCount => integer().withDefault(const Constant(0))();

  /// Author citation h-index metric.
  IntColumn get hIndex => integer().withDefault(const Constant(0))();
}
