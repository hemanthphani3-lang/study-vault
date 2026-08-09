from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.logging.logger import provider_logger
from services.resource_discovery.providers.base import AbstractProvider


class InternetArchiveProvider(AbstractProvider):
    """Discovers open access books and research materials via Internet Archive API."""

    @property
    def provider_name(self) -> str:
        return "internet_archive"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "https://archive.org/advancedsearch.php"
        params = {
            "q": f"title:({query}) AND mediatype:(texts)",
            "fl[]": "identifier,title,creator,year,publisher,description",
            "rows": str(limit),
            "output": "json",
        }

        provider_logger.info(f"[{self.provider_name}] Crawling search query: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            data = resp.json()
            docs = data.get("response", {}).get("docs", [])
            for doc in docs:
                title = doc.get("title")
                identifier = doc.get("identifier")
                if not title or not identifier:
                    continue

                creator = doc.get("creator", [])
                authors = creator if isinstance(creator, list) else [creator] if creator else []
                year_str = doc.get("year")
                year = int(year_str) if year_str and str(year_str).isdigit() else None

                resource = DiscoveredResource(
                    title=title,
                    abstract_text=doc.get("description"),
                    authors=authors,
                    resource_type="document",
                    category_slug="general",
                    publication_year=year,
                    source_url=f"https://archive.org/details/{identifier}",
                    cover_url=f"https://archive.org/services/img/{identifier}",
                    publisher=doc.get("publisher"),
                    raw_metadata={"ia_identifier": identifier},
                )
                results.append(resource)
        except Exception as exc:
            provider_logger.error(f"[{self.provider_name}] Error parsing Internet Archive response: {exc}")

        return results
