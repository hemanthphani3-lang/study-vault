import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_discovery_search_endpoint(async_client: AsyncClient):
    response = await async_client.get("/api/v1/discovery/search?q=quantum")
    assert response.status_code == 200
    body = response.json()
    assert body["success"] is True
    assert body["data"]["query"] == "quantum"
    assert "seeders_available" in body["data"]


@pytest.mark.asyncio
async def test_discovery_peers_endpoint(async_client: AsyncClient):
    response = await async_client.get("/api/v1/discovery/peers?metadata_id=res_001&country_code=US")
    assert response.status_code == 200
    body = response.json()
    assert body["success"] is True
    assert "peers" in body["data"]


@pytest.mark.asyncio
async def test_discovery_status_endpoint(async_client: AsyncClient):
    response = await async_client.get("/api/v1/discovery/status")
    assert response.status_code == 200
    body = response.json()
    assert body["success"] is True
