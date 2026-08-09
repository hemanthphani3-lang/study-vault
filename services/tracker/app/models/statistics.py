from datetime import datetime
from sqlalchemy import DateTime, Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Statistics(Base, TrackerAuditMixin):
    """Aggregated global tracker metrics snapshot."""
    __tablename__ = "tracker_statistics"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    total_nodes: Mapped[int] = mapped_column(Integer, default=0)
    online_nodes: Mapped[int] = mapped_column(Integer, default=0)
    offline_nodes: Mapped[int] = mapped_column(Integer, default=0)
    total_metadata_records: Mapped[int] = mapped_column(Integer, default=0)
    unique_metadata_ids: Mapped[int] = mapped_column(Integer, default=0)
    active_countries_count: Mapped[int] = mapped_column(Integer, default=0)
    heartbeats_processed: Mapped[int] = mapped_column(Integer, default=0)
    snapshot_time: Mapped[datetime] = mapped_column(DateTime(timezone=True), index=True)
