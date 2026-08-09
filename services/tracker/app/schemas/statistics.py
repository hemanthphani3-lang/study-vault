from datetime import datetime
from typing import Dict
from pydantic import BaseModel, ConfigDict


class TrackerStatisticsResponse(BaseModel):
    total_registered_nodes: int
    online_nodes: int
    offline_nodes: int
    total_metadata_records: int
    unique_metadata_ids: int
    active_countries_count: int
    nodes_by_country: Dict[str, int]
    nodes_by_platform: Dict[str, int]
    heartbeats_processed_total: int
    tracker_version: str
    uptime_seconds: float
    model_config = ConfigDict(from_attributes=True)
