"""CORE provider — largest open access research papers aggregator (30M+ papers)."""
from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.logging.logger import provider_logger


class CoreProvider(AbstractProvider):
    @property
    def provider_name(self) -> str:
        return "core"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        # CORE v3 free tier (no API key needed for basic search)
        url = "https://api.core.ac.uk/v3/search/works"
        params = {
            "q": query,
            "limit": str(min(limit, 10)),
            "stats": "false",
        }
        provider_logger.info(f"[{self.provider_name}] Searching: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            for work in resp.json().get("results", []):
                title = work.get("title")
                if not title:
                    continue

                authors = [a.get("name", "") for a in (work.get("authors") or []) if a.get("name")]
                doi = work.get("doi")
                year_str = (work.get("publishedDate") or "")[:4]
                year = int(year_str) if year_str.isdigit() else None

                pdf_url = work.get("downloadUrl") or work.get("sourceFulltextUrls", [None])[0]
                source_url = work.get("sourceFulltextUrls", ["https://core.ac.uk"])[0] or "https://core.ac.uk"

                results.append(DiscoveredResource(
                    title=title,
                    abstract_text=work.get("abstract", ""),
                    authors=authors,
                    resource_type="paper",
                    category_slug="research",
                    publication_year=year,
                    doi=doi,
                    source_url=source_url,
                    tags=[],
                    raw_metadata={"pdf_url": pdf_url or ""},
                ))
        except Exception as e:
            provider_logger.error(f"[{self.provider_name}] Parse error: {e}")

        return results
