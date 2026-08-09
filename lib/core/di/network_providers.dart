// Sprint 8 Network Providers
//
// All network and sync providers have been consolidated into
// [data_providers.dart] to avoid circular imports and duplicate
// AppDatabase instances.
//
// This file is kept as a named barrel export for any future
// network-only providers (e.g., rate limiter, circuit breaker).
export 'data_providers.dart'
    show
        apiClientProvider,
        metadataSyncManagerProvider,
        syncRepositoryProvider,
        remoteDataSourceProvider;
