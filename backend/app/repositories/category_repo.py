from typing import List, Optional
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.category import Category
from app.repositories.base import BaseRepository


class CategoryRepository(BaseRepository[Category]):
    """Repository handling academic category hierarchies."""

    def __init__(self, db: AsyncSession):
        super().__init__(Category, db)

    async def get_all_ordered(self) -> List[Category]:
        stmt = (
            select(Category)
            .where(Category.is_deleted == False)
            .order_by(Category.display_order.asc(), Category.name.asc())
        )
        result = await self.db.execute(stmt)
        return list(result.scalars().all())

    async def get_by_slug(self, slug: str) -> Optional[Category]:
        stmt = select(Category).where(Category.slug == slug, Category.is_deleted == False)
        result = await self.db.execute(stmt)
        return result.scalars().first()
