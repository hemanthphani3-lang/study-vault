import json
import os
import sys
from typing import List, Optional, Tuple
from app.core.exceptions import ResourceNotFoundException
from app.models.resource import Resource
from app.repositories.resource_repo import ResourceRepository
from app.schemas.resource import ResourceCreate, ResourceFilter, ResourceRead

root_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../../"))
if root_path not in sys.path:
    sys.path.insert(0, root_path)


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

        if total_count == 0 and filter_params.query and filter_params.query.strip():
            try:
                from services.resource_discovery.core.engine import DiscoveryEngine
                from services.resource_discovery.providers import (
                    ArxivProvider,
                    InternetArchiveProvider,
                    OpenLibraryProvider,
                    UniversityProvider,
                )
                engine = DiscoveryEngine()
                engine.register_provider(OpenLibraryProvider())
                engine.register_provider(InternetArchiveProvider())
                engine.register_provider(ArxivProvider())
                engine.register_provider(UniversityProvider())

                discovered = await engine.run_discovery(filter_params.query, limit_per_provider=5, publish_to_backend=False)
                for res in discovered:
                    payload_dict = res.to_backend_payload()
                    resource_instance = Resource(
                        id=payload_dict["id"],
                        title=payload_dict["title"],
                        subtitle=payload_dict.get("subtitle"),
                        abstract_text=payload_dict.get("abstract_text"),
                        authors_json=json.dumps(payload_dict.get("authors", [])),
                        resource_type=payload_dict.get("resource_type", "paper"),
                        category_id=payload_dict.get("category_id"),
                        language_code=payload_dict.get("language_code", "en"),
                        publication_year=payload_dict.get("publication_year"),
                        doi=payload_dict.get("doi"),
                        isbn=payload_dict.get("isbn"),
                        arxiv_id=payload_dict.get("arxiv_id"),
                        cid=payload_dict.get("cid"),
                        verification_tier=payload_dict.get("verification_tier", "community"),
                        is_peer_reviewed=payload_dict.get("is_peer_reviewed", False),
                        format=payload_dict.get("format", "pdf"),
                        size_bytes=payload_dict.get("size_bytes", 0),
                        page_count=payload_dict.get("page_count", 0),
                        peer_seeders=payload_dict.get("peer_seeders", 0),
                        availability_score=payload_dict.get("availability_score", 0.0),
                    )
                    await self.repo.create(resource_instance)

                items, total_count = await self.repo.filter_resources(filter_params)
            except Exception:
                pass


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
