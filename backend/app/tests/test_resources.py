import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_list_resources(async_client: AsyncClient):
    response = await async_client.get("/api/v1/resources")
    assert response.status_code == 200
    data = response.json()
    assert "items" in data
    assert data["total_count"] == 2
    assert len(data["items"]) == 2


@pytest.mark.asyncio
async def test_filter_resources_by_query(async_client: AsyncClient):
    response = await async_client.get("/api/v1/resources?query=zkSNARK")
    assert response.status_code == 200
    data = response.json()
    assert data["total_count"] == 1
    assert "zkSNARK" in data["items"][0]["title"]


@pytest.mark.asyncio
async def test_get_resource_by_id_success(async_client: AsyncClient):
    response = await async_client.get("/api/v1/resources/res_001")
    assert response.status_code == 200
    payload = response.json()
    assert payload["success"] is True
    assert payload["data"]["id"] == "res_001"
    assert payload["data"]["doi"] == "10.1038/s41586-026-04289-w"


@pytest.mark.asyncio
async def test_get_resource_by_id_not_found(async_client: AsyncClient):
    response = await async_client.get("/api/v1/resources/non_existent_id")
    assert response.status_code == 404
    payload = response.json()
    assert payload["success"] is False
    assert payload["error"]["type"] == "ResourceNotFoundException"
