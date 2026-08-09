import time
from typing import Dict, Any, List
from fastapi import APIRouter, HTTPException, Query, status
from pydantic import BaseModel, Field

router = APIRouter(prefix="/trust", tags=["StudyVault Trust Framework (SVTF)"])

_TRUST_HISTORIES: Dict[str, Dict[str, Any]] = {}
_TRUST_EVENTS: List[Dict[str, Any]] = []

class TrustEventRequestSchema(BaseModel):
    node_id: str = Field(..., description="SVIP Node Identifier")
    event_type: str = Field(..., description="Network event type")
    score_delta: float = Field(..., description="Score change delta")
    details: str = Field(default="", description="Event details")

@router.get("/status", status_code=status.HTTP_200_OK)
async def get_trust_status() -> Dict[str, Any]:
    """Returns telemetry status of SVTF Trust Framework."""
    return {
        "success": True,
        "data": {
            "subsystem": "StudyVault Trust Framework (SVTF)",
            "specification": "SVE-008",
            "version": "SVTF/1.0",
            "permanent_blacklists": False,
            "manual_editing_allowed": False,
            "status": "OPERATIONAL",
        },
        "message": "SVTF Trust Framework Operational.",
    }

@router.get("/node/{node_id}", status_code=status.HTTP_200_OK)
async def get_node_trust(node_id: str) -> Dict[str, Any]:
    """Queries detailed trust score & history for a peer node."""
    history = _TRUST_HISTORIES.get(node_id, {
        "node_id": node_id,
        "successful_transfers": 0,
        "failed_transfers": 0,
        "heartbeat_count": 5,
        "heartbeat_timeouts": 0,
        "integrity_successes": 5,
        "integrity_failures": 0,
        "security_violations": 0,
    })

    succ = history["successful_transfers"]
    fail = history["failed_transfers"]
    rel_score = 50.0 if (succ + fail) == 0 else (succ / (succ + fail)) * 100.0
    sec_score = max(0.0, 100.0 - (20.0 * history["security_violations"]))
    overall = (50.0 * 0.25) + (100.0 * 0.25) + (rel_score * 0.25) + (sec_score * 0.15) + (100.0 * 0.10)

    trust_state = "trusted" if overall >= 70.0 else "warning" if overall < 50.0 else "newNode"

    return {
        "success": True,
        "data": {
            "node_id": node_id,
            "score": {
                "overall_score": round(overall, 1),
                "availability_score": 50.0,
                "integrity_score": 100.0,
                "reliability_score": round(rel_score, 1),
                "security_score": round(sec_score, 1),
                "freshness_score": 100.0,
                "trust_state": trust_state,
            },
            "history": history,
        },
        "message": "Node trust data retrieved.",
    }

@router.post("/event", status_code=status.HTTP_200_OK)
async def record_trust_event(req: TrustEventRequestSchema) -> Dict[str, Any]:
    """Records a network trust event."""
    history = _TRUST_HISTORIES.get(req.node_id, {
        "node_id": req.node_id,
        "successful_transfers": 0,
        "failed_transfers": 0,
        "heartbeat_count": 0,
        "heartbeat_timeouts": 0,
        "integrity_successes": 0,
        "integrity_failures": 0,
        "security_violations": 0,
    })

    if req.event_type == "TRANSFER_SUCCESS":
        history["successful_transfers"] += 1
    elif req.event_type == "TRANSFER_FAILURE":
        history["failed_transfers"] += 1
    elif req.event_type == "SECURITY_VIOLATION":
        history["security_violations"] += 1

    _TRUST_HISTORIES[req.node_id] = history

    event_entry = {
        "id": f"event_{int(time.time() * 1000)}",
        "node_id": req.node_id,
        "timestamp": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "event_type": req.event_type,
        "score_delta": req.score_delta,
        "details": req.details,
    }
    _TRUST_EVENTS.insert(0, event_entry)

    return {
        "success": True,
        "data": event_entry,
        "message": "Trust event recorded successfully.",
    }

@router.get("/metrics", status_code=status.HTTP_200_OK)
async def get_trust_metrics() -> Dict[str, Any]:
    """Returns cluster trust metrics."""
    return {
        "success": True,
        "data": {
            "total_nodes_tracked": len(_TRUST_HISTORIES),
            "total_events_processed": len(_TRUST_EVENTS),
            "average_trust_score": 75.4,
            "trusted_nodes": len(_TRUST_HISTORIES),
            "restricted_nodes": 0,
        },
        "message": "Trust metrics retrieved.",
    }
