import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_backend_tracker_gateway_fallback(async_client: AsyncClient):
    """Verifies backend gateway returns graceful fallback when standalone tracker service is offline."""
    response = await async_client.post("/api/v1/tracker/register", json={
        "node_id": "test_gateway_node_1"
    })
    assert response.status_code == 201
    body = response.json()
    assert body["success"] is True
    assert "data" in body
    assert body["data"]["status"] == "tracker_offline_fallback"


@pytest.mark.asyncio
async def test_backend_tracker_gateway_discover_fallback(async_client: AsyncClient):
    response = await async_client.get("/api/v1/tracker/discover?metadata_id=test_meta_100")
    assert response.status_code == 200
    body = response.json()
    assert body["success"] is True
