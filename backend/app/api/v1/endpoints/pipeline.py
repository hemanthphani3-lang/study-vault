"""
Pipeline API endpoints for the auto-retrieval search system.

POST /api/v1/pipeline/search   → Start pipeline, return job_id + initial status
GET  /api/v1/pipeline/status/{job_id} → Poll job status + results when ready
GET  /api/v1/pipeline/vault/stats     → Local vault statistics
"""
from fastapi import APIRouter, HTTPException, Query
from pydantic import BaseModel
from typing import Any, Dict, List, Optional

from app.services.pipeline_service import (
    start_pipeline, get_job,
    STATE_COMPLETE, STATE_ERROR, STATE_FOUND_LOCAL,
)
from app.services.vector_store import VectorStore

router = APIRouter(prefix="/pipeline", tags=["Pipeline"])


# ─── Request / Response Schemas ──────────────────────────────────────────────

class PipelineSearchRequest(BaseModel):
    query: str
    limit: int = 20


class PipelineStatusResponse(BaseModel):
    job_id: str
    state: str
    message: str
    is_done: bool
    results: List[Dict[str, Any]]
    providers_searched: List[str]
    docs_indexed: int
    error: Optional[str] = None


# ─── Endpoints ────────────────────────────────────────────────────────────────

@router.post("/search", summary="Start auto-retrieval pipeline search")
async def pipeline_search(body: PipelineSearchRequest):
    """
    Starts the full pipeline for a query.
    Returns immediately with a job_id.
    Client should poll /pipeline/status/{job_id} for updates.
    """
    query = (body.query or "").strip()
    if not query:
        raise HTTPException(status_code=422, detail="Query cannot be empty")

    job = await start_pipeline(query)
    return {
        "job_id": job.job_id,
        "state": job.state,
        "message": job.message,
        "is_done": job.state in (STATE_COMPLETE, STATE_ERROR, STATE_FOUND_LOCAL),
        "results": job.results,
        "providers_searched": job.providers_searched,
        "docs_indexed": job.docs_indexed,
        "error": job.error,
    }


@router.get("/status/{job_id}", response_model=PipelineStatusResponse, summary="Poll pipeline job status")
async def pipeline_status(job_id: str):
    """
    Poll the status of a running or completed pipeline job.
    When state is 'complete' or 'found_local', results[] is populated.
    """
    job = get_job(job_id)
    if not job:
        raise HTTPException(status_code=404, detail=f"Job '{job_id}' not found")

    return PipelineStatusResponse(
        job_id=job.job_id,
        state=job.state,
        message=job.message,
        is_done=job.state in (STATE_COMPLETE, STATE_ERROR, STATE_FOUND_LOCAL),
        results=job.results,
        providers_searched=job.providers_searched,
        docs_indexed=job.docs_indexed,
        error=job.error,
    )


@router.get("/vault/stats", summary="Local vault statistics")
async def vault_stats():
    """Returns count of locally indexed documents and chunks."""
    try:
        store = VectorStore.get_instance()
        return {
            "total_chunks": store.total_chunks(),
            "total_documents": store.total_documents(),
            "status": "healthy",
        }
    except Exception as e:
        return {"total_chunks": 0, "total_documents": 0, "status": f"error: {e}"}
