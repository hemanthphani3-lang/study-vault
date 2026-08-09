import asyncio
import json
import os
import sys
from typing import AsyncGenerator

# Ensure backend root directory is on Python path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

import pytest
import pytest_asyncio
from httpx import ASGITransport, AsyncClient
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine, async_sessionmaker
from app.core.config import settings
from app.database.base import Base
from app.database.session import get_async_session
from app.main import app
from app.models.author import Author
from app.models.category import Category
from app.models.language import Language
from app.models.resource import Resource

TEST_DATABASE_URL = "sqlite+aiosqlite:///:memory:"

test_engine = create_async_engine(TEST_DATABASE_URL, echo=False)
TestingSessionLocal = async_sessionmaker(
    bind=test_engine,
    class_=AsyncSession,
    expire_on_commit=False,
)


@pytest_asyncio.fixture(scope="function")
async def db_session() -> AsyncGenerator[AsyncSession, None]:
    async with test_engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    async with TestingSessionLocal() as session:
        cat = Category(id="cat_cs", slug="computer-science", name="Computer Science", display_order=1)
        lang = Language(code="en", name="English", native_name="English")
        author = Author(id="auth_1", name="Dr. Elena Vance", institution="ETH Zurich", publication_count=12, h_index=8)
        
        res1 = Resource(
            id="res_001",
            title="Decentralized zkSNARK Systems for Academic Verification",
            authors_json=json.dumps(["Dr. Elena Vance", "Prof. Marcus Chen"]),
            resource_type="paper",
            category_id="cat_cs",
            language_code="en",
            publication_year=2026,
            doi="10.1038/s41586-026-04289-w",
            cid="bafybeicg24pknox2zox7e22f254e2q3w5i6k7a8b9c0d1e2f3g4h5i6j7k",
            verification_tier="verified",
            peer_seeders=142,
        )
        
        res2 = Resource(
            id="res_002",
            title="Transformer Architecture Memory Footprint Benchmarks",
            authors_json=json.dumps(["AI Research Collective"]),
            resource_type="dataset",
            category_id="cat_cs",
            language_code="en",
            publication_year=2025,
            cid="bafybeitransformerbench334a",
            verification_tier="peerReviewed",
            peer_seeders=89,
        )

        session.add_all([cat, lang, author, res1, res2])
        await session.commit()

        yield session

    async with test_engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)


@pytest_asyncio.fixture(scope="function")
async def async_client(db_session: AsyncSession) -> AsyncGenerator[AsyncClient, None]:
    async def _override_get_db():
        yield db_session

    app.dependency_overrides[get_async_session] = _override_get_db
    
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://testserver") as client:
        yield client
        
    app.dependency_overrides.clear()
