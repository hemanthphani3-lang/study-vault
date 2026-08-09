import uuid
from datetime import datetime, timedelta, timezone
from sqlalchemy.ext.asyncio import AsyncSession
from app.core.config import settings
from app.core.exceptions import NodeNotFoundException
from app.models.metadata_availability import MetadataAvailability
from app.repositories.metadata_repo import MetadataAvailabilityRepository
from app.repositories.node_repo import NodeRepository
from app.schemas.metadata import MetadataAvailabilityInfo, MetadataResponse, MetadataUpdateRequest


class MetadataAvailabilityService:
    """Service tracking academic metadata availability declarations across registered peer nodes."""

    def __init__(self, db: AsyncSession):
        self.db = db
        self.meta_repo = MetadataAvailabilityRepository(db)
        self.node_repo = NodeRepository(db)

    async def update_metadata(self, payload: MetadataUpdateRequest) -> MetadataResponse:
        node = await self.node_repo.get_by_node_id(payload.node_id)
        if not node:
            raise NodeNotFoundException(payload.node_id)

        now = datetime.now(timezone.utc)
        expires_at = now + timedelta(hours=settings.REGISTRATION_EXPIRY_HOURS)

        added_count = 0
        existing_meta_ids = set(await self.meta_repo.get_metadata_ids_for_node(payload.node_id))

        new_ids_to_add = set(payload.metadata_ids_to_add) - existing_meta_ids
        for m_id in new_ids_to_add:
            item = MetadataAvailability(
                id=f"meta_{uuid.uuid4().hex[:12]}",
                node_id=payload.node_id,
                metadata_id=m_id,
                resource_type="paper",
                expires_at=expires_at,
            )
            self.db.add(item)
            added_count += 1

        removed_count = 0
        if payload.metadata_ids_to_remove:
            removed_count = await self.meta_repo.remove_metadata_from_node(
                payload.node_id, payload.metadata_ids_to_remove
            )

        updated_ids = (existing_meta_ids.union(new_ids_to_add)) - set(payload.metadata_ids_to_remove)
        node.metadata_count = len(updated_ids)
        await self.db.flush()

        return MetadataResponse(
            node_id=payload.node_id,
            total_metadata_registered=node.metadata_count,
            added_count=added_count,
            removed_count=removed_count,
        )

    async def get_metadata_info(self, metadata_id: str) -> MetadataAvailabilityInfo:
        nodes = await self.meta_repo.get_nodes_for_metadata(metadata_id, online_only=False)
        online_nodes = [n for n in nodes if n.is_online]

        return MetadataAvailabilityInfo(
            metadata_id=metadata_id,
            total_nodes_available=len(nodes),
            online_nodes_count=len(online_nodes),
            available_node_ids=[n.node_id for n in online_nodes],
        )
