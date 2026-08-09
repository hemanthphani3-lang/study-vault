from typing import List, Optional
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.language import Language
from app.models.publisher import Publisher
from app.repositories.base import BaseRepository


class LanguageRepository(BaseRepository[Language]):
    """Repository handling language catalogs."""

    def __init__(self, db: AsyncSession):
        super().__init__(Language, db)

    async def get_all_languages(self) -> List[Language]:
        stmt = select(Language).order_by(Language.name.asc())
        result = await self.db.execute(stmt)
        return list(result.scalars().all())


class PublisherRepository(BaseRepository[Publisher]):
    """Repository handling publisher records."""

    def __init__(self, db: AsyncSession):
        super().__init__(Publisher, db)

    async def get_by_doi_prefix(self, prefix: str) -> Optional[Publisher]:
        stmt = select(Publisher).where(Publisher.doi_prefix == prefix)
        result = await self.db.execute(stmt)
        return result.scalars().first()
