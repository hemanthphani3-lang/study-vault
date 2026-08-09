import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_list_categories(async_client: AsyncClient):
    response = await async_client.get("/api/v1/categories")
    assert response.status_code == 200
    payload = response.json()
    assert payload["success"] is True
    categories = payload["data"]
    assert len(categories) == 1
    assert categories[0]["slug"] == "computer-science"
