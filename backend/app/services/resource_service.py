from typing import List, Optional, Tuple
from app.core.exceptions import ResourceNotFoundException
from app.models.resource import Resource
from app.repositories.resource_repo import ResourceRepository
from app.schemas.resource import ResourceCreate, ResourceFilter, ResourceRead


class ResourceService:
    """Business logic coordinator for academic resource metadata."""

    def __init__(self, resource_repo: ResourceRepository):
        self.repo = resource_repo

    async def get_resource_by_id(self, resource_id: str) -> ResourceRead:
        resource = await self.repo.get_by_id(resource_id)
        if not resource:
            raise ResourceNotFoundException(resource_id)
        return ResourceRead.model_validate(resource)

    async def list_resources(self, filter_params: ResourceFilter) -> Tuple[List[ResourceRead], int]:
        items, total_count = await self.repo.filter_resources(filter_params)
        return [ResourceRead.model_validate(item) for item in items], total_count

    async def create_resource(self, payload: ResourceCreate) -> ResourceRead:
        instance = Resource(
            id=payload.id,
            title=payload.title,
            subtitle=payload.subtitle,
            abstract_text=payload.abstract_text,
            authors_json=payload.model_dump_json(include={"authors"}),
            resource_type=payload.resource_type,
            category_id=payload.category_id,
            language_code=payload.language_code,
            publication_year=payload.publication_year,
            doi=payload.doi,
            isbn=payload.isbn,
            arxiv_id=payload.arxiv_id,
            pubmed_id=payload.pubmed_id,
            cid=payload.cid,
            content_hash=payload.content_hash,
            verification_tier=payload.verification_tier,
            is_peer_reviewed=payload.is_peer_reviewed,
            format=payload.format,
            size_bytes=payload.size_bytes,
            page_count=payload.page_count,
            peer_seeders=payload.peer_seeders,
            availability_score=payload.availability_score,
        )
        created = await self.repo.create(instance)
        return ResourceRead.model_validate(created)
