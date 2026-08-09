from typing import List
from fastapi import APIRouter, Depends
from app.dependencies.database import get_metadata_service
from app.schemas.common import BaseResponse
from app.schemas.language import LanguageRead
from app.services.metadata_service import MetadataService

router = APIRouter()


@router.get("/languages", response_model=BaseResponse[List[LanguageRead]], summary="List supported document languages")
async def list_languages(
    metadata_service: MetadataService = Depends(get_metadata_service),
) -> BaseResponse[List[LanguageRead]]:
    """Retrieves supported ISO-639-1 languages catalog."""
    languages = await metadata_service.get_languages()
    return BaseResponse[List[LanguageRead]](data=languages)
