import time
from sqlalchemy.ext.asyncio import AsyncSession
from app.core.config import settings
from app.repositories.heartbeat_repo import HeartbeatRepository
from app.repositories.metadata_repo import MetadataAvailabilityRepository
from app.repositories.node_repo import NodeRepository
from app.repositories.statistics_repo import StatisticsRepository
from app.schemas.statistics import TrackerStatisticsResponse

START_TIME = time.time()


class StatisticsService:
    """Service generating real-time global telemetry and node cluster metrics."""

    def __init__(self, db: AsyncSession):
        self.db = db
        self.node_repo = NodeRepository(db)
        self.meta_repo = MetadataAvailabilityRepository(db)
        self.hb_repo = HeartbeatRepository(db)
        self.stat_repo = StatisticsRepository(db)

    async def get_global_statistics(self) -> TrackerStatisticsResponse:
        total_nodes = await self.node_repo.count_total_nodes()
        online_nodes = await self.node_repo.count_online_nodes()
        offline_nodes = total_nodes - online_nodes

        total_metadata = await self.meta_repo.count_total_metadata_records()
        unique_metadata = await self.meta_repo.count_unique_metadata_ids()
        countries_count = await self.stat_repo.count_active_countries()

        nodes_by_country = await self.stat_repo.get_nodes_by_country_distribution()
        nodes_by_platform = await self.stat_repo.get_nodes_by_platform_distribution()
        total_heartbeats = await self.hb_repo.count_total_heartbeats()

        uptime = time.time() - START_TIME

        return TrackerStatisticsResponse(
            total_registered_nodes=total_nodes,
            online_nodes=online_nodes,
            offline_nodes=offline_nodes,
            total_metadata_records=total_metadata,
            unique_metadata_ids=unique_metadata,
            active_countries_count=countries_count,
            nodes_by_country=nodes_by_country,
            nodes_by_platform=nodes_by_platform,
            heartbeats_processed_total=total_heartbeats,
            tracker_version=settings.VERSION,
            uptime_seconds=round(uptime, 2),
        )
