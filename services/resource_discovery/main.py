import asyncio
import sys
import os

# Ensure resource_discovery root is on sys.path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

from services.resource_discovery.core.engine import DiscoveryEngine
from services.resource_discovery.logging.logger import logger
from services.resource_discovery.providers import (
    ArxivProvider,
    InternetArchiveProvider,
    OpenLibraryProvider,
    UniversityProvider,
)


async def main():
    logger.info("Initializing StudyVault Resource Discovery Service...")

    engine = DiscoveryEngine()
    engine.register_provider(OpenLibraryProvider())
    engine.register_provider(InternetArchiveProvider())
    engine.register_provider(ArxivProvider())
    engine.register_provider(UniversityProvider())

    sample_queries = ["zkSNARK", "quantum computing"]
    logger.info(f"Running initial academic metadata discovery batch for queries: {sample_queries}")

    for query in sample_queries:
        discovered = await engine.run_discovery(query, limit_per_provider=5, publish_to_backend=False)
        logger.info(f"Query '{query}' yielded {len(discovered)} validated metadata records.")
        for idx, res in enumerate(discovered[:3], 1):
            logger.info(f"  [{idx}] [{res.resource_type.upper()}] {res.title} (Year: {res.publication_year}, Score: {res.confidence_score})")

    logger.info("Resource Discovery Service run completed successfully.")


if __name__ == "__main__":
    asyncio.run(main())
