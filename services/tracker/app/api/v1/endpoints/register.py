from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.schemas.common import TrackerBaseResponse
from app.schemas.node import NodeRegisterRequest, NodeResponse
from app.services.node_service import NodeService

router = APIRouter()


@router.post(
    "/register",
    response_model=TrackerBaseResponse[NodeResponse],
    status_code=status.HTTP_201_CREATED,
    summary="Register or update peer node on global academic tracker",
)
async def register_node(
    payload: NodeRegisterRequest,
    db: AsyncSession = Depends(get_async_session),
) -> TrackerBaseResponse[NodeResponse]:
    """Registers a peer node and declares available cached metadata IDs."""
    service = NodeService(db)
    result = await service.register_node(payload)
    return TrackerBaseResponse[NodeResponse](
        data=result,
        message="Peer node registered successfully on Global Academic Tracker.",
    )
