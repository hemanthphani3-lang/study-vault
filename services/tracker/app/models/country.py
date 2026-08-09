from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TrackerAuditMixin


class Country(Base, TrackerAuditMixin):
    """Country directory for geographic node distribution telemetry."""
    __tablename__ = "tracker_countries"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    country_code: Mapped[str] = mapped_column(String(4), unique=True, index=True, nullable=False)
    country_name: Mapped[str] = mapped_column(String(128), nullable=False)
    active_node_count: Mapped[int] = mapped_column(Integer, default=0)
