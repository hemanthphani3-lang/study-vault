"""OpenAlex provider — largest open academic graph (200M+ works)."""
from typing import List
import httpx
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.logging.logger import provider_logger


class OpenAlexProvider(AbstractProvider):
    """Discovers papers via OpenAlex API (open, no key required)."""

    @property
    def provider_name(self) -> str:
        return "openalex"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "https://api.openalex.org/works"
        params = {
            "search": query,
            "per-page": str(min(limit, 25)),
            "filter": "is_oa:true",
            "select": "id,title,abstract_inverted_index,authorships,publication_year,doi,primary_location,open_access,cited_by_count,keywords",
        }
        provider_logger.info(f"[{self.provider_name}] Searching: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            data = resp.json()
            for work in data.get("results", []):
                title = work.get("title")
                if not title:
                    continue

                # Reconstruct abstract from inverted index
                abstract_text = self._reconstruct_abstract(work.get("abstract_inverted_index"))

                authors = [
                    a.get("author", {}).get("display_name", "")
                    for a in (work.get("authorships") or [])
                ]
                authors = [a for a in authors if a]

                doi = (work.get("doi") or "").replace("https://doi.org/", "") or None
                year = work.get("publication_year")

                # PDF URL from primary_location
                pdf_url = None
                primary = work.get("primary_location") or {}
                pdf_url = primary.get("pdf_url")

                results.append(DiscoveredResource(
                    title=title,
                    abstract_text=abstract_text,
                    authors=authors,
                    resource_type="paper",
                    category_slug="research",
                    publication_year=year,
                    doi=doi,
                    source_url=work.get("id", f"https://openalex.org"),
                    tags=[k.get("display_name", "") for k in (work.get("keywords") or [])],
                    raw_metadata={"pdf_url": pdf_url or "", "citations": str(work.get("cited_by_count", 0))},
                ))
        except Exception as e:
            provider_logger.error(f"[{self.provider_name}] Parse error: {e}")

        return results

    def _reconstruct_abstract(self, inverted_index: dict) -> str:
        if not inverted_index:
            return ""
        try:
            word_positions = []
            for word, positions in inverted_index.items():
                for pos in positions:
                    word_positions.append((pos, word))
            word_positions.sort()
            return " ".join(w for _, w in word_positions)
        except Exception:
            return ""
