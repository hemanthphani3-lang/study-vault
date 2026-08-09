from datetime import datetime, timedelta, timezone
from typing import List, Optional
from sqlalchemy import func, select, update
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.node import TrackerNode
from app.repositories.base import BaseRepository


class NodeRepository(BaseRepository[TrackerNode]):
    def __init__(self, db: AsyncSession):
        super().__init__(TrackerNode, db)

    async def get_by_node_id(self, node_id: str) -> Optional[TrackerNode]:
        result = await self.db.execute(
            select(TrackerNode).where(TrackerNode.node_id == node_id)
        )
        return result.scalars().first()

    async def get_online_nodes(self, limit: int = 100) -> List[TrackerNode]:
        result = await self.db.execute(
            select(TrackerNode)
            .where(TrackerNode.is_online == True)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def mark_timed_out_nodes_offline(self, timeout_cutoff: datetime) -> int:
        stmt = (
            update(TrackerNode)
            .where(TrackerNode.is_online == True)
            .where(TrackerNode.last_heartbeat_at < timeout_cutoff)
            .values(is_online=False, version=TrackerNode.version + 1)
        )
        result = await self.db.execute(stmt)
        await self.db.flush()
        return result.rowcount

    async def count_total_nodes(self) -> int:
        result = await self.db.execute(select(func.count(TrackerNode.id)))
        return result.scalar() or 0

    async def count_online_nodes(self) -> int:
        result = await self.db.execute(
            select(func.count(TrackerNode.id)).where(TrackerNode.is_online == True)
        )
        return result.scalar() or 0
