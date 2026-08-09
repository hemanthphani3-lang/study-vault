from sqlalchemy import BigInteger, Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TimestampMixin


class Statistics(Base, TimestampMixin):
    """Aggregated global and discipline network metrics."""
    __tablename__ = "network_statistics"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    total_resources: Mapped[int] = mapped_column(Integer, default=0)
    total_verified_papers: Mapped[int] = mapped_column(Integer, default=0)
    total_datasets: Mapped[int] = mapped_column(Integer, default=0)
    total_books: Mapped[int] = mapped_column(Integer, default=0)
    active_peers_count: Mapped[int] = mapped_column(Integer, default=0)
    total_bytes_indexed: Mapped[int] = mapped_column(BigInteger, default=0)
