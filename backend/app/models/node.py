from datetime import datetime
from typing import Optional
from sqlalchemy import BigInteger, Boolean, DateTime, Float, Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, SoftDeleteMixin, TimestampMixin


class Node(Base, TimestampMixin, SoftDeleteMixin):
    """P2P Swarm Node metadata model (Sprint 6 placeholder for future Swarm integration)."""
    __tablename__ = "nodes"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    peer_id: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    public_key_ed25519: Mapped[str] = mapped_column(String(128), nullable=False)
    multiaddresses_json: Mapped[str] = mapped_column(String(1024), default="[]")
    display_name: Mapped[str] = mapped_column(String(128), default="Academic Peer Node")
    node_type: Mapped[str] = mapped_column(String(32), default="standard") # institution, relay, seeder, standard
    trust_score: Mapped[float] = mapped_column(Float, default=1.0)
    is_active: Mapped[bool] = mapped_column(Boolean, default=True, index=True)
    last_ping_at: Mapped[Optional[datetime]] = mapped_column(DateTime(timezone=True), nullable=True)
    total_bytes_relayed: Mapped[int] = mapped_column(BigInteger, default=0)
