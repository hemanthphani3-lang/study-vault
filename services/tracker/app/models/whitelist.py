from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Whitelist(Base, TrackerAuditMixin):
    """[PLACEHOLDER] Trusted academic institutional node whitelist (Sprint 10+)."""
    __tablename__ = "whitelist"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    institution_name: Mapped[str] = mapped_column(String(256), nullable=False)
    verified_by: Mapped[str] = mapped_column(String(64), default="academic_governance")
