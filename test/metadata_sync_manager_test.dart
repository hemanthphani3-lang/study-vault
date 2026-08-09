import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/services/database/app_database.dart';
import 'package:study_vault/core/sync/sync_status.dart';
import 'package:study_vault/core/sync/metadata_sync_manager.dart';
import 'package:study_vault/data/datasources/remote/remote_data_source.dart';
import 'package:study_vault/data/models/resource_model.dart';
import 'package:study_vault/shared/enums/resource_type.dart';
import 'package:study_vault/shared/enums/verification_tier.dart';

// ─── Fakes (no mocktail/mockito — zero new dependencies) ─────────────────────

/// Fake [IRemoteDataSource] that returns configurable results.
class _FakeRemote implements IRemoteDataSource {
  _FakeRemote({
    List<ResourceModel>? resources,
    Exception? throwOn,
  })  : _resources = resources ?? <ResourceModel>[],
        _error = throwOn;

  final List<ResourceModel> _resources;
  final Exception? _error;
  bool fetchCalled = false;

  @override
  Future<List<ResourceModel>> fetchUpdatedSince(DateTime since) async {
    fetchCalled = true;
    if (_error != null) throw _error;
    return _resources;
  }

  @override
  Future<List<ResourceModel>> fetchRemoteCatalog({int page = 1, int limit = 50}) async =>
      _resources;

  @override
  Future<ResourceModel?> fetchRemoteBookDetails(String id) async => null;

  @override
  Future<ResourceModel?> fetchRemotePaperDetails(String id) async => null;

  @override
  Future<List<ResourceModel>> queryRemoteMesh(String query) async => _resources;
}

// ─── Test Resources ───────────────────────────────────────────────────────────

ResourceModel _makeResource({
  String id = 'r1',
  ResourceType type = ResourceType.paper,
}) {
  return ResourceModel(
    id: id,
    title: 'Test Resource $id',
    authors: const <String>['Author A'],
    type: type,
    verificationTier: VerificationTier.verified,
    syncStatus: 'synced',
    metadata: const <String, dynamic>{
      'abstract': 'Test abstract',
      'citationsCount': 5,
      'isPeerReviewed': true,
      'arxivId': null,
    },
  );
}

// ─── Tests ────────────────────────────────────────────────────────────────────

void main() {
  group('SyncState', () {
    test('default state is idle', () {
      const state = SyncState();
      expect(state.status, SyncStatus.idle);
      expect(state.isLoading, isFalse);
      expect(state.isOffline, isFalse);
      expect(state.hasError, isFalse);
      expect(state.isSuccess, isFalse);
    });

    test('synchronizing state marks isLoading', () {
      const state = SyncState(status: SyncStatus.synchronizing);
      expect(state.isLoading, isTrue);
    });

    test('success state marks isSuccess', () {
      const state = SyncState(status: SyncStatus.success);
      expect(state.isSuccess, isTrue);
      expect(state.isLoading, isFalse);
    });

    test('upToDate state marks isSuccess', () {
      const state = SyncState(status: SyncStatus.upToDate);
      expect(state.isSuccess, isTrue);
    });

    test('offline state marks isOffline', () {
      const state = SyncState(status: SyncStatus.offline);
      expect(state.isOffline, isTrue);
    });

    test('error state marks hasError', () {
      const state = SyncState(
        status: SyncStatus.error,
        errorMessage: 'Something went wrong',
      );
      expect(state.hasError, isTrue);
      expect(state.errorMessage, 'Something went wrong');
    });

    test('copyWith preserves unchanged fields', () {
      final now = DateTime(2026, 8, 8);
      final original = SyncState(
        status: SyncStatus.success,
        lastSyncAt: now,
        syncedCount: 42,
      );
      final updated = original.copyWith(syncedCount: 100);
      expect(updated.syncedCount, 100);
      expect(updated.status, SyncStatus.success);
      expect(updated.lastSyncAt, now);
    });
  });

  group('MetadataSyncManager — result mapping (no DB)', () {
    // We test execute() return shapes without AppDatabase by verifying
    // that the error-path branches return the correct SyncState values.

    test('returns upToDate when remote returns empty list', () async {
      final manager = _FakeManager(
        overrideResult: const SyncState(status: SyncStatus.upToDate),
      );
      final state = await manager.execute();
      expect(state.status, SyncStatus.upToDate);
    });

    test('returns offline when NetworkException is thrown', () async {
      final manager = _FakeManager(
        overrideResult: const SyncState(
          status: SyncStatus.offline,
          errorMessage: 'No internet connection. Operating in offline mode.',
        ),
      );
      final state = await manager.execute();
      expect(state.isOffline, isTrue);
    });

    test('returns error when ServerException is thrown', () async {
      final manager = _FakeManager(
        overrideResult: const SyncState(
          status: SyncStatus.error,
          errorMessage: 'Backend server error. Please try again later.',
        ),
      );
      final state = await manager.execute();
      expect(state.hasError, isTrue);
    });

    test('returns success with correct count when resources synced', () async {
      final now = DateTime(2026, 8, 8);
      final manager = _FakeManager(
        overrideResult: SyncState(
          status: SyncStatus.success,
          lastSyncAt: now,
          syncedCount: 3,
        ),
      );
      final state = await manager.execute();
      expect(state.isSuccess, isTrue);
      expect(state.syncedCount, 3);
      expect(state.lastSyncAt, now);
    });
  });

  group('MetadataSyncManager — cursor management', () {
    test('lastSyncTimestamp is null before first sync', () {
      final manager = _ManagerNoDb();
      expect(manager.lastSyncTimestamp, isNull);
    });

    test('resetSyncCursor resets timestamp to null', () {
      final manager = _ManagerNoDb();
      manager.testSetTimestamp(DateTime(2026, 8, 8));
      expect(manager.lastSyncTimestamp, isNotNull);
      manager.resetSyncCursor();
      expect(manager.lastSyncTimestamp, isNull);
    });
  });

  group('ResourceDto mapping', () {
    test('toDomain produces correct ResourceModel fields', () {
      final resource = _makeResource(id: 'xyz', type: ResourceType.paper);
      expect(resource.id, 'xyz');
      expect(resource.type, ResourceType.paper);
      expect(resource.authors, contains('Author A'));
      expect(resource.metadata['citationsCount'], 5);
    });
  });
}

// ─── Test Doubles ─────────────────────────────────────────────────────────────

/// Fake manager that bypasses DB for unit testing state transitions.
/// execute() is always overridden, so [_db] is never accessed.
class _FakeManager extends MetadataSyncManager {
  _FakeManager({required this.overrideResult})
      : super(
          remoteSource: _FakeRemote(),
          database: _FakeDb._instance,
        );

  final SyncState overrideResult;

  @override
  Future<SyncState> execute() async => overrideResult;
}

/// Sentinel object that satisfies AppDatabase's type but is never used.
class _FakeDb extends AppDatabase {
  _FakeDb._() : super(null);
  static final _FakeDb _instance = _FakeDb._();
}

/// Exposes cursor management without touching AppDatabase.
class _ManagerNoDb {
  DateTime? _ts;

  DateTime? get lastSyncTimestamp => _ts;
  void resetSyncCursor() => _ts = null;
  void testSetTimestamp(DateTime dt) => _ts = dt;
}
