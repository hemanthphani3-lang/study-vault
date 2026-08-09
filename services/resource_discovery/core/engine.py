from typing import List, Optional
from services.resource_discovery.core.interfaces import BaseProvider, DiscoveredResource
from services.resource_discovery.core.publisher import FastAPIPublisher
from services.resource_discovery.logging.logger import logger
from services.resource_discovery.normalizers.metadata_normalizer import MetadataNormalizer
from services.resource_discovery.storage.cache import DeduplicationCache
from services.resource_discovery.validators.metadata_validator import MetadataValidator


class DiscoveryEngine:
    """Core orchestrator executing academic discovery, normalization, validation, deduplication, and publishing."""

    def __init__(
        self,
        providers: Optional[List[BaseProvider]] = None,
        publisher: Optional[FastAPIPublisher] = None,
    ):
        self.providers: List[BaseProvider] = providers or []
        self.publisher: FastAPIPublisher = publisher or FastAPIPublisher()
        self.cache: DeduplicationCache = DeduplicationCache()

    def register_provider(self, provider: BaseProvider) -> None:
        self.providers.append(provider)
        logger.info(f"Registered discovery provider: '{provider.provider_name}'")

    async def run_discovery(self, query: str, limit_per_provider: int = 10, publish_to_backend: bool = True) -> List[DiscoveredResource]:
        logger.info(f"Starting Resource Discovery pipeline for query: '{query}' across {len(self.providers)} providers.")
        discovered_items: List[DiscoveredResource] = []

        for provider in self.providers:
            try:
                raw_items = await provider.discover(query, limit=limit_per_provider)
                for item in raw_items:
                    # 1. Deduplication check
                    dedup_key = item.doi or item.arxiv_id or item.isbn or item.source_url
                    if self.cache.contains(dedup_key):
                        logger.debug(f"Skipped duplicate resource key: {dedup_key}")
                        continue

                    # 2. Normalization
                    normalized = MetadataNormalizer.normalize_resource(item)

                    # 3. Validation & Confidence Scoring
                    is_valid, score, reasons = MetadataValidator.validate_resource(normalized)
                    if not is_valid:
                        continue

                    normalized.confidence_score = score
                    self.cache.add(dedup_key)
                    discovered_items.append(normalized)

                    # 4. Publish to FastAPI backend if requested
                    if publish_to_backend:
                        await self.publisher.publish_resource(normalized)

            except Exception as exc:
                logger.error(f"Error executing discovery on provider '{provider.provider_name}': {exc}")

        logger.info(
            f"Discovery pipeline finished for '{query}'. Discovered & validated {len(discovered_items)} academic metadata items."
        )
        return discovered_items
