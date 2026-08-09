from abc import ABC, abstractmethod
from typing import Dict, List, Optional
from pydantic import BaseModel, ConfigDict, Field


class DiscoveredResource(BaseModel):
    """Canonical DTO for an extracted academic resource metadata item."""

    title: str = Field(..., description="Normalized document or paper title")
    subtitle: Optional[str] = Field(None, description="Subtitle or volume name")
    abstract_text: Optional[str] = Field(None, description="Abstract or summary text")
    authors: List[str] = Field(default_factory=list, description="List of author names")
    resource_type: str = Field(default="paper", description="paper, book, dataset, code, document")
    category_slug: str = Field(default="general", description="Taxonomy slug e.g. computer-science")
    language_code: str = Field(default="en", description="ISO-639-1 language code")
    publication_year: Optional[int] = Field(None, description="Year published")
    doi: Optional[str] = Field(None, description="Digital Object Identifier")
    isbn: Optional[str] = Field(None, description="ISBN-10 or ISBN-13")
    arxiv_id: Optional[str] = Field(None, description="arXiv identifier")
    cid: Optional[str] = Field(None, description="IPFS/Swarm CID hash if known")
    source_url: str = Field(..., description="Canonical URL where metadata was discovered")
    cover_url: Optional[str] = Field(None, description="Cover image thumbnail URL")
    publisher: Optional[str] = Field(None, description="Publisher or university press")
    license: Optional[str] = Field(None, description="Open Access or Creative Commons license")
    tags: List[str] = Field(default_factory=list, description="Keywords or subject headings")
    confidence_score: float = Field(default=1.0, ge=0.0, le=1.0, description="Quality validation score")
    raw_metadata: Dict[str, str] = Field(default_factory=dict, description="Unprocessed raw key-value metadata")

    model_config = ConfigDict(from_attributes=True)

    def to_backend_payload(self) -> dict:
        """Converts DiscoveredResource DTO into FastAPI ResourceCreate backend schema."""
        # Generate a deterministic ID from source_url/doi
        import hashlib
        identifier_source = self.doi or self.arxiv_id or self.isbn or self.source_url
        resource_id = "res_" + hashlib.sha256(identifier_source.encode("utf-8")).hexdigest()[:16]

        return {
            "id": resource_id,
            "title": self.title,
            "subtitle": self.subtitle,
            "abstract_text": self.abstract_text,
            "authors": self.authors,
            "resource_type": self.resource_type,
            "category_id": self.category_slug,
            "language_code": self.language_code,
            "publication_year": self.publication_year,
            "doi": self.doi,
            "isbn": self.isbn,
            "arxiv_id": self.arxiv_id,
            "cid": self.cid,
            "verification_tier": "verified" if self.confidence_score >= 0.85 else "community",
            "is_peer_reviewed": bool(self.doi or self.arxiv_id),
            "format": "pdf",
            "size_bytes": 0,
            "page_count": 0,
            "peer_seeders": 12,
            "availability_score": self.confidence_score,
        }


class BaseProvider(ABC):
    """Abstract interface for discovery providers."""

    @property
    @abstractmethod
    def provider_name(self) -> str:
        """Unique provider identifier."""
        pass

    @abstractmethod
    async def discover(self, query: str, limit: int = 20) -> List[DiscoveredResource]:
        """Discovers and returns metadata items matching the query."""
        pass
