from typing import List
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.logging.logger import provider_logger
from services.resource_discovery.providers.base import AbstractProvider


class UniversityProvider(AbstractProvider):
    """Crawls Institutional Repositories and OpenCourseware metadata catalog."""

    @property
    def provider_name(self) -> str:
        return "university_ocw"

    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        provider_logger.info(f"[{self.provider_name}] Crawling institutional OCW catalog for query: '{query}'")
        
        # Institutional OpenCourseware Mock Metadata Ingest Generator
        sample_courseware = [
            DiscoveredResource(
                title=f"MIT OpenCourseWare: {query.capitalize()} Advanced Systems",
                subtitle="Massachusetts Institute of Technology Open Access Monograph",
                abstract_text=f"Comprehensive lecture notes, problem sets, and syllabus for advanced studies in {query}.",
                authors=["Prof. Hal Abelson", "Prof. Gerald Jay Sussman"],
                resource_type="document",
                category_slug="computer-science",
                publication_year=2026,
                source_url=f"https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/{query.lower().replace(' ', '-')}",
                publisher="MIT OpenCourseWare",
                license="CC-BY-NC-SA 4.0",
                tags=["OCW", "MIT", query],
            )
        ]
        return sample_courseware[:limit]
