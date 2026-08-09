import json
from typing import List, Optional
from sqlalchemy import BigInteger, Boolean, Integer, JSON, String, Text, Float
from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.database.base import Base, SoftDeleteMixin, TimestampMixin


class Resource(Base, TimestampMixin, SoftDeleteMixin):
    """Academic resource metadata (Research papers, datasets, books, monographs).
    
    CRITICAL: Binary files/PDFs are NEVER stored here. Only cryptographic hashes,
    CIDs, DOI, citations, and discovery metadata.
    """
    __tablename__ = "resources"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    title: Mapped[str] = mapped_column(String(512), nullable=False, index=True)
    subtitle: Mapped[Optional[str]] = mapped_column(String(512), nullable=True)
    abstract_text: Mapped[Optional[str]] = mapped_column(Text, nullable=True)
    
    # Authors stored as JSON array of names
    authors_json: Mapped[str] = mapped_column(Text, default="[]", nullable=False)
    
    # Classification & Disciplines
    resource_type: Mapped[str] = mapped_column(String(32), default="paper", index=True)  # paper, book, dataset, code, document
    category_id: Mapped[Optional[str]] = mapped_column(String(64), index=True, nullable=True)
    language_code: Mapped[str] = mapped_column(String(8), default="en", index=True)
    
    # Bibliometric Identifiers
    publication_year: Mapped[Optional[int]] = mapped_column(Integer, nullable=True, index=True)
    doi: Mapped[Optional[str]] = mapped_column(String(128), unique=True, index=True, nullable=True)
    isbn: Mapped[Optional[str]] = mapped_column(String(32), index=True, nullable=True)
    arxiv_id: Mapped[Optional[str]] = mapped_column(String(32), index=True, nullable=True)
    pubmed_id: Mapped[Optional[str]] = mapped_column(String(32), index=True, nullable=True)
    
    # Decentralized & Verification Telemetry
    cid: Mapped[Optional[str]] = mapped_column(String(128), unique=True, index=True, nullable=True)
    content_hash: Mapped[Optional[str]] = mapped_column(String(128), index=True, nullable=True)
    verification_tier: Mapped[str] = mapped_column(String(32), default="verified", index=True) # verified, peerReviewed, community, unverified
    is_peer_reviewed: Mapped[bool] = mapped_column(Boolean, default=False)
    citations_count: Mapped[int] = mapped_column(Integer, default=0)
    
    # Format & Physical properties
    format: Mapped[str] = mapped_column(String(16), default="pdf")
    size_bytes: Mapped[int] = mapped_column(BigInteger, default=0)
    page_count: Mapped[int] = mapped_column(Integer, default=0)
    
    # Swarm Telemetry
    peer_seeders: Mapped[int] = mapped_column(Integer, default=0, index=True)
    availability_score: Mapped[float] = mapped_column(Float, default=1.0)
    
    # Extensible metadata dictionary
    metadata_json: Mapped[str] = mapped_column(Text, default="{}", nullable=False)

    @property
    def authors(self) -> List[str]:
        try:
            return json.loads(self.authors_json)
        except Exception:
            return []

    @authors.setter
    def authors(self, value: List[str]) -> None:
        self.authors_json = json.dumps(value)
