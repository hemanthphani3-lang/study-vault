from fastapi import Depends
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_async_session
from app.repositories.author_repo import AuthorRepository
from app.repositories.category_repo import CategoryRepository
from app.repositories.metadata_repo import LanguageRepository
from app.repositories.resource_repo import ResourceRepository
from app.services.health_service import HealthService
from app.services.metadata_service import MetadataService
from app.services.resource_service import ResourceService
from app.services.search_service import SearchService


async def get_db_session(session: AsyncSession = Depends(get_async_session)) -> AsyncSession:
    return session


def get_resource_service(db: AsyncSession = Depends(get_async_session)) -> ResourceService:
    repo = ResourceRepository(db)
    return ResourceService(repo)


def get_search_service(db: AsyncSession = Depends(get_async_session)) -> SearchService:
    repo = ResourceRepository(db)
    return SearchService(repo)


def get_metadata_service(db: AsyncSession = Depends(get_async_session)) -> MetadataService:
    cat_repo = CategoryRepository(db)
    auth_repo = AuthorRepository(db)
    lang_repo = LanguageRepository(db)
    return MetadataService(cat_repo, auth_repo, lang_repo)


def get_health_service(db: AsyncSession = Depends(get_async_session)) -> HealthService:
    return HealthService(db)
