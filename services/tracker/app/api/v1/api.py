from fastapi import APIRouter
from app.api.v1.endpoints import (
    discover,
    heartbeat,
    metadata,
    register,
    statistics,
    status,
)

api_router = APIRouter()

api_router.include_router(register.router, tags=["Node Registration"])
api_router.include_router(heartbeat.router, tags=["Heartbeat & Telemetry"])
api_router.include_router(discover.router, tags=["Peer Discovery"])
api_router.include_router(metadata.router, tags=["Metadata Availability"])
api_router.include_router(status.router, tags=["Node Status"])
api_router.include_router(statistics.router, tags=["Tracker Statistics"])
