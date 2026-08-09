from typing import Optional
from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TimestampMixin


class Publisher(Base, TimestampMixin):
    """Academic publishers, university presses, and open-access journals."""
    __tablename__ = "publishers"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    name: Mapped[str] = mapped_column(String(256), nullable=False, index=True)
    doi_prefix: Mapped[Optional[str]] = mapped_column(String(32), index=True, nullable=True)
    website: Mapped[Optional[str]] = mapped_column(String(512), nullable=True)
    jurisdiction: Mapped[Optional[str]] = mapped_column(String(64), nullable=True)
