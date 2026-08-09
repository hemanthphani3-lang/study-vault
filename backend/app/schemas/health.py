from datetime import datetime
from typing import Dict, Optional
from pydantic import BaseModel, Field


class SystemMetrics(BaseModel):
    """Real-time system telemetry and resource allocation."""
    total_resources: int = 0
    active_peers_connected: int = 0
    database_latency_ms: float = 0.0
    uptime_seconds: float = 0.0


class HealthCheckResponse(BaseModel):
    """System health status payload."""
    status: str = Field(default="healthy", description="healthy, degraded, unavailable")
    version: str
    environment: str
    database_connected: bool
    timestamp: datetime
    metrics: Optional[SystemMetrics] = None


class VersionResponse(BaseModel):
    """API and protocol version metadata."""
    version: str
    min_client_version: str = "0.1.0"
    protocol_version: str = "1.0.0-draft"
    commit_sha: Optional[str] = "HEAD"
    release_date: str = "2026-08-08"
