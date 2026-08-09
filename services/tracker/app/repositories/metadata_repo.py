from typing import List, Optional
from sqlalchemy import delete, func, select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.metadata_availability import MetadataAvailability
from app.models.node import TrackerNode
from app.repositories.base import BaseRepository


class MetadataAvailabilityRepository(BaseRepository[MetadataAvailability]):
    def __init__(self, db: AsyncSession):
        super().__init__(MetadataAvailability, db)

    async def get_nodes_for_metadata(self, metadata_id: str, online_only: bool = True) -> List[TrackerNode]:
        stmt = select(TrackerNode).join(
            MetadataAvailability, TrackerNode.node_id == MetadataAvailability.node_id
        ).where(MetadataAvailability.metadata_id == metadata_id)
        
        if online_only:
            stmt = stmt.where(TrackerNode.is_online == True)

        result = await self.db.execute(stmt)
        return list(result.scalars().all())

    async def get_metadata_ids_for_node(self, node_id: str) -> List[str]:
        result = await self.db.execute(
            select(MetadataAvailability.metadata_id).where(MetadataAvailability.node_id == node_id)
        )
        return list(result.scalars().all())

    async def remove_metadata_from_node(self, node_id: str, metadata_ids: List[str]) -> int:
        if not metadata_ids:
            return 0
        stmt = (
            delete(MetadataAvailability)
            .where(MetadataAvailability.node_id == node_id)
            .where(MetadataAvailability.metadata_id.in_(metadata_ids))
        )
        result = await self.db.execute(stmt)
        await self.db.flush()
        return result.rowcount

    async def count_total_metadata_records(self) -> int:
        result = await self.db.execute(select(func.count(MetadataAvailability.id)))
        return result.scalar() or 0

    async def count_unique_metadata_ids(self) -> int:
        result = await self.db.execute(select(func.count(func.distinct(MetadataAvailability.metadata_id))))
        return result.scalar() or 0
