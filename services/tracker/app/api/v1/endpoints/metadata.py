from fastapi import APIRouter, Depends, Path, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.schemas.common import TrackerBaseResponse
from app.schemas.metadata import MetadataAvailabilityInfo, MetadataResponse, MetadataUpdateRequest
from app.services.metadata_service import MetadataAvailabilityService

router = APIRouter()


@router.post(
    "/metadata",
    response_model=TrackerBaseResponse[MetadataResponse],
    status_code=status.HTTP_200_OK,
    summary="Declare additions or removals of metadata IDs cached on node",
)
async def update_metadata_availability(
    payload: MetadataUpdateRequest,
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[MetadataResponse]:
    """Updates the index of metadata IDs stored locally on a peer node."""
    service = MetadataAvailabilityService(db)
    result = await service.update_metadata(payload)
    return TrackerBaseResponse[MetadataResponse](
        data=result,
        message="Metadata availability index updated successfully.",
    )


@router.get(
    "/metadata/{metadata_id}",
    response_model=TrackerBaseResponse[MetadataAvailabilityInfo],
    status_code=status.HTTP_200_OK,
    summary="Get overall peer availability metrics for specific metadata ID",
)
async def get_metadata_availability_info(
    metadata_id: str = Path(..., description="Target academic metadata ID"),
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[MetadataAvailabilityInfo]:
    """Retrieves global network availability stats for a metadata ID."""
    service = MetadataAvailabilityService(db)
    result = await service.get_metadata_info(metadata_id)
    return TrackerBaseResponse[MetadataAvailabilityInfo](
        data=result,
        message=f"Metadata availability metrics for '{metadata_id}'.",
    )
