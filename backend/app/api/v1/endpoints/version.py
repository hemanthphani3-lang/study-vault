from fastapi import APIRouter, Depends
from app.dependencies.database import get_health_service
from app.schemas.health import VersionResponse
from app.services.health_service import HealthService

router = APIRouter()


@router.get("/version", response_model=VersionResponse, summary="API protocol and version metadata")
async def get_version(health_service: HealthService = Depends(get_health_service)) -> VersionResponse:
    """Returns current API release version, minimum supported client, and protocol specs."""
    return health_service.get_version_info()
