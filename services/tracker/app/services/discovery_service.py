from datetime import datetime, timedelta, timezone
from typing import List
from sqlalchemy.ext.asyncio import AsyncSession
from app.core.config import settings
from app.database.base import ensure_utc
from app.repositories.metadata_repo import MetadataAvailabilityRepository
from app.schemas.discovery import DiscoverPeersResponse, PeerNodeInfo


class DiscoveryService:
    """Service finding online peer nodes holding specific academic metadata records."""

    def __init__(self, db: AsyncSession):
        self.db = db
        self.meta_repo = MetadataAvailabilityRepository(db)

    async def discover_peers(self, metadata_id: str, limit: int = 50) -> DiscoverPeersResponse:
        now = datetime.now(timezone.utc)
        timeout_cutoff = now - timedelta(seconds=settings.HEARTBEAT_TIMEOUT_SECS)

        online_nodes = await self.meta_repo.get_nodes_for_metadata(metadata_id, online_only=True)
        
        # Additional sanity check: heartbeat within timeout threshold
        fresh_online_nodes = []
        for n in online_nodes:
            last_hb = ensure_utc(n.last_heartbeat_at)
            if last_hb and last_hb >= timeout_cutoff:
                fresh_online_nodes.append(n)

        capped_nodes = fresh_online_nodes[:limit]

        peer_infos = [
            PeerNodeInfo(
                node_id=n.node_id,
                network_address=n.network_address,
                country_code=n.country_code,
                region=n.region,
                is_online=True,
                trust_score=n.trust_score_placeholder,
                last_heartbeat_at=n.last_heartbeat_at,
            )
            for n in capped_nodes
        ]

        return DiscoverPeersResponse(
            metadata_id=metadata_id,
            total_seeders=len(fresh_online_nodes),
            online_peers=peer_infos,
        )
