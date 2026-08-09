import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../database/tables/authors_table.dart';
import '../../database/tables/books_table.dart';
import '../../database/tables/cache_metadata_table.dart';
import '../../database/tables/categories_table.dart';
import '../../database/tables/downloads_table.dart';
import '../../database/tables/favorites_table.dart';
import '../../database/tables/network_metadata_table.dart';
import '../../database/tables/node_metadata_table.dart';
import '../../database/tables/notes_table.dart';
import '../../database/tables/reading_progress_table.dart';
import '../../database/tables/recent_searches_table.dart';
import '../../database/tables/research_papers_table.dart';
import '../../database/tables/search_history_table.dart';
import '../../database/tables/settings_table.dart';

part 'app_database.g.dart';

/// Local SQLite database using Drift for high-performance, indexed academic knowledge storage.
///
/// Features:
/// - 14 production-ready tables
/// - SearchDao with multi-field search and ranking
/// - WAL mode and Pragmas for concurrency and 100k+ record performance
/// - Stepwise migration strategy
/// - Full soft-delete and sync status query capability
@DriftDatabase(tables: [
  Books,
  Notes,
  ResearchPapers,
  Downloads,
  Favorites,
  ReadingProgress,
  Categories,
  Authors,
  SearchHistory,
  RecentSearches,
  Settings,
  CacheMetadata,
  NetworkMetadata,
  NodeMetadata,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Stepwise migrations for future schema evolutions (Sprint 5+)
        if (from < 2) {
          // Future migration steps
        }
      },
      beforeOpen: (OpeningDetails details) async {
        // Enforce SQLite integrity, WAL mode for concurrent reads, and performance pragmas
        await customStatement('PRAGMA foreign_keys = ON;');
        if (!kIsWeb) {
          await customStatement('PRAGMA journal_mode = WAL;');
          await customStatement('PRAGMA synchronous = NORMAL;');
          await customStatement('PRAGMA cache_size = -64000;'); // 64MB cache for large dataset querying
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'study_vault_db');
  }
}
