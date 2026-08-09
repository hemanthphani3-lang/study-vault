from typing import List
from fastapi import APIRouter, Depends, Query
from app.dependencies.database import get_metadata_service
from app.schemas.author import AuthorRead
from app.schemas.common import BaseResponse
from app.services.metadata_service import MetadataService

router = APIRouter()


@router.get("/authors", response_model=BaseResponse[List[AuthorRead]], summary="List top academic authors")
async def list_authors(
    limit: int = Query(50, ge=1, le=100),
    offset: int = Query(0, ge=0),
    metadata_service: MetadataService = Depends(get_metadata_service),
) -> BaseResponse[List[AuthorRead]]:
    """Retrieves top academic researchers sorted by publication count and h-index."""
    authors = await metadata_service.get_authors(limit=limit, offset=offset)
    return BaseResponse[List[AuthorRead]](data=authors)
