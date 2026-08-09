from typing import Generic, List, Optional, TypeVar
from pydantic import BaseModel, ConfigDict, Field

T = TypeVar("T")


class BaseResponse(BaseModel, Generic[T]):
    """Standardized top-level API envelope."""
    success: bool = True
    data: T
    message: Optional[str] = None
    model_config = ConfigDict(from_attributes=True)


class PaginatedResponse(BaseModel, Generic[T]):
    """Structured response container with pagination metadata."""
    items: List[T]
    total_count: int = Field(..., description="Total items matching filter criteria")
    limit: int = Field(..., description="Page limit")
    offset: int = Field(..., description="Page offset")
    has_more: bool = Field(..., description="True if more records exist beyond current offset")
    model_config = ConfigDict(from_attributes=True)


class ErrorDetail(BaseModel):
    """Detailed error object returned on exceptions."""
    type: str
    message: str
    details: Optional[dict] = None


class ErrorResponse(BaseModel):
    """Uniform error response structure."""
    success: bool = False
    error: ErrorDetail
