import asyncio
from typing import List
from services.resource_discovery.core.engine import DiscoveryEngine
from services.resource_discovery.logging.logger import logger


class DiscoveryScheduler:
    """Schedules periodic and incremental academic discovery jobs."""

    def __init__(self, engine: DiscoveryEngine):
        self.engine = engine

    async def run_once(self, queries: List[str], limit_per_provider: int = 10, publish_to_backend: bool = True) -> int:
        total = 0
        for q in queries:
            items = await self.engine.run_discovery(q, limit_per_provider=limit_per_provider, publish_to_backend=publish_to_backend)
            total += len(items)
        return total

    async def start_periodic_runner(self, queries: List[str], interval_seconds: int = 3600) -> None:
        logger.info(f"Starting periodic discovery scheduler running every {interval_seconds} seconds.")
        while True:
            try:
                await self.run_once(queries)
            except Exception as exc:
                logger.error(f"Error in periodic discovery runner: {exc}")
            await asyncio.sleep(interval_seconds)
