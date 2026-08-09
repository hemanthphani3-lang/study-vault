import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_validation_error_handler(async_client: AsyncClient):
    response = await async_client.get("/api/v1/resources?limit=-5")
    assert response.status_code == 422
    payload = response.json()
    assert payload["success"] is False
    assert payload["error"]["type"] == "RequestValidationError"
