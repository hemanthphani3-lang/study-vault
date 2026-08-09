import asyncio
from typing import Any, Dict, Optional


class DiscoveryQueue:
    """Async task and retry queue for incremental crawler jobs."""

    def __init__(self):
        self._queue: asyncio.Queue = asyncio.Queue()

    async def enqueue_job(self, provider_name: str, query: str, limit: int = 20) -> None:
        await self._queue.put({"provider": provider_name, "query": query, "limit": limit})

    async def dequeue_job(self) -> Optional[Dict[str, Any]]:
        try:
            return self._queue.get_nowait()
        except asyncio.QueueEmpty:
            return None

    def qsize(self) -> int:
        return self._queue.qsize()
