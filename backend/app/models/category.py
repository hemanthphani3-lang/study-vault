from typing import Optional
from sqlalchemy import Integer, String, Text
from sqlalchemy.orm import Mapped, mapped_column
from app.database.base import Base, SoftDeleteMixin, TimestampMixin


class Category(Base, TimestampMixin, SoftDeleteMixin):
    """Academic disciplines and taxonomy hierarchy."""
    __tablename__ = "categories"

    id: Mapped[str] = mapped_column(String(64), primary_key=True, index=True)
    slug: Mapped[str] = mapped_column(String(64), unique=True, index=True, nullable=False)
    name: Mapped[str] = mapped_column(String(128), nullable=False, index=True)
    description: Mapped[Optional[str]] = mapped_column(Text, nullable=True)
    icon_name: Mapped[str] = mapped_column(String(64), default="folder")
    accent_color_hex: Mapped[str] = mapped_column(String(16), default="#4F46E5")
    parent_category_id: Mapped[Optional[str]] = mapped_column(String(64), nullable=True, index=True)
    item_count: Mapped[int] = mapped_column(Integer, default=0)
    display_order: Mapped[int] = mapped_column(Integer, default=0, index=True)
