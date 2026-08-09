import asyncio
from typing import Dict, List, Optional
import httpx
from services.resource_discovery.config.settings import settings
from services.resource_discovery.core.interfaces import BaseProvider, DiscoveredResource
from services.resource_discovery.logging.logger import provider_logger


class AbstractProvider(BaseProvider):
    """Base class for HTTP discovery providers with rate-limiting and retries."""

    def __init__(self):
        self.headers = {
            "User-Agent": settings.USER_AGENT,
            "Accept": "application/json, text/html, application/xml",
        }

    async def _fetch_get(self, url: str, params: Optional[Dict[str, str]] = None) -> Optional[httpx.Response]:
        """Executes GET request with ethical rate-limiting delay and exponential backoff."""
        await asyncio.sleep(settings.RATE_LIMIT_DELAY_SECONDS)

        for attempt in range(1, settings.MAX_RETRIES + 1):
            try:
                async with httpx.AsyncClient(timeout=settings.REQUEST_TIMEOUT_SECONDS, follow_redirects=True) as client:
                    resp = await client.get(url, params=params, headers=self.headers)
                    if resp.status_code == 200:
                        return resp
                    else:
                        provider_logger.warning(f"[{self.provider_name}] HTTP {resp.status_code} for {url}")
            except Exception as exc:
                provider_logger.warning(f"[{self.provider_name}] Attempt {attempt} failed for {url}: {exc}")
                await asyncio.sleep(1.5 ** attempt)

        return None
