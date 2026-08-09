from collections import OrderedDict
from typing import Optional
from services.resource_discovery.config.settings import settings


class DeduplicationCache:
    """In-memory LRU cache storing processed URL and DOI hashes to prevent duplicate ingest."""

    def __init__(self, capacity: int = settings.CACHE_CAPACITY):
        self.capacity = capacity
        self._cache: OrderedDict[str, bool] = OrderedDict()

    def contains(self, key: str) -> bool:
        if not key:
            return False
        clean_key = key.strip().lower()
        if clean_key in self._cache:
            self._cache.move_to_end(clean_key)
            return True
        return False

    def add(self, key: str) -> None:
        if not key:
            return
        clean_key = key.strip().lower()
        if clean_key in self._cache:
            self._cache.move_to_end(clean_key)
        else:
            self._cache[clean_key] = True
            if len(self._cache) > self.capacity:
                self._cache.popitem(last=False)

    def size(self) -> int:
        return len(self._cache)
