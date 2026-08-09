from typing import List
from fastapi import APIRouter, Depends
from app.dependencies.database import get_metadata_service
from app.schemas.category import CategoryRead
from app.schemas.common import BaseResponse
from app.services.metadata_service import MetadataService

router = APIRouter()


@router.get("/categories", response_model=BaseResponse[List[CategoryRead]], summary="List all academic categories")
async def list_categories(
    metadata_service: MetadataService = Depends(get_metadata_service),
) -> BaseResponse[List[CategoryRead]]:
    """Retrieves all academic disciplines ordered by taxonomy hierarchy."""
    categories = await metadata_service.get_categories()
    return BaseResponse[List[CategoryRead]](data=categories)
