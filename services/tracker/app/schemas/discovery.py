from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel, ConfigDict, Field


class PeerNodeInfo(BaseModel):
    node_id: str
    network_address: str
    country_code: str
    region: str
    is_online: bool
    trust_score: float
    last_heartbeat_at: datetime
    model_config = ConfigDict(from_attributes=True)


class DiscoverPeersResponse(BaseModel):
    metadata_id: str
    total_seeders: int
    online_peers: List[PeerNodeInfo]
    model_config = ConfigDict(from_attributes=True)
