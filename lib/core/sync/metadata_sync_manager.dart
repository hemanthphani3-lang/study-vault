import 'dart:convert';

import 'package:drift/drift.dart';

import '../../data/datasources/remote/remote_data_source.dart';
import '../../data/models/resource_model.dart';
import '../network/api_exceptions.dart';
import '../services/database/app_database.dart';
import 'sync_status.dart';

/// Incremental metadata synchronization engine for StudyVault.
///
/// Architecture rules enforced:
/// - Flutter ↔ FastAPI only. No direct contact with Resource Discovery Service.
/// - Offline-first: always read local Drift DB for UI. Sync in background.
/// - Incremental: fetches only records updated since [_lastSyncTimestamp].
/// - Conflict strategy: remote wins (Backend is authoritative source of truth).
///
/// Lifecycle: [execute] → [SyncState] stream updated via callback.
class MetadataSyncManager {
  MetadataSyncManager({
    required IRemoteDataSource remoteSource,
    required AppDatabase database,
  })  : _remote = remoteSource,
        _db = database;

  final IRemoteDataSource _remote;
  final AppDatabase _db;

  DateTime? _lastSyncTimestamp;

  // ─── Public API ─────────────────────────────────────────────────────────────

  /// Run a full incremental sync cycle. Returns the resulting [SyncState].
  ///
  /// Strategy:
  /// 1. Attempt to fetch all resources updated since [_lastSyncTimestamp].
  /// 2. Upsert each into the local Drift database.
  /// 3. Update [_lastSyncTimestamp] on success.
  /// 4. Return a [SyncState] describing the outcome.
  Future<SyncState> execute() async {
    try {
      final since = _lastSyncTimestamp ?? DateTime.fromMillisecondsSinceEpoch(0);
      final remoteResources = await _remote.fetchUpdatedSince(since);

      if (remoteResources.isEmpty) {
        return SyncState(
          status: SyncStatus.upToDate,
          lastSyncAt: _lastSyncTimestamp,
          syncedCount: 0,
        );
      }

      int upsertCount = 0;
      for (final ResourceModel resource in remoteResources) {
        await _upsertResource(resource);
        upsertCount++;
      }

      _lastSyncTimestamp = DateTime.now().toUtc();

      return SyncState(
        status: SyncStatus.success,
        lastSyncAt: _lastSyncTimestamp,
        syncedCount: upsertCount,
      );
    } on NetworkException {
      return const SyncState(
        status: SyncStatus.offline,
        errorMessage: 'No internet connection. Reading from local cache.',
      );
    } on TimeoutException {
      return const SyncState(
        status: SyncStatus.error,
        errorMessage: 'Sync timed out. The backend may be unreachable.',
      );
    } on ApiException catch (e) {
      return SyncState(
        status: SyncStatus.error,
        errorMessage: e.message,
      );
    } catch (e) {
      return SyncState(
        status: SyncStatus.error,
        errorMessage: 'Unexpected sync error: $e',
      );
    }
  }

  /// Resets the sync cursor, forcing a full re-sync on the next [execute] call.
  void resetSyncCursor() => _lastSyncTimestamp = null;

  DateTime? get lastSyncTimestamp => _lastSyncTimestamp;

  // ─── Private Upsert Logic ───────────────────────────────────────────────────

  Future<void> _upsertResource(ResourceModel resource) async {
    // Determine entity type and upsert into the correct table.
    // ResourceModel.type guides routing — Books → books table,
    // everything else → research_papers table (future: generic resources table).
    final type = resource.type.name.toLowerCase();

    if (type == 'book' || type == 'textbook') {
      await _upsertBook(resource);
    } else {
      await _upsertPaper(resource);
    }
  }

  Future<void> _upsertBook(ResourceModel r) async {
    final companion = BooksCompanion(
      id: Value(r.id),
      title: Value(r.title),
      subtitle: Value(r.subtitle),
      authorsJson: Value(jsonEncode(r.authors)),
      publicationYear: Value(r.publicationYear),
      doi: Value(r.doi),
      format: Value(r.format),
      sizeBytes: Value(r.sizeBytes),
      coverPath: Value(r.coverPath),
      cid: Value(r.cid),
      contentHash: Value(r.contentHash),
      verificationTier: Value(r.verificationTier.name),
      categoryId: Value(r.categoryId),
      metadataJson: Value(jsonEncode(r.metadata)),
      peerSeeders: Value(r.peerSeeders),
      syncStatus: const Value('synced'),
      lastSyncedAt: Value(DateTime.now().toUtc()),
      isDirty: const Value(false),
      updatedAt: Value(r.updatedAt ?? DateTime.now().toUtc()),
    );

    await _db.into(_db.books).insertOnConflictUpdate(companion);
  }

  Future<void> _upsertPaper(ResourceModel r) async {
    final metadataMap = r.metadata;
    final companion = ResearchPapersCompanion(
      id: Value(r.id),
      title: Value(r.title),
      abstractText: Value(metadataMap['abstract'] as String? ?? ''),
      authorsJson: Value(jsonEncode(r.authors)),
      publicationYear: Value(r.publicationYear),
      doi: Value(r.doi),
      arxivId: Value(metadataMap['arxivId'] as String?),
      format: Value(r.format),
      sizeBytes: Value(r.sizeBytes),
      cid: Value(r.cid),
      contentHash: Value(r.contentHash),
      verificationTier: Value(r.verificationTier.name),
      categoryId: Value(r.categoryId),
      citationsCount: Value((metadataMap['citationsCount'] as int?) ?? 0),
      isPeerReviewed: Value((metadataMap['isPeerReviewed'] as bool?) ?? false),
      peerSeeders: Value(r.peerSeeders),
      syncStatus: const Value('synced'),
      lastSyncedAt: Value(DateTime.now().toUtc()),
      isDirty: const Value(false),
      updatedAt: Value(r.updatedAt ?? DateTime.now().toUtc()),
    );

    await _db.into(_db.researchPapers).insertOnConflictUpdate(companion);
  }
}
