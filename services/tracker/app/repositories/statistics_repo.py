from typing import Dict
from sqlalchemy import func, select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.country import Country
from app.models.node import TrackerNode
from app.models.statistics import Statistics
from app.repositories.base import BaseRepository


class StatisticsRepository(BaseRepository[Statistics]):
    def __init__(self, db: AsyncSession):
        super().__init__(Statistics, db)

    async def get_nodes_by_country_distribution(self) -> Dict[str, int]:
        result = await self.db.execute(
            select(TrackerNode.country_code, func.count(TrackerNode.id))
            .group_by(TrackerNode.country_code)
        )
        return {row[0]: row[1] for row in result.all()}

    async def get_nodes_by_platform_distribution(self) -> Dict[str, int]:
        result = await self.db.execute(
            select(TrackerNode.platform, func.count(TrackerNode.id))
            .group_by(TrackerNode.platform)
        )
        return {row[0]: row[1] for row in result.all()}

    async def count_active_countries(self) -> int:
        result = await self.db.execute(select(func.count(func.distinct(TrackerNode.country_code))))
        return result.scalar() or 0
