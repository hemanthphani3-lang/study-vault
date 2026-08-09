from typing import Generic, List, Optional, TypeVar
from pydantic import BaseModel, ConfigDict, Field

T = TypeVar("T")


class TrackerBaseResponse(BaseModel, Generic[T]):
    """Standard top-level envelope for Global Tracker responses."""
    success: bool = True
    data: T
    message: Optional[str] = None
    model_config = ConfigDict(from_attributes=True)


class PaginatedResponse(BaseModel, Generic[T]):
    """Paginated collection wrapper."""
    items: List[T]
    total_count: int = Field(..., description="Total records matching query")
    limit: int = Field(..., description="Page limit")
    offset: int = Field(..., description="Page offset")
    has_more: bool = Field(..., description="True if more records exist beyond offset")
    model_config = ConfigDict(from_attributes=True)
