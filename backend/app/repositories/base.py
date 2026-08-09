from typing import Any, Generic, List, Optional, Type, TypeVar
from sqlalchemy import select, update
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.base import Base

ModelType = TypeVar("ModelType", bound=Base)


class BaseRepository(Generic[ModelType]):
    """Generic repository providing core CRUD operations."""

    def __init__(self, model: Type[ModelType], db: AsyncSession):
        self.model = model
        self.db = db

    async def get_by_id(self, id: Any) -> Optional[ModelType]:
        result = await self.db.execute(
            select(self.model).where(self.model.id == id, getattr(self.model, "is_deleted", False) == False)
        )
        return result.scalars().first()

    async def get_all(self, limit: int = 50, offset: int = 0) -> List[ModelType]:
        stmt = select(self.model).limit(limit).offset(offset)
        if hasattr(self.model, "is_deleted"):
            stmt = stmt.where(self.model.is_deleted == False)
        result = await self.db.execute(stmt)
        return list(result.scalars().all())

    async def create(self, instance: ModelType) -> ModelType:
        self.db.add(instance)
        await self.db.flush()
        await self.db.refresh(instance)
        return instance

    async def soft_delete(self, id: Any) -> bool:
        if hasattr(self.model, "is_deleted"):
            await self.db.execute(
                update(self.model).where(self.model.id == id).values(is_deleted=True)
            )
            await self.db.flush()
            return True
        return False
