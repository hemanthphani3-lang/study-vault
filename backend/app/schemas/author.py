from typing import Optional
from pydantic import BaseModel, ConfigDict, Field


class AuthorBase(BaseModel):
    name: str = Field(..., max_length=256, description="Author full name")
    orcid: Optional[str] = Field(None, max_length=32, description="ORCID researcher ID")
    institution: Optional[str] = Field(None, max_length=256, description="Primary university or research lab")
    bio: Optional[str] = None
    avatar_url: Optional[str] = None
    publication_count: int = 0
    h_index: int = 0


class AuthorRead(AuthorBase):
    id: str
    model_config = ConfigDict(from_attributes=True)


class AuthorSummary(BaseModel):
    id: str
    name: str
    institution: Optional[str] = None
    publication_count: int = 0
    model_config = ConfigDict(from_attributes=True)
