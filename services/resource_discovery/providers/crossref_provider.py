"""Crossref provider — 150M+ DOI-registered scholarly works."""
from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.logging.logger import provider_logger


class CrossrefProvider(AbstractProvider):
    @property
    def provider_name(self) -> str:
        return "crossref"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "https://api.crossref.org/works"
        params = {
            "query": query,
            "rows": str(min(limit, 20)),
            "select": "DOI,title,abstract,author,published,container-title,type,is-referenced-by-count,link",
            "filter": "has-abstract:true",
            "mailto": "pipeline@studyvault.app",
        }
        provider_logger.info(f"[{self.provider_name}] Searching: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            items = resp.json().get("message", {}).get("items", [])
            for item in items:
                titles = item.get("title", [])
                title = titles[0] if titles else None
                if not title:
                    continue

                authors = []
                for a in item.get("author", []):
                    name = f"{a.get('given', '')} {a.get('family', '')}".strip()
                    if name:
                        authors.append(name)

                doi = item.get("DOI")
                pub_date = item.get("published", {}).get("date-parts", [[None]])[0]
                year = pub_date[0] if pub_date else None

                # Try to get open access PDF link
                pdf_url = None
                for link in item.get("link", []):
                    if "pdf" in link.get("content-type", "").lower() or "pdf" in link.get("URL", "").lower():
                        pdf_url = link.get("URL")
                        break

                results.append(DiscoveredResource(
                    title=title,
                    abstract_text=item.get("abstract", ""),
                    authors=authors,
                    resource_type="paper",
                    category_slug="research",
                    publication_year=year,
                    doi=doi,
                    source_url=f"https://doi.org/{doi}" if doi else "https://crossref.org",
                    tags=[],
                    raw_metadata={
                        "pdf_url": pdf_url or "",
                        "citations": str(item.get("is-referenced-by-count", 0)),
                        "journal": (item.get("container-title") or [""])[0],
                    },
                ))
        except Exception as e:
            provider_logger.error(f"[{self.provider_name}] Parse error: {e}")

        return results
