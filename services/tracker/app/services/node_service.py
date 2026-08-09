import json
import uuid
from datetime import datetime, timedelta, timezone
from typing import List, Optional
from sqlalchemy.ext.asyncio import AsyncSession
from app.core.config import settings
from app.core.exceptions import NodeNotFoundException
from app.database.base import ensure_utc
from app.models.metadata_availability import MetadataAvailability
from app.models.node import TrackerNode
from app.models.node_session import NodeSession
from app.repositories.metadata_repo import MetadataAvailabilityRepository
from app.repositories.node_repo import NodeRepository
from app.schemas.node import NodeRegisterRequest, NodeResponse, NodeStatusResponse


class NodeService:
    """Service orchestrating node registration, lifecycle, and status tracking."""

    def __init__(self, db: AsyncSession):
        self.db = db
        self.node_repo = NodeRepository(db)
        self.meta_repo = MetadataAvailabilityRepository(db)

    async def register_node(self, payload: NodeRegisterRequest) -> NodeResponse:
        now = datetime.now(timezone.utc)
        expires_at = now + timedelta(hours=settings.REGISTRATION_EXPIRY_HOURS)

        existing_node = await self.node_repo.get_by_node_id(payload.node_id)
        
        if existing_node:
            existing_node.platform = payload.platform
            existing_node.app_version = payload.app_version
            existing_node.country_code = payload.country_code
            existing_node.region = payload.region
            existing_node.capabilities_json = json.dumps(payload.capabilities)
            existing_node.network_address = payload.network_address
            if payload.public_key:
                existing_node.public_key = payload.public_key
            if payload.fingerprint:
                existing_node.fingerprint = payload.fingerprint
            existing_node.is_online = True
            existing_node.last_heartbeat_at = now
            existing_node.expires_at = expires_at
            existing_node.version += 1
            node_record = existing_node
        else:
            node_record = TrackerNode(
                id=f"node_{uuid.uuid4().hex[:12]}",
                node_id=payload.node_id,
                public_key=payload.public_key or "ED25519_PUBLIC_KEY_HEX",
                fingerprint=payload.fingerprint or "SHA256:FINGERPRINT_HEX",
                public_key_placeholder=payload.public_key_placeholder or "ED25519_PLACEHOLDER_SPRINT_9",
                platform=payload.platform,
                app_version=payload.app_version,
                country_code=payload.country_code,
                region=payload.region,
                capabilities_json=json.dumps(payload.capabilities),
                network_address=payload.network_address,
                is_online=True,
                last_heartbeat_at=now,
                expires_at=expires_at,
                version=1,
            )
            await self.node_repo.create(node_record)

        # Register metadata IDs available on this node
        if payload.available_metadata_ids:
            existing_meta_ids = set(await self.meta_repo.get_metadata_ids_for_node(payload.node_id))
            new_meta_ids = set(payload.available_metadata_ids) - existing_meta_ids
            
            for m_id in new_meta_ids:
                meta_item = MetadataAvailability(
                    id=f"meta_{uuid.uuid4().hex[:12]}",
                    node_id=payload.node_id,
                    metadata_id=m_id,
                    resource_type="paper",
                    expires_at=expires_at,
                )
                self.db.add(meta_item)
            
            node_record.metadata_count = len(existing_meta_ids.union(payload.available_metadata_ids))

        # Log connection session
        session_record = NodeSession(
            id=f"sess_{uuid.uuid4().hex[:12]}",
            node_id=payload.node_id,
            session_token=f"tok_{uuid.uuid4().hex[:16]}",
            status="active",
            ip_address=payload.network_address.split(":")[0] if ":" in payload.network_address else "127.0.0.1",
            user_agent=f"StudyVault/{payload.app_version} ({payload.platform})",
            connected_at=now,
            expires_at=expires_at,
        )
        self.db.add(session_record)

        await self.db.flush()
        await self.db.refresh(node_record)
        return NodeResponse.model_validate(node_record)

    async def get_node_status(self, node_id: str) -> NodeStatusResponse:
        node = await self.node_repo.get_by_node_id(node_id)
        if not node:
            raise NodeNotFoundException(node_id)

        now = datetime.now(timezone.utc)
        timeout_cutoff = now - timedelta(seconds=settings.HEARTBEAT_TIMEOUT_SECS)
        last_hb = ensure_utc(node.last_heartbeat_at)
        is_still_online = node.is_online and (last_hb is not None and last_hb >= timeout_cutoff)

        if node.is_online and not is_still_online:
            node.is_online = False
            await self.db.flush()

        status_str = "active" if is_still_online else ("expired" if (node.expires_at and node.expires_at < now) else "offline")

        return NodeStatusResponse(
            node_id=node.node_id,
            is_online=is_still_online,
            status=status_str,
            last_heartbeat_at=node.last_heartbeat_at,
            metadata_count=node.metadata_count,
            country_code=node.country_code,
            region=node.region,
            trust_score=node.trust_score_placeholder,
        )

    async def deactivate_node(self, node_id: str) -> bool:
        node = await self.node_repo.get_by_node_id(node_id)
        if not node:
            return False
        node.is_online = False
        await self.db.flush()
        return True
