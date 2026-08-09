"""DOAJ provider — Directory of Open Access Journals."""
from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.logging.logger import provider_logger


class DoajProvider(AbstractProvider):
    @property
    def provider_name(self) -> str:
        return "doaj"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "https://doaj.org/api/search/articles/" + query.replace(" ", "%20")
        params = {"pageSize": str(min(limit, 10)), "page": "1"}
        provider_logger.info(f"[{self.provider_name}] Searching: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            for item in resp.json().get("results", []):
                bib = item.get("bibjson", {})
                title = bib.get("title")
                if not title:
                    continue

                authors = [a.get("name", "") for a in (bib.get("author") or []) if a.get("name")]
                doi_list = [i.get("id", "") for i in (bib.get("identifier") or []) if i.get("type") == "doi"]
                doi = doi_list[0] if doi_list else None
                year = bib.get("year")
                if year:
                    try:
                        year = int(year)
                    except (ValueError, TypeError):
                        year = None

                # Get full-text link
                pdf_url = None
                for link in bib.get("link", []):
                    if link.get("type") == "fulltext":
                        pdf_url = link.get("url")
                        break

                source_url = pdf_url or f"https://doaj.org/article/{item.get('id', '')}"

                results.append(DiscoveredResource(
                    title=title,
                    abstract_text=bib.get("abstract", ""),
                    authors=authors,
                    resource_type="paper",
                    category_slug="research",
                    publication_year=year,
                    doi=doi,
                    source_url=source_url,
                    tags=[s.get("term", "") for s in (bib.get("subject") or [])],
                    raw_metadata={"pdf_url": pdf_url or ""},
                ))
        except Exception as e:
            provider_logger.error(f"[{self.provider_name}] Parse error: {e}")

        return results
