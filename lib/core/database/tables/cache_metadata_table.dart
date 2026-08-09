import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// CacheMetadata table tracking TTL eviction, SQLite blob cache, and local file storage.
@TableIndex(name: 'cache_key_idx', columns: {#cacheKey})
@TableIndex(name: 'cache_expires_at_idx', columns: {#expiresAt})
@TableIndex(name: 'cache_last_accessed_idx', columns: {#lastAccessedAt})
class CacheMetadata extends Table with BaseSyncTable {
  /// Unique cache identification key (e.g., URL or CID hash).
  TextColumn get cacheKey => text().withLength(min: 1, max: 500)();

  /// MIME content type ('application/pdf', 'application/json', 'image/png').
  TextColumn get contentType => text().withDefault(const Constant('application/octet-stream'))();

  /// Cached payload size in bytes.
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();

  /// HTTP ETag or IPFS hash for conditional validation.
  TextColumn get eTag => text().nullable()();

  /// Expiration timestamp for time-to-live (TTL) eviction.
  DateTimeColumn get expiresAt => dateTime().nullable()();

  /// Timestamp when cache entry was last read.
  DateTimeColumn get lastAccessedAt => dateTime().withDefault(currentDateAndTime)();

  /// Frequency counter for LRU eviction policy.
  IntColumn get accessCount => integer().withDefault(const Constant(1))();

  /// Disk path if payload is stored outside SQLite.
  TextColumn get localFilePath => text().nullable()();
}
