from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.extractors.metadata_extractor import MetadataExtractor
from services.resource_discovery.logging.logger import provider_logger
from services.resource_discovery.parsers.xml_parser import XMLParser
from services.resource_discovery.providers.base import AbstractProvider


class ArxivProvider(AbstractProvider):
    """Discovers preprint research papers via arXiv API."""

    @property
    def provider_name(self) -> str:
        return "arxiv"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "http://export.arxiv.org/api/query"
        params = {
            "search_query": f"all:{query}",
            "start": "0",
            "max_results": str(limit),
        }

        provider_logger.info(f"[{self.provider_name}] Crawling search query: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            entries = XMLParser.parse_atom_entries(resp.text)
            for entry in entries:
                title = entry.get("title")
                if not title:
                    continue

                published = entry.get("published", "")
                year = MetadataExtractor.extract_publication_year(published)
                arxiv_url = entry.get("id", "")
                arxiv_id = arxiv_url.split("/abs/")[-1] if "/abs/" in arxiv_url else None

                results.append(
                    DiscoveredResource(
                        title=title,
                        abstract_text=entry.get("summary"),
                        authors=entry.get("authors", []),
                        resource_type="paper",
                        category_slug="computer-science",
                        publication_year=year,
                        doi=entry.get("doi"),
                        arxiv_id=arxiv_id,
                        source_url=arxiv_url or f"https://arxiv.org/abs/{arxiv_id}",
                        license="arXiv Open Access License",
                        tags=entry.get("categories", []),
                        raw_metadata={"arxiv_id": arxiv_id or ""},
                    )
                )
        except Exception as exc:
            provider_logger.error(f"[{self.provider_name}] Error parsing arXiv XML response: {exc}")

        return results
