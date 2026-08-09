from typing import List, Tuple
from app.repositories.resource_repo import ResourceRepository
from app.schemas.resource import ResourceFilter, ResourceRead


class SearchService:
    """Preprocesses search terms, normalizes queries, and applies discovery rankings."""

    def __init__(self, resource_repo: ResourceRepository):
        self.repo = resource_repo

    async def execute_search(self, filter_params: ResourceFilter) -> Tuple[List[ResourceRead], int]:
        # Normalize search query
        if filter_params.query:
            filter_params.query = filter_params.query.strip()
        items, count = await self.repo.filter_resources(filter_params)
        return [ResourceRead.model_validate(item) for item in items], count
