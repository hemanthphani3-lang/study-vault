from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel, ConfigDict, Field


class ResourceBase(BaseModel):
    """Base fields common to academic resource representation."""
    title: str = Field(..., max_length=512, description="Document or paper title")
    subtitle: Optional[str] = Field(None, max_length=512)
    abstract_text: Optional[str] = Field(None, description="Abstract or executive summary")
    authors: List[str] = Field(default_factory=list, description="List of author names")
    resource_type: str = Field(default="paper", description="paper, book, dataset, code, document")
    category_id: Optional[str] = Field(None, description="Discipline category ID")
    language_code: str = Field(default="en", max_length=8)
    publication_year: Optional[int] = Field(None, ge=1800, le=2100)
    doi: Optional[str] = Field(None, description="Digital Object Identifier")
    isbn: Optional[str] = Field(None, description="International Standard Book Number")
    arxiv_id: Optional[str] = Field(None, description="arXiv identifier")
    pubmed_id: Optional[str] = Field(None, description="PubMed PMID")
    cid: Optional[str] = Field(None, description="IPFS/Swarm Content Identifier")
    content_hash: Optional[str] = Field(None, description="SHA-256 integrity digest")
    verification_tier: str = Field(default="verified", description="verified, peerReviewed, community, unverified")
    is_peer_reviewed: bool = Field(default=False)
    format: str = Field(default="pdf", max_length=16)
    size_bytes: int = Field(default=0, ge=0)
    page_count: int = Field(default=0, ge=0)
    peer_seeders: int = Field(default=0, ge=0)
    availability_score: float = Field(default=1.0, ge=0.0)


class ResourceCreate(ResourceBase):
    """Payload schema for creating or indexing a new academic resource."""
    id: str = Field(..., max_length=64, description="Deterministic resource ID")


class ResourceRead(ResourceBase):
    """Complete academic resource metadata returned by REST API."""
    id: str
    citations_count: int = 0
    created_at: datetime
    updated_at: datetime
    model_config = ConfigDict(from_attributes=True)


class ResourceFilter(BaseModel):
    """Query parameter model for filtering academic catalog."""
    query: Optional[str] = None
    category_id: Optional[str] = None
    resource_type: Optional[str] = None
    author: Optional[str] = None
    language_code: Optional[str] = None
    min_year: Optional[int] = None
    max_year: Optional[int] = None
    verification_tier: Optional[str] = None
    is_downloaded: Optional[bool] = None
    limit: int = Field(default=50, ge=1, le=100)
    offset: int = Field(default=0, ge=0)
