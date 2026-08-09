from datetime import datetime
from sqlalchemy import DateTime, Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Heartbeat(Base, TrackerAuditMixin):
    """Timestamped ping events sent by active peer nodes."""
    __tablename__ = "heartbeats"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), index=True, nullable=False)
    timestamp: Mapped[datetime] = mapped_column(DateTime(timezone=True), index=True)
    active_connections: Mapped[int] = mapped_column(Integer, default=1)
    status: Mapped[str] = mapped_column(String(32), default="healthy") # healthy, degraded, syncing
