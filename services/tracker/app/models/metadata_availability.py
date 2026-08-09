from sqlalchemy import Index, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class MetadataAvailability(Base, TrackerAuditMixin):
    """Maps academic metadata IDs available on registered peer nodes. Strictly metadata IDs only - ZERO file content."""
    __tablename__ = "metadata_availability"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    node_id: Mapped[str] = mapped_column(String(128), index=True, nullable=False)
    metadata_id: Mapped[str] = mapped_column(String(128), index=True, nullable=False)
    resource_type: Mapped[str] = mapped_column(String(32), default="paper") # paper, book, dataset, note
    cid_v1: Mapped[str] = mapped_column(String(128), index=True, nullable=True)

    __table_args__ = (
        Index("idx_node_metadata", "node_id", "metadata_id", unique=True),
    )
