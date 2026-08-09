from typing import Any, Dict, Optional
import httpx
from fastapi import APIRouter, HTTPException, Query, status

router = APIRouter(prefix="/tracker", tags=["Global Academic Tracker Gateway"])

TRACKER_BASE_URL = "http://127.0.0.1:8001/api/v1/tracker"


async def _proxy_tracker_request(method: str, path: str, json_body: Optional[Dict[str, Any]] = None, params: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
    url = f"{TRACKER_BASE_URL}{path}"
    try:
        async with httpx.AsyncClient(timeout=10.0) as client:
            response = await client.request(method, url, json=json_body, params=params)
            if response.status_code >= 400:
                raise HTTPException(status_code=response.status_code, detail=response.json())
            return response.json()
    except httpx.ConnectError:
        # Graceful fallback when standalone tracker service is not running locally
        return {
            "success": True,
            "data": {
                "status": "tracker_offline_fallback",
                "message": "Global Tracker Service (port 8001) is offline. Operating in local mode.",
            },
            "message": "Tracker gateway connection fallback.",
        }
    except HTTPException as he:
        raise he
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_502_BAD_GATEWAY, detail=f"Tracker service error: {str(e)}")


@router.post("/register", status_code=status.HTTP_201_CREATED, summary="Register peer node via Backend Gateway")
async def register_node(payload: Dict[str, Any]) -> Dict[str, Any]:
    return await _proxy_tracker_request("POST", "/register", json_body=payload)


@router.post("/heartbeat", summary="Submit node heartbeat via Backend Gateway")
async def submit_heartbeat(payload: Dict[str, Any]) -> Dict[str, Any]:
    return await _proxy_tracker_request("POST", "/heartbeat", json_body=payload)


@router.get("/discover", summary="Discover online peer seeders via Backend Gateway")
async def discover_peers(metadata_id: str = Query(...), limit: int = Query(50)) -> Dict[str, Any]:
    return await _proxy_tracker_request("GET", "/discover", params={"metadata_id": metadata_id, "limit": limit})


@router.post("/metadata", summary="Update node metadata availability via Backend Gateway")
async def update_metadata(payload: Dict[str, Any]) -> Dict[str, Any]:
    return await _proxy_tracker_request("POST", "/metadata", json_body=payload)


@router.get("/metadata/{metadata_id}", summary="Get metadata availability info via Backend Gateway")
async def get_metadata_info(metadata_id: str) -> Dict[str, Any]:
    return await _proxy_tracker_request("GET", f"/metadata/{metadata_id}")


@router.get("/status/{node_id}", summary="Get node status snapshot via Backend Gateway")
async def get_node_status(node_id: str) -> Dict[str, Any]:
    return await _proxy_tracker_request("GET", f"/status/{node_id}")


@router.get("/statistics", summary="Get global tracker statistics via Backend Gateway")
async def get_statistics() -> Dict[str, Any]:
    return await _proxy_tracker_request("GET", "/statistics")
