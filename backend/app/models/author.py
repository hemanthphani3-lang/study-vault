from typing import Optional
from sqlalchemy import Integer, String, Text
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, SoftDeleteMixin, TimestampMixin


class Author(Base, TimestampMixin, SoftDeleteMixin):
    """Academic researcher, author, and bibliometrics model."""
    __tablename__ = "authors"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    name: Mapped[str] = mapped_column(String(256), nullable=False, index=True)
    orcid: Mapped[Optional[str]] = mapped_column(String(32), unique=True, index=True, nullable=True)
    institution: Mapped[Optional[str]] = mapped_column(String(256), index=True, nullable=True)
    bio: Mapped[Optional[str]] = mapped_column(Text, nullable=True)
    avatar_url: Mapped[Optional[str]] = mapped_column(String(512), nullable=True)
    publication_count: Mapped[int] = mapped_column(Integer, default=0)
    h_index: Mapped[int] = mapped_column(Integer, default=0, index=True)
