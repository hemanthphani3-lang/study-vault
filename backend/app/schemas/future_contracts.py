from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel, Field


class ScraperJob(BaseModel):
    """Payload contract for future academic scraper tasks."""
    job_id: str = Field(..., description="Unique job execution ID")
    target_source: str = Field(..., description="arXiv, PubMed, BioRxiv, OpenAlex")
    query_terms: List[str] = Field(default_factory=list)
    max_items_to_crawl: int = 50
    dry_run: bool = False


class TrackerAnnounce(BaseModel):
    """Swarm telemetry contract for peer seeding and leeching."""
    resource_cid: str
    peer_id: str
    port: int = 4001
    uploaded_bytes: int = 0
    downloaded_bytes: int = 0
    left_bytes: int = 0
    event: str = "started"  # started, stopped, completed, interval


class NodeHeartbeat(BaseModel):
    """Heartbeat signal sent by academic peer nodes."""
    peer_id: str
    public_key: str
    version: str
    connected_peers_count: int
    relayed_bytes: int
