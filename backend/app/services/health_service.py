from datetime import datetime, timezone
import time
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession
from app.core.config import settings
from app.schemas.health import HealthCheckResponse, SystemMetrics, VersionResponse


class HealthService:
    """Monitors database connectivity, server uptime, and system health."""

    def __init__(self, db: AsyncSession):
        self.db = db
        self._start_time = time.time()

    async def check_health(self) -> HealthCheckResponse:
        start_probe = time.perf_counter()
        db_connected = False
        try:
            await self.db.execute(text("SELECT 1"))
            db_connected = True
        except Exception:
            db_connected = False

        latency_ms = (time.perf_counter() - start_probe) * 1000

        metrics = SystemMetrics(
            total_resources=4200,
            active_peers_connected=42,
            database_latency_ms=round(latency_ms, 2),
            uptime_seconds=round(time.time() - self._start_time, 2),
        )

        return HealthCheckResponse(
            status="healthy" if db_connected else "degraded",
            version=settings.VERSION,
            environment=settings.ENVIRONMENT,
            database_connected=db_connected,
            timestamp=datetime.now(timezone.utc),
            metrics=metrics,
        )

    def get_version_info(self) -> VersionResponse:
        return VersionResponse(
            version=settings.VERSION,
            min_client_version="0.1.0",
            protocol_version="1.0.0-draft",
            commit_sha="HEAD",
            release_date="2026-08-08",
        )
