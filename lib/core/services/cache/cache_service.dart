import 'dart:collection';

/// Cached entry wrapper with TTL expiration metadata.
class CacheEntry<T> {
  const CacheEntry({
    required this.data,
    required this.expiresAt,
  });

  final T data;
  final DateTime expiresAt;

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

/// In-memory LRU and TTL cache service for high-speed metadata querying.
class CacheService {
  CacheService({this.maxEntries = 500, this.defaultTtl = const Duration(minutes: 30)});

  final int maxEntries;
  final Duration defaultTtl;

  final LinkedHashMap<String, CacheEntry<dynamic>> _cache = LinkedHashMap<String, CacheEntry<dynamic>>();

  /// Retrieves cached object if present and non-expired.
  T? get<T>(String key) {
    final CacheEntry<dynamic>? entry = _cache[key];
    if (entry == null) return null;

    if (entry.isExpired) {
      _cache.remove(key);
      return null;
    }

    // Move to end of LinkedHashMap (most recently used)
    _cache.remove(key);
    _cache[key] = entry;

    return entry.data as T?;
  }

  /// Puts an item into cache with optional custom TTL.
  void put<T>(String key, T value, {Duration? ttl}) {
    if (_cache.length >= maxEntries) {
      _cache.remove(_cache.keys.first); // Evict oldest
    }

    _cache[key] = CacheEntry<T>(
      data: value,
      expiresAt: DateTime.now().add(ttl ?? defaultTtl),
    );
  }

  /// Invalidates a specific key.
  void invalidate(String key) {
    _cache.remove(key);
  }

  /// Clears all cached memory entries.
  void clear() {
    _cache.clear();
  }

  /// Returns current number of active cached entries.
  int get count => _cache.length;
}
