from typing import List, Optional, Tuple
from sqlalchemy import func, or_, select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.resource import Resource
from app.repositories.base import BaseRepository
from app.schemas.resource import ResourceFilter


class ResourceRepository(BaseRepository[Resource]):
    """Repository handling academic resource queries, filtering, and indexing."""

    def __init__(self, db: AsyncSession):
        super().__init__(Resource, db)

    async def filter_resources(self, f: ResourceFilter) -> Tuple[List[Resource], int]:
        """Executes multi-field academic query with exact count calculation."""
        stmt = select(Resource).where(Resource.is_deleted == False)

        # 1. Full-text query token matching
        if f.query and f.query.strip():
            clean = f.query.strip().lower()
            tokens = clean.split()
            token_clauses = []
            for t in tokens:
                pattern = f"%{t}%"
                token_clauses.append(
                    or_(
                        func.lower(Resource.title).like(pattern),
                        func.lower(Resource.authors_json).like(pattern),
                        func.lower(Resource.abstract_text).like(pattern),
                        func.lower(Resource.doi).like(pattern),
                        func.lower(Resource.cid).like(pattern),
                    )
                )
            stmt = stmt.where(*token_clauses)

        # 2. Field Filters
        if f.category_id:
            stmt = stmt.where(Resource.category_id == f.category_id)
        if f.resource_type:
            stmt = stmt.where(Resource.resource_type == f.resource_type)
        if f.language_code:
            stmt = stmt.where(Resource.language_code == f.language_code)
        if f.verification_tier:
            stmt = stmt.where(Resource.verification_tier == f.verification_tier)
        if f.min_year:
            stmt = stmt.where(Resource.publication_year >= f.min_year)
        if f.max_year:
            stmt = stmt.where(Resource.publication_year <= f.max_year)
        if f.author:
            stmt = stmt.where(func.lower(Resource.authors_json).like(f"%{f.author.lower()}%"))

        # Compute total count
        count_stmt = select(func.count()).select_from(stmt.subquery())
        count_result = await self.db.execute(count_stmt)
        total_count = count_result.scalar_one_or_none() or 0

        # Pagination & Sorting (prioritize seeders and creation time)
        stmt = stmt.order_by(Resource.peer_seeders.desc(), Resource.created_at.desc())
        stmt = stmt.limit(f.limit).offset(f.offset)

        result = await self.db.execute(stmt)
        items = list(result.scalars().all())

        return items, total_count

    async def get_by_cid(self, cid: str) -> Optional[Resource]:
        stmt = select(Resource).where(Resource.cid == cid, Resource.is_deleted == False)
        res = await self.db.execute(stmt)
        return res.scalars().first()

    async def get_by_doi(self, doi: str) -> Optional[Resource]:
        stmt = select(Resource).where(Resource.doi == doi, Resource.is_deleted == False)
        res = await self.db.execute(stmt)
        return res.scalars().first()
