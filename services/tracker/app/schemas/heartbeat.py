from datetime import datetime
from typing import Optional
from pydantic import BaseModel, ConfigDict, Field


class HeartbeatRequest(BaseModel):
    node_id: str = Field(..., description="Node sending heartbeat")
    active_connections: int = Field(default=1, description="Active peer connections count")
    status: str = Field(default="healthy", description="Node status (healthy/degraded/syncing)")


class HeartbeatResponse(BaseModel):
    node_id: str
    acknowledged: bool = True
    server_time: datetime
    next_heartbeat_due_seconds: int
    is_online: bool
    registered_metadata_count: int
    model_config = ConfigDict(from_attributes=True)
