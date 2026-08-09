from datetime import datetime
from typing import Optional
from sqlalchemy import Integer, String, DateTime
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TimestampMixin


class Tracker(Base, TimestampMixin):
    """Academic Swarm Tracker metrics tracking peer seeders and leeches."""
    __tablename__ = "trackers"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    resource_cid: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    seeder_count: Mapped[int] = mapped_column(Integer, default=0, index=True)
    leecher_count: Mapped[int] = mapped_column(Integer, default=0)
    completed_downloads: Mapped[int] = mapped_column(Integer, default=0)
    last_announced_at: Mapped[Optional[datetime]] = mapped_column(DateTime(timezone=True), nullable=True)
