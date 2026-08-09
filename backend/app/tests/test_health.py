import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_health_endpoint(async_client: AsyncClient):
    response = await async_client.get("/api/v1/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "healthy"
    assert data["database_connected"] is True
    assert "version" in data


@pytest.mark.asyncio
async def test_version_endpoint(async_client: AsyncClient):
    response = await async_client.get("/api/v1/version")
    assert response.status_code == 200
    data = response.json()
    assert data["version"] == "0.6.0-alpha"
    assert data["min_client_version"] == "0.1.0"
