"""Semantic Scholar provider — 200M+ papers with rich citation graph."""
from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.logging.logger import provider_logger


class SemanticScholarProvider(AbstractProvider):
    @property
    def provider_name(self) -> str:
        return "semantic_scholar"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "https://api.semanticscholar.org/graph/v1/paper/search"
        params = {
            "query": query,
            "limit": str(min(limit, 10)),
            "fields": "title,abstract,authors,year,externalIds,openAccessPdf,citationCount,publicationTypes,publicationDate",
        }
        provider_logger.info(f"[{self.provider_name}] Searching: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            for paper in resp.json().get("data", []):
                title = paper.get("title")
                if not title:
                    continue

                authors = [a.get("name", "") for a in (paper.get("authors") or []) if a.get("name")]
                doi = (paper.get("externalIds") or {}).get("DOI")
                arxiv_id = (paper.get("externalIds") or {}).get("ArXiv")
                year = paper.get("year")

                pdf_url = None
                oa_pdf = paper.get("openAccessPdf") or {}
                pdf_url = oa_pdf.get("url")

                paper_id = paper.get("paperId", "")
                source_url = f"https://www.semanticscholar.org/paper/{paper_id}" if paper_id else "https://semanticscholar.org"

                results.append(DiscoveredResource(
                    title=title,
                    abstract_text=paper.get("abstract", ""),
                    authors=authors,
                    resource_type="paper",
                    category_slug="research",
                    publication_year=year,
                    doi=doi,
                    arxiv_id=arxiv_id,
                    source_url=source_url,
                    tags=[],
                    raw_metadata={
                        "pdf_url": pdf_url or "",
                        "citations": str(paper.get("citationCount", 0)),
                        "paper_id": paper_id,
                    },
                ))
        except Exception as e:
            provider_logger.error(f"[{self.provider_name}] Parse error: {e}")

        return results
