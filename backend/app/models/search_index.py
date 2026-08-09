from sqlalchemy import Float, ForeignKey, Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TimestampMixin


class SearchIndex(Base, TimestampMixin):
    """Inverted search index mapping normalized token keywords to academic resources."""
    __tablename__ = "search_index"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    token: Mapped[str] = mapped_column(String(128), index=True, nullable=False)
    resource_id: Mapped[str] = mapped_column(String(64), ForeignKey("resources.id", ondelete="CASCADE"), index=True, nullable=False)
    field_name: Mapped[str] = mapped_column(String(32), default="title") # title, authors, abstract, doi, cid
    token_weight: Mapped[float] = mapped_column(Float, default=1.0)
