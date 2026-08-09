from fastapi import APIRouter, Depends, Query, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.schemas.common import TrackerBaseResponse
from app.schemas.discovery import DiscoverPeersResponse
from app.services.discovery_service import DiscoveryService

router = APIRouter()


@router.get(
    "/discover",
    response_model=TrackerBaseResponse[DiscoverPeersResponse],
    status_code=status.HTTP_200_OK,
    summary="Discover online peer seeders holding specific metadata ID",
)
async def discover_peers(
    metadata_id: str = Query(..., description="Academic metadata ID to locate across peer network"),
    limit: int = Query(default=50, ge=1, le=100),
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[DiscoverPeersResponse]:
    """Finds active peer nodes carrying the target metadata record."""
    service = DiscoveryService(db)
    result = await service.discover_peers(metadata_id, limit=limit)
    return TrackerBaseResponse[DiscoverPeersResponse](
        data=result,
        message=f"Discovered {result.total_seeders} active peer seeders for metadata '{metadata_id}'.",
    )
