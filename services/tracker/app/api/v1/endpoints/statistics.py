from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.schemas.common import TrackerBaseResponse
from app.schemas.statistics import TrackerStatisticsResponse
from app.services.statistics_service import StatisticsService

router = APIRouter()


@router.get(
    "/statistics",
    response_model=TrackerBaseResponse[TrackerStatisticsResponse],
    status_code=status.HTTP_200_OK,
    summary="Get global tracker cluster health and telemetry statistics",
)
async def get_global_statistics(
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[TrackerStatisticsResponse]:
    """Returns global cluster metrics, active nodes count, and distribution stats."""
    service = StatisticsService(db)
    result = await service.get_global_statistics()
    return TrackerBaseResponse[TrackerStatisticsResponse](
        data=result,
        message="Global tracker statistics computed successfully.",
    )
