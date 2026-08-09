from sqlalchemy import Float, Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Reputation(Base, TrackerAuditMixin):
    """[PLACEHOLDER] Node reputation and trust score ledger for future network security (Sprint 10+)."""
    __tablename__ = "reputation"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    trust_score: Mapped[float] = mapped_column(Float, default=1.0)
    successful_syncs: Mapped[int] = mapped_column(Integer, default=0)
    failed_syncs: Mapped[int] = mapped_column(Integer, default=0)
    reputation_tier: Mapped[str] = mapped_column(String(32), default="standard") # standard, verified, trusted, suspicious
