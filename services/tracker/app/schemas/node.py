from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel, ConfigDict, Field


class NodeRegisterRequest(BaseModel):
    """Payload sent by nodes to register or re-register on tracker network."""
    node_id: str = Field(..., description="Unique client node ID")
    public_key: Optional[str] = Field(default=None, description="64-char hex Ed25519 public key")
    fingerprint: Optional[str] = Field(default=None, description="SHA-256 fingerprint")
    signature: Optional[str] = Field(default=None, description="Ed25519 digital signature of node_id:timestamp challenge")
    public_key_placeholder: Optional[str] = Field(default="ED25519_PLACEHOLDER_SPRINT_9", description="Future key exchange")
    platform: str = Field(default="flutter", description="Platform (flutter/web/desktop)")
    app_version: str = Field(default="0.10.0-alpha", description="App client version")
    country_code: str = Field(default="US", description="ISO 3166-1 alpha-2 country code")
    region: str = Field(default="global", description="Geographic region")
    capabilities: List[str] = Field(default_factory=lambda: ["metadata_relay", "search_index"])
    available_metadata_ids: List[str] = Field(default_factory=list, description="IDs of metadata records cached on node")
    network_address: str = Field(default="127.0.0.1:8000", description="Relay/P2P address")


class NodeResponse(BaseModel):
    id: str
    node_id: str
    public_key: str = "ED25519_PUBLIC_KEY_HEX"
    fingerprint: str = "SHA256:FINGERPRINT_HEX"
    platform: str
    app_version: str
    country_code: str
    region: str
    capabilities_json: str
    network_address: str
    is_online: bool
    last_heartbeat_at: datetime
    metadata_count: int
    trust_score_placeholder: float
    created_at: datetime
    expires_at: Optional[datetime] = None
    model_config = ConfigDict(from_attributes=True)


class NodeStatusResponse(BaseModel):
    node_id: str
    is_online: bool
    status: str # active, offline, expired
    last_heartbeat_at: datetime
    metadata_count: int
    country_code: str
    region: str
    trust_score: float
    model_config = ConfigDict(from_attributes=True)
