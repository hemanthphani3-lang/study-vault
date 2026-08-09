from typing import List, Optional
from pydantic import BaseModel, ConfigDict, Field


class MetadataUpdateRequest(BaseModel):
    node_id: str = Field(..., description="Node updating metadata availability")
    metadata_ids_to_add: List[str] = Field(default_factory=list)
    metadata_ids_to_remove: List[str] = Field(default_factory=list)


class MetadataResponse(BaseModel):
    node_id: str
    total_metadata_registered: int
    added_count: int
    removed_count: int
    model_config = ConfigDict(from_attributes=True)


class MetadataAvailabilityInfo(BaseModel):
    metadata_id: str
    total_nodes_available: int
    online_nodes_count: int
    available_node_ids: List[str]
    model_config = ConfigDict(from_attributes=True)
