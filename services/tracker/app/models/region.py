from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Region(Base, TrackerAuditMixin):
    """Geographic region breakdown for cluster load balancing."""
    __tablename__ = "tracker_regions"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    region_name: Mapped[str] = mapped_column(String(128), unique=True, index=True, nullable=False)
    country_code: Mapped[str] = mapped_column(String(4), index=True, nullable=False)
    active_node_count: Mapped[int] = mapped_column(Integer, default=0)
