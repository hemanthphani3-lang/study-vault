import httpx
from services.resource_discovery.config.settings import settings
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.logging.logger import logger


class FastAPIPublisher:
    """HTTP client publishing discovered, normalized, and validated metadata to the StudyVault backend."""

    def __init__(self, backend_url: str = settings.BACKEND_URL):
        self.endpoint = f"{backend_url.rstrip('/')}{settings.BACKEND_RESOURCES_ENDPOINT}"

    async def publish_resource(self, resource: DiscoveredResource) -> bool:
        payload = resource.to_backend_payload()
        try:
            async with httpx.AsyncClient(timeout=10.0) as client:
                resp = await client.post(self.endpoint, json=payload)
                if resp.status_code in (200, 201):
                    logger.info(f"Published resource metadata '{resource.title[:35]}...' to FastAPI backend.")
                    return True
                else:
                    logger.warning(f"Backend returned HTTP {resp.status_code} when publishing '{resource.title[:35]}...': {resp.text}")
                    return False
        except Exception as exc:
            logger.error(f"Failed to publish resource '{resource.title[:35]}...' to FastAPI backend: {exc}")
            return False
