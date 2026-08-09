import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/di/data_providers.dart';
import 'package:study_vault/core/sync/sync_status.dart';
import 'package:study_vault/domain/repositories/sync_repository.dart';
import 'package:study_vault/features/sync/presentation/providers/sync_provider.dart';

// ─── Fake Sync Repository ─────────────────────────────────────────────────────

class _FakeSyncRepo implements ISyncRepository {
  _FakeSyncRepo({required SyncState returnState}) : _state = returnState;

  final SyncState _state;
  bool syncCalled = false;
  bool resetCalled = false;

  @override
  Future<SyncState> syncNow() async {
    syncCalled = true;
    return _state;
  }

  @override
  void resetCursor() => resetCalled = true;

  @override
  DateTime? get lastSyncedAt => _state.lastSyncAt;
}

// ─── Override Helper ──────────────────────────────────────────────────────────

ProviderContainer _makeContainer(ISyncRepository fakeRepo) {
  return ProviderContainer(
    overrides: <Override>[
      syncRepositoryProvider.overrideWithValue(fakeRepo),
    ],
  );
}

// ─── Tests ────────────────────────────────────────────────────────────────────

void main() {
  group('SyncNotifier', () {
    test('initial state is idle', () {
      final container = _makeContainer(
        _FakeSyncRepo(returnState: const SyncState()),
      );
      addTearDown(container.dispose);

      final state = container.read(syncProvider);
      expect(state.status, SyncStatus.idle);
    });

    test('sync() transitions to synchronizing then success', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: SyncState(
          status: SyncStatus.success,
          lastSyncAt: DateTime(2026, 8, 8),
          syncedCount: 10,
        ),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      final notifier = container.read(syncProvider.notifier);
      await notifier.sync();

      final state = container.read(syncProvider);
      expect(state.status, SyncStatus.success);
      expect(state.syncedCount, 10);
      expect(fakeRepo.syncCalled, isTrue);
    });

    test('sync() transitions to offline on network failure', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: const SyncState(
          status: SyncStatus.offline,
          errorMessage: 'No internet connection. Operating in offline mode.',
        ),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      await container.read(syncProvider.notifier).sync();

      final state = container.read(syncProvider);
      expect(state.isOffline, isTrue);
      expect(state.errorMessage, isNotNull);
    });

    test('sync() transitions to error on backend failure', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: const SyncState(
          status: SyncStatus.error,
          errorMessage: 'Backend server error. Please try again later.',
        ),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      await container.read(syncProvider.notifier).sync();

      final state = container.read(syncProvider);
      expect(state.hasError, isTrue);
    });

    test('forceFullSync resets cursor and re-syncs', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: const SyncState(status: SyncStatus.success, syncedCount: 5),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      await container.read(syncProvider.notifier).forceFullSync();

      expect(fakeRepo.resetCalled, isTrue);
      expect(fakeRepo.syncCalled, isTrue);
    });

    test('markOffline sets offline state without network call', () {
      final fakeRepo = _FakeSyncRepo(returnState: const SyncState());
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      container.read(syncProvider.notifier).markOffline();

      final state = container.read(syncProvider);
      expect(state.isOffline, isTrue);
      expect(fakeRepo.syncCalled, isFalse);
    });

    test('isSyncingProvider reflects loading state correctly', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: const SyncState(status: SyncStatus.success),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      // Before sync — not syncing
      expect(container.read(isSyncingProvider), isFalse);
      await container.read(syncProvider.notifier).sync();
      // After sync completes — not syncing
      expect(container.read(isSyncingProvider), isFalse);
    });

    test('isOfflineProvider reflects offline state', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: const SyncState(status: SyncStatus.offline),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      await container.read(syncProvider.notifier).sync();
      expect(container.read(isOfflineProvider), isTrue);
    });

    test('syncedCountProvider reflects last sync count', () async {
      final fakeRepo = _FakeSyncRepo(
        returnState: const SyncState(status: SyncStatus.success, syncedCount: 99),
      );
      final container = _makeContainer(fakeRepo);
      addTearDown(container.dispose);

      await container.read(syncProvider.notifier).sync();
      expect(container.read(syncedCountProvider), 99);
    });

    test('concurrent sync() calls are debounced — second call is no-op', () async {
      int callCount = 0;
      final slowRepo = _SlowFakeSyncRepo(
        returnState: const SyncState(status: SyncStatus.success),
        onSyncCalled: () => callCount++,
      );
      final container = _makeContainer(slowRepo);
      addTearDown(container.dispose);

      final notifier = container.read(syncProvider.notifier);
      // Fire two syncs without awaiting the first
      final f1 = notifier.sync();
      final f2 = notifier.sync(); // should be no-op because isLoading is true
      await Future.wait(<Future<void>>[f1, f2]);

      // Only one actual sync should have occurred
      expect(callCount, lessThanOrEqualTo(1));
    });
  });
}

// ─── Slow Fake for concurrency test ──────────────────────────────────────────

class _SlowFakeSyncRepo implements ISyncRepository {
  _SlowFakeSyncRepo({
    required this.returnState,
    required this.onSyncCalled,
  });

  final SyncState returnState;
  final void Function() onSyncCalled;

  @override
  Future<SyncState> syncNow() async {
    onSyncCalled();
    await Future<void>.delayed(const Duration(milliseconds: 50));
    return returnState;
  }

  @override
  void resetCursor() {}

  @override
  DateTime? get lastSyncedAt => null;
}
