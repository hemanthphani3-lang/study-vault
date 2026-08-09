from app.repositories.statistics_repo import StatisticsRepository


class StatisticsService:
    """Computes telemetry for discovery dashboards."""

    def __init__(self, stats_repo: StatisticsRepository):
        self.stats_repo = stats_repo

    async def get_dashboard_metrics(self) -> dict:
        return await self.stats_repo.get_metrics()
