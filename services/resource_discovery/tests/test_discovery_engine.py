import pytest
from services.resource_discovery.core.engine import DiscoveryEngine
from services.resource_discovery.providers.university_provider import UniversityProvider


@pytest.mark.asyncio
async def test_discovery_engine_pipeline():
    engine = DiscoveryEngine()
    engine.register_provider(UniversityProvider())

    discovered = await engine.run_discovery("quantum computing", limit_per_provider=2, publish_to_backend=False)
    assert len(discovered) > 0
    item = discovered[0]
    assert "MIT OpenCourseWare" in item.title
    assert item.confidence_score >= 0.60
    assert engine.cache.size() == 1
