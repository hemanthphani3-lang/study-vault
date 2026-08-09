import pytest
from services.resource_discovery.providers.university_provider import UniversityProvider


@pytest.mark.asyncio
async def test_university_provider_discover():
    provider = UniversityProvider()
    results = await provider.discover("machine learning", limit=5)
    assert len(results) > 0
    item = results[0]
    assert "MIT OpenCourseWare" in item.title
    assert item.resource_type == "document"
    assert item.source_url.startswith("https://")
