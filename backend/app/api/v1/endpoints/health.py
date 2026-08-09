from fastapi import APIRouter, Depends
from app.dependencies.database import get_health_service
from app.schemas.health import HealthCheckResponse
from app.services.health_service import HealthService

router = APIRouter()


@router.get("/health", response_model=HealthCheckResponse, summary="System health and database probe")
async def check_health(health_service: HealthService = Depends(get_health_service)) -> HealthCheckResponse:
    """Returns real-time health, database connectivity, and telemetry metrics."""
    return await health_service.check_health()
