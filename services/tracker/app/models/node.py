from datetime import datetime
from typing import Optional
from sqlalchemy import Boolean, DateTime, Float, Integer, String, Text
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class TrackerNode(Base, TrackerAuditMixin):
    """Registered peer node on global academic knowledge network."""
    __tablename__ = "tracker_nodes"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    public_key: Mapped[str] = mapped_column(String(256), default="ED25519_PUBLIC_KEY_HEX")
    fingerprint: Mapped[str] = mapped_column(String(128), default="SHA256:FINGERPRINT_HEX")
    public_key_placeholder: Mapped[str] = mapped_column(String(256), default="ED25519_PLACEHOLDER_SPRINT_9")
    platform: Mapped[str] = mapped_column(String(32), default="flutter")
    app_version: Mapped[str] = mapped_column(String(32), default="0.9.0-alpha")
    country_code: Mapped[str] = mapped_column(String(4), default="US", index=True)
    region: Mapped[str] = mapped_column(String(128), default="global", index=True)
    capabilities_json: Mapped[str] = mapped_column(Text, default="[\"metadata_relay\", \"search_index\"]")
    network_address: Mapped[str] = mapped_column(String(512), default="127.0.0.1:8000")
    is_online: Mapped[bool] = mapped_column(Boolean, default=True, index=True)
    last_heartbeat_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), index=True)
    metadata_count: Mapped[int] = mapped_column(Integer, default=0)
    trust_score_placeholder: Mapped[float] = mapped_column(Float, default=1.0)
