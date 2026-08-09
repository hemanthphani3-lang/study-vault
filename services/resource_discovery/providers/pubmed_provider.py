"""PubMed provider — NCBI biomedical and life sciences literature."""
import xml.etree.ElementTree as ET
from typing import List, Optional
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.logging.logger import provider_logger


class PubMedProvider(AbstractProvider):
    _ESEARCH = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"
    _EFETCH  = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi"

    @property
    def provider_name(self) -> str:
        return "pubmed"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        provider_logger.info(f"[{self.provider_name}] Searching: '{query}'")

        # Step 1: get PMIDs
        search_resp = await self._fetch_get(self._ESEARCH, params={
            "db": "pubmed", "term": query, "retmax": str(min(limit, 15)),
            "retmode": "json", "usehistory": "n",
        })
        if not search_resp:
            return []

        pmids: List[str] = []
        try:
            pmids = search_resp.json().get("esearchresult", {}).get("idlist", [])
        except Exception:
            return []

        if not pmids:
            return []

        # Step 2: fetch abstracts
        fetch_resp = await self._fetch_get(self._EFETCH, params={
            "db": "pubmed", "id": ",".join(pmids), "retmode": "xml", "rettype": "abstract",
        })
        if not fetch_resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            root = ET.fromstring(fetch_resp.text)
            for article in root.findall(".//PubmedArticle"):
                title = self._text(article, ".//ArticleTitle")
                if not title:
                    continue

                abstract_parts = [el.text or "" for el in article.findall(".//AbstractText")]
                abstract = " ".join(p for p in abstract_parts if p).strip()

                authors: List[str] = []
                for author in article.findall(".//Author"):
                    last = self._text(author, "LastName") or ""
                    first = self._text(author, "ForeName") or ""
                    name = f"{first} {last}".strip()
                    if name:
                        authors.append(name)

                doi: Optional[str] = None
                for eid in article.findall(".//ArticleId"):
                    if eid.get("IdType") == "doi":
                        doi = eid.text
                    if eid.get("IdType") == "pubmed":
                        pmid = eid.text

                year_el = article.find(".//PubDate/Year")
                year = int(year_el.text) if year_el is not None and year_el.text and year_el.text.isdigit() else None

                pmid_el = article.find(".//PMID")
                pmid_val = pmid_el.text if pmid_el is not None else ""
                source_url = f"https://pubmed.ncbi.nlm.nih.gov/{pmid_val}/" if pmid_val else "https://pubmed.ncbi.nlm.nih.gov"

                results.append(DiscoveredResource(
                    title=title,
                    abstract_text=abstract,
                    authors=authors,
                    resource_type="paper",
                    category_slug="biomedical",
                    publication_year=year,
                    doi=doi,
                    source_url=source_url,
                    tags=[],
                    raw_metadata={"pmid": pmid_val, "pdf_url": f"https://www.ncbi.nlm.nih.gov/pmc/articles/pmid/{pmid_val}/pdf/" if pmid_val else ""},
                ))
        except Exception as e:
            provider_logger.error(f"[{self.provider_name}] XML parse error: {e}")

        return results

    @staticmethod
    def _text(el, path: str) -> Optional[str]:
        found = el.find(path)
        return found.text.strip() if found is not None and found.text else None
