from typing import List
from sqlalchemy import func, select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.heartbeat import Heartbeat
from app.repositories.base import BaseRepository


class HeartbeatRepository(BaseRepository[Heartbeat]):
    def __init__(self, db: AsyncSession):
        super().__init__(Heartbeat, db)

    async def get_recent_for_node(self, node_id: str, limit: int = 10) -> List[Heartbeat]:
        result = await self.db.execute(
            select(Heartbeat)
            .where(Heartbeat.node_id == node_id)
            .order_by(Heartbeat.timestamp.desc())
            .limit(limit)
        )
        return list(result.scalars().all())

    async def count_total_heartbeats(self) -> int:
        result = await self.db.execute(select(func.count(Heartbeat.id)))
        return result.scalar() or 0
