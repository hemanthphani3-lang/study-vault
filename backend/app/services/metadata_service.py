from typing import List
from app.repositories.author_repo import AuthorRepository
from app.repositories.category_repo import CategoryRepository
from app.repositories.metadata_repo import LanguageRepository
from app.schemas.author import AuthorRead
from app.schemas.category import CategoryRead
from app.schemas.language import LanguageRead


class MetadataService:
    """Provides taxonomy categories, author records, and language dictionaries."""

    def __init__(
        self,
        category_repo: CategoryRepository,
        author_repo: AuthorRepository,
        language_repo: LanguageRepository,
    ):
        self.category_repo = category_repo
        self.author_repo = author_repo
        self.language_repo = language_repo

    async def get_categories(self) -> List[CategoryRead]:
        items = await self.category_repo.get_all_ordered()
        return [CategoryRead.model_validate(c) for c in items]

    async def get_authors(self, limit: int = 50, offset: int = 0) -> List[AuthorRead]:
        items = await self.author_repo.get_top_authors(limit=limit, offset=offset)
        return [AuthorRead.model_validate(a) for a in items]

    async def get_languages(self) -> List[LanguageRead]:
        items = await self.language_repo.get_all_languages()
        return [LanguageRead.model_validate(l) for l in items]
