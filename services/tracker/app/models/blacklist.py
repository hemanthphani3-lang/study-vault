from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Blacklist(Base, TrackerAuditMixin):
    """[PLACEHOLDER] Network security blacklist for malicious node filtering (Sprint 10+)."""
    __tablename__ = "blacklist"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    reason: Mapped[str] = mapped_column(String(256), default="Malicious payload signature detected")
    banned_by: Mapped[str] = mapped_column(String(64), default="system_sentinel")
