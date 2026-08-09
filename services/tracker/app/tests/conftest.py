import os
import sys
from typing import AsyncGenerator

# Ensure tracker root directory (services/tracker) is on Python path
TRACKER_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
if TRACKER_ROOT not in sys.path:
    sys.path.insert(0, TRACKER_ROOT)

import pytest
import pytest_asyncio
from httpx import ASGITransport, AsyncClient
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine, async_sessionmaker
from app.database.base import Base
from app.database.session import get_async_session
from main import app

TEST_DATABASE_URL = "sqlite+aiosqlite:///:memory:"

test_engine = create_async_engine(TEST_DATABASE_URL, echo=False)
TestingSessionLocal = async_sessionmaker(
    bind=test_engine,
    class_=AsyncSession,
    expire_on_commit=False,
)


@pytest_asyncio.fixture(scope="function")
async def tracker_db() -> AsyncGenerator[AsyncSession, None]:
    async with test_engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    async with TestingSessionLocal() as session:
        yield session

    async with test_engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)


@pytest_asyncio.fixture(scope="function")
async def tracker_client(tracker_db: AsyncSession) -> AsyncGenerator[AsyncClient, None]:
    async def _override_get_db():
        yield tracker_db

    app.dependency_overrides[get_async_session] = _override_get_db

    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://testtracker") as client:
        yield client

    app.dependency_overrides.clear()
