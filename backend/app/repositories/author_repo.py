from typing import List, Optional
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.author import Author
from app.repositories.base import BaseRepository


class AuthorRepository(BaseRepository[Author]):
    """Repository handling academic author and bibliometrics lookup."""

    def __init__(self, db: AsyncSession):
        super().__init__(Author, db)

    async def get_top_authors(self, limit: int = 50, offset: int = 0) -> List[Author]:
        stmt = (
            select(Author)
            .where(Author.is_deleted == False)
            .order_by(Author.publication_count.desc(), Author.h_index.desc())
            .limit(limit)
            .offset(offset)
        )
        result = await self.db.execute(stmt)
        return list(result.scalars().all())

    async def get_by_orcid(self, orcid: str) -> Optional[Author]:
        stmt = select(Author).where(Author.orcid == orcid, Author.is_deleted == False)
        result = await self.db.execute(stmt)
        return result.scalars().first()
