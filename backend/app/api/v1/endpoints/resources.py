from typing import Optional
from fastapi import APIRouter, Depends, Query
from app.dependencies.database import get_resource_service
from app.schemas.common import BaseResponse, PaginatedResponse
from app.schemas.resource import ResourceCreate, ResourceFilter, ResourceRead
from app.services.resource_service import ResourceService

router = APIRouter()


@router.get("/resources", response_model=PaginatedResponse[ResourceRead], summary="Query and filter academic catalog")
async def list_resources(
    query: Optional[str] = Query(None, description="Search terms for title, author, abstract, DOI"),
    category_id: Optional[str] = Query(None, description="Category filter ID"),
    resource_type: Optional[str] = Query(None, description="paper, book, dataset, code, document"),
    author: Optional[str] = Query(None, description="Author substring match"),
    language_code: Optional[str] = Query(None, description="ISO-639-1 language"),
    min_year: Optional[int] = Query(None, ge=1800, le=2100),
    max_year: Optional[int] = Query(None, ge=1800, le=2100),
    verification_tier: Optional[str] = Query(None, description="verified, peerReviewed, community, unverified"),
    limit: int = Query(50, ge=1, le=100, description="Items per page"),
    offset: int = Query(0, ge=0, description="Pagination offset"),
    resource_service: ResourceService = Depends(get_resource_service),
) -> PaginatedResponse[ResourceRead]:
    """Retrieves paginated and filtered academic resource catalog metadata."""
    filter_params = ResourceFilter(
        query=query,
        category_id=category_id,
        resource_type=resource_type,
        author=author,
        language_code=language_code,
        min_year=min_year,
        max_year=max_year,
        verification_tier=verification_tier,
        limit=limit,
        offset=offset,
    )

    items, total_count = await resource_service.list_resources(filter_params)
    has_more = (offset + limit) < total_count

    return PaginatedResponse[ResourceRead](
        items=items,
        total_count=total_count,
        limit=limit,
        offset=offset,
        has_more=has_more,
    )


@router.get("/resources/{id}", response_model=BaseResponse[ResourceRead], summary="Fetch resource metadata by ID")
async def get_resource_by_id(
    id: str,
    resource_service: ResourceService = Depends(get_resource_service),
) -> BaseResponse[ResourceRead]:
    """Fetches complete academic metadata, citations, and CID hash for a given resource ID."""
    resource = await resource_service.get_resource_by_id(id)
    return BaseResponse[ResourceRead](data=resource)


@router.post("/resources", response_model=BaseResponse[ResourceRead], summary="Index a new academic resource")
async def create_resource(
    payload: ResourceCreate,
    resource_service: ResourceService = Depends(get_resource_service),
) -> BaseResponse[ResourceRead]:
    """Indexes a newly verified academic resource metadata into the central catalog."""
    created = await resource_service.create_resource(payload)
    return BaseResponse[ResourceRead](data=created, message="Resource metadata indexed successfully.")
