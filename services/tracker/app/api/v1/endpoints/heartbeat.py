from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.schemas.common import TrackerBaseResponse
from app.schemas.heartbeat import HeartbeatRequest, HeartbeatResponse
from app.services.heartbeat_service import HeartbeatService

router = APIRouter()


@router.post(
    "/heartbeat",
    response_model=TrackerBaseResponse[HeartbeatResponse],
    status_code=status.HTTP_200_OK,
    summary="Submit peer heartbeat and update online availability state",
)
async def submit_heartbeat(
    payload: HeartbeatRequest,
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[HeartbeatResponse]:
    """Processes node heartbeat ping and updates node online status."""
    service = HeartbeatService(db)
    result = await service.process_heartbeat(payload)
    return TrackerBaseResponse[HeartbeatResponse](
        data=result,
        message="Heartbeat acknowledged.",
    )
