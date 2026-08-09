from typing import List, Optional
from pydantic import BaseModel, ConfigDict, Field


class CategoryBase(BaseModel):
    slug: str = Field(..., max_length=64, description="URL-safe unique category slug")
    name: str = Field(..., max_length=128, description="Human-readable category name")
    description: Optional[str] = None
    icon_name: str = "folder"
    accent_color_hex: str = "#4F46E5"
    parent_category_id: Optional[str] = None
    item_count: int = 0
    display_order: int = 0


class CategoryRead(CategoryBase):
    id: str
    model_config = ConfigDict(from_attributes=True)


class CategoryTree(CategoryRead):
    subcategories: List[CategoryRead] = Field(default_factory=list)
