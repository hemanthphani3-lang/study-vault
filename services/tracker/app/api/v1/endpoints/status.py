from fastapi import APIRouter, Depends, Path, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.schemas.common import TrackerBaseResponse
from app.schemas.node import NodeStatusResponse
from app.services.node_service import NodeService

router = APIRouter()


@router.get(
    "/status/{node_id}",
    response_model=TrackerBaseResponse[NodeStatusResponse],
    status_code=status.HTTP_200_OK,
    summary="Get real-time online status and registration snapshot of a node",
)
async def get_node_status(
    node_id: str = Path(..., description="Target node ID"),
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[NodeStatusResponse]:
    """Returns current online state, heartbeat freshness, and metadata counts for a node."""
    service = NodeService(db)
    result = await service.get_node_status(node_id)
    return TrackerBaseResponse[NodeStatusResponse](
        data=result,
        message=f"Node status snapshot for '{node_id}'.",
    )
