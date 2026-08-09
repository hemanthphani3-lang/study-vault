from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.logging.logger import provider_logger
from services.resource_discovery.providers.base import AbstractProvider


class OpenLibraryProvider(AbstractProvider):
    """Discovers academic books, monographs, and research editions via OpenLibrary API."""

    @property
    def provider_name(self) -> str:
        return "open_library"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        url = "https://openlibrary.org/search.json"
        params = {"q": query, "limit": str(limit)}

        provider_logger.info(f"[{self.provider_name}] Crawling search query: '{query}'")
        resp = await self._fetch_get(url, params=params)
        if not resp:
            return []

        results: List[DiscoveredResource] = []
        try:
            data = resp.json()
            docs = data.get("docs", [])
            for doc in docs:
                title = doc.get("title")
                if not title:
                    continue

                authors = doc.get("author_name", [])
                first_publish_year = doc.get("first_publish_year")
                isbns = doc.get("isbn", [])
                isbn = isbns[0] if isbns else None
                key = doc.get("key", "")
                cover_i = doc.get("cover_i")

                source_url = f"https://openlibrary.org{key}" if key else f"https://openlibrary.org/search?q={query}"
                cover_url = f"https://covers.openlibrary.org/b/id/{cover_i}-M.jpg" if cover_i else None

                resource = DiscoveredResource(
                    title=title,
                    subtitle=doc.get("subtitle"),
                    authors=authors if isinstance(authors, list) else [authors],
                    resource_type="book",
                    category_slug="general",
                    publication_year=first_publish_year,
                    isbn=isbn,
                    source_url=source_url,
                    cover_url=cover_url,
                    publisher=doc.get("publisher", [None])[0] if isinstance(doc.get("publisher"), list) else None,
                    raw_metadata={"openlibrary_key": key},
                )
                results.append(resource)
        except Exception as exc:
            provider_logger.error(f"[{self.provider_name}] Error parsing OpenLibrary response: {exc}")

        return results
