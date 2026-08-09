from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, TimestampMixin


class Language(Base, TimestampMixin):
    """Supported ISO-639-1 language catalog for academic content."""
    __tablename__ = "languages"

    code: Mapped[str] = mapped_column(String(8), primary_key=True, index=True)
    name: Mapped[str] = mapped_column(String(64), nullable=False)
    native_name: Mapped[str] = mapped_column(String(64), nullable=False)
