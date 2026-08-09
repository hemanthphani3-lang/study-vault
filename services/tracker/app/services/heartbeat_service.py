import uuid
from datetime import datetime, timedelta, timezone
from sqlalchemy.ext.asyncio import AsyncSession
from app.core.config import settings
from app.core.exceptions import NodeNotFoundException
from app.models.heartbeat import Heartbeat
from app.repositories.heartbeat_repo import HeartbeatRepository
from app.repositories.node_repo import NodeRepository
from app.schemas.heartbeat import HeartbeatRequest, HeartbeatResponse


class HeartbeatService:
    """Service processing node telemetry, heartbeat intervals, and offline timeout detection."""

    def __init__(self, db: AsyncSession):
        self.db = db
        self.node_repo = NodeRepository(db)
        self.heartbeat_repo = HeartbeatRepository(db)

    async def process_heartbeat(self, payload: HeartbeatRequest) -> HeartbeatResponse:
        now = datetime.now(timezone.utc)
        node = await self.node_repo.get_by_node_id(payload.node_id)

        if not node:
            raise NodeNotFoundException(payload.node_id)

        # Update node status
        node.is_online = True
        node.last_heartbeat_at = now
        node.version += 1

        # Record heartbeat telemetry entry
        hb_record = Heartbeat(
            id=f"hb_{uuid.uuid4().hex[:12]}",
            node_id=payload.node_id,
            timestamp=now,
            active_connections=payload.active_connections,
            status=payload.status,
            expires_at=now + timedelta(days=7),
        )
        self.db.add(hb_record)

        # Sweep timed-out nodes offline (lazy cleanup execution on heartbeat path)
        timeout_cutoff = now - timedelta(seconds=settings.HEARTBEAT_TIMEOUT_SECS)
        await self.node_repo.mark_timed_out_nodes_offline(timeout_cutoff)

        await self.db.flush()

        return HeartbeatResponse(
            node_id=node.node_id,
            acknowledged=True,
            server_time=now,
            next_heartbeat_due_seconds=settings.HEARTBEAT_INTERVAL_SECS,
            is_online=True,
            registered_metadata_count=node.metadata_count,
        )
