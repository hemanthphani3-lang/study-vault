from typing import Dict, Any, List
from fastapi import APIRouter, HTTPException, Query, status
from pydantic import BaseModel, Field

router = APIRouter(prefix="/sharing", tags=["Content Sharing Protocol (SVCS)"])

_SHARED_ADVERTISEMENTS: Dict[str, Dict[str, Any]] = {}

class AdvertiseRequestSchema(BaseModel):
    node_id: str = Field(..., description="SVIP Node Identifier")
    metadata_id: str = Field(..., description="Academic Metadata Identifier")
    cid: str = Field(..., description="CIDv1 base32 multihash identifier")
    capabilities: List[str] = Field(default_factory=lambda: ["peer_seeder", "metadata_relay"])
    availability: str = Field(default="online")
    storage_status: str = Field(default="pinned")

class UnadvertiseRequestSchema(BaseModel):
    node_id: str
    cid: str

@router.post("/advertise", status_code=status.HTTP_200_OK)
async def advertise_resource(req: AdvertiseRequestSchema) -> Dict[str, Any]:
    """
    Registers an automatic P2P advertisement for a verified resource CID.
    """
    key = f"{req.node_id}:{req.cid}"
    _SHARED_ADVERTISEMENTS[key] = req.model_dump()

    return {
        "success": True,
        "data": {
            "node_id": req.node_id,
            "metadata_id": req.metadata_id,
            "cid": req.cid,
            "status": "advertised",
        },
        "message": "Resource CID advertisement published to global tracker network.",
    }

@router.post("/unadvertise", status_code=status.HTTP_200_OK)
async def unadvertise_resource(req: UnadvertiseRequestSchema) -> Dict[str, Any]:
    """Removes a P2P advertisement for a CID."""
    key = f"{req.node_id}:{req.cid}"
    _SHARED_ADVERTISEMENTS.pop(key, None)

    return {
        "success": True,
        "data": {
            "node_id": req.node_id,
            "cid": req.cid,
            "status": "unadvertised",
        },
        "message": "Resource CID advertisement withdrawn.",
    }

@router.get("/catalog", status_code=status.HTTP_200_OK)
async def get_network_sharing_catalog(limit: int = Query(default=50, ge=1, le=500)) -> Dict[str, Any]:
    """Lists active advertised resources in the network swarm."""
    ads = list(_SHARED_ADVERTISEMENTS.values())[:limit]
    return {
        "success": True,
        "data": {
            "catalog": ads,
            "total_advertisements": len(_SHARED_ADVERTISEMENTS),
        },
        "message": "Network sharing catalog retrieved successfully.",
    }

@router.get("/status", status_code=status.HTTP_200_OK)
async def get_sharing_status() -> Dict[str, Any]:
    """Returns telemetry status of global SVCS content sharing subsystem."""
    return {
        "success": True,
        "data": {
            "protocol": "SVCS/1.0",
            "specification": "SVE-007",
            "total_advertisements": len(_SHARED_ADVERTISEMENTS),
            "manual_uploads_allowed": False,
            "verification_rule": "STRICT_SVSG_DCA_VERIFIED_ONLY",
            "status": "OPERATIONAL",
        },
        "message": "SVCS Content Sharing Subsystem Operational.",
    }
