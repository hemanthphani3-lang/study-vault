from datetime import datetime
from typing import Optional
from sqlalchemy import DateTime, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class NodeSession(Base, TrackerAuditMixin):
    """Tracks active and historical connection sessions for each peer node."""
    __tablename__ = "node_sessions"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), index=True, nullable=False)
    session_token: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    status: Mapped[str] = mapped_column(String(32), default="active", index=True) # active, closed, timed_out
    ip_address: Mapped[str] = mapped_column(String(64), default="127.0.0.1")
    user_agent: Mapped[str] = mapped_column(String(256), default="StudyVault-Mobile/0.9.0-alpha")
    connected_at: Mapped[datetime] = mapped_column(DateTime(timezone=True))
    disconnected_at: Mapped[Optional[datetime]] = mapped_column(DateTime(timezone=True), nullable=True)
