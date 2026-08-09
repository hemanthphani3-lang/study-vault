"""
Auto-Retrieval Pipeline Service — StudyVault's core intelligence engine.

Workflow per search query:
  1. Semantic search in ChromaDB (local vault)
     → Found: return immediately with source="vault"
  2. Parallel internet retrieval (9 providers)
  3. Async PDF download queue (concurrent, with fallback to abstract)
  4. Text extraction (PDF → pdfplumber, HTML → html2text, fallback → abstract)
  5. Semantic chunking (750 words, 20% overlap)
  6. Embedding generation (all-MiniLM-L6-v2)
  7. ChromaDB upsert (DOI/arxiv_id/checksum dedup — never duplicate)
  8. Re-run semantic search → return enriched results

Pipeline jobs are tracked in-memory by UUID and polled by the Flutter client.
"""
import asyncio
import logging
import uuid
from dataclasses import dataclass, field
from datetime import datetime
from typing import Any, Dict, List, Optional

from app.services.document_processor import get_document_processor
from app.services.download_manager import download_pdfs_concurrent, get_arxiv_pdf_url
from app.services.embedding_service import get_embedding_service
from app.services.vector_store import VectorStore

logger = logging.getLogger("studyvault.pipeline")

# ─── Job States ───────────────────────────────────────────────────────────────
STATE_LOCAL_SEARCH    = "local_search"
STATE_FOUND_LOCAL     = "found_local"
STATE_INTERNET_SEARCH = "internet_search"
STATE_DOWNLOADING     = "downloading"
STATE_INDEXING        = "indexing"
STATE_COMPLETE        = "complete"
STATE_ERROR           = "error"

STATE_MESSAGES = {
    STATE_LOCAL_SEARCH:    "Checking your local vault...",
    STATE_FOUND_LOCAL:     "Found in Local Vault",
    STATE_INTERNET_SEARCH: "Searching trusted academic repositories...",
    STATE_DOWNLOADING:     "Downloading academic resources...",
    STATE_INDEXING:        "Preparing documents for offline access...",
    STATE_COMPLETE:        "Added to your Local Vault",
    STATE_ERROR:           "Search encountered an error — showing partial results.",
}

_MIN_LOCAL_RESULTS = 1       # Minimum local hits before we skip internet
_MAX_INTERNET_RESULTS = 60   # Total cap across all providers
_SIMILARITY_THRESHOLD = 0.35  # Cosine distance threshold (1 - cos_sim ≤ this)


# ─── Data Classes ─────────────────────────────────────────────────────────────

@dataclass
class PipelineResult:
    id: str
    title: str
    authors: List[str]
    abstract: str
    source: str       # "vault" | "openalex" | "arxiv" | etc.
    source_label: str # "Local Vault" | "OpenAlex" | etc.
    doi: Optional[str]
    year: Optional[int]
    pdf_url: Optional[str]
    score: float
    citations: int = 0
    is_peer_reviewed: bool = True
    tags: List[str] = field(default_factory=list)


@dataclass
class PipelineJob:
    job_id: str
    query: str
    state: str = STATE_LOCAL_SEARCH
    message: str = ""
    results: List[Dict] = field(default_factory=list)
    error: Optional[str] = None
    created_at: str = field(default_factory=lambda: datetime.utcnow().isoformat())
    completed_at: Optional[str] = None
    providers_searched: List[str] = field(default_factory=list)
    docs_indexed: int = 0


# ─── In-Memory Job Store ──────────────────────────────────────────────────────

_jobs: Dict[str, PipelineJob] = {}


def get_job(job_id: str) -> Optional[PipelineJob]:
    return _jobs.get(job_id)


def _set_state(job: PipelineJob, state: str, error: str = "") -> None:
    job.state = state
    job.message = STATE_MESSAGES.get(state, state)
    if error:
        job.error = error
    logger.info(f"[Pipeline][{job.job_id[:8]}] {state}: {job.message}")


# ─── Provider Factory ─────────────────────────────────────────────────────────

def _get_all_providers():
    """Instantiate all 9 academic providers."""
    from services.resource_discovery.providers import (
        ArxivProvider, OpenAlexProvider, CrossrefProvider,
        SemanticScholarProvider, CoreProvider, DoajProvider, PubMedProvider,
        OpenLibraryProvider, InternetArchiveProvider,
    )
    return [
        OpenAlexProvider(),
        ArxivProvider(),
        SemanticScholarProvider(),
        CrossrefProvider(),
        CoreProvider(),
        DoajProvider(),
        PubMedProvider(),
        OpenLibraryProvider(),
        InternetArchiveProvider(),
    ]


# ─── Pipeline Entry Point ─────────────────────────────────────────────────────

async def start_pipeline(query: str) -> PipelineJob:
    """Create a job and launch the pipeline in the background."""
    job_id = str(uuid.uuid4())
    job = PipelineJob(job_id=job_id, query=query)
    _jobs[job_id] = job

    # Fire and forget — client polls /status/{job_id}
    asyncio.create_task(_run_pipeline(job))
    return job


# ─── Pipeline Steps ───────────────────────────────────────────────────────────

async def _run_pipeline(job: PipelineJob) -> None:
    """Full pipeline execution for one query."""
    try:
        query = job.query

        # ── Step 1: Local semantic search ─────────────────────────────────────
        _set_state(job, STATE_LOCAL_SEARCH)
        local_results = await _search_local(query)

        if local_results:
            _set_state(job, STATE_FOUND_LOCAL)
            job.results = local_results
            job.completed_at = datetime.utcnow().isoformat()
            return

        # ── Step 2: Internet retrieval ────────────────────────────────────────
        _set_state(job, STATE_INTERNET_SEARCH)
        discovered = await _search_internet(query, job)
        if not discovered:
            _set_state(job, STATE_ERROR, "No results from any academic source.")
            job.completed_at = datetime.utcnow().isoformat()
            return

        # ── Step 3: Download PDFs ─────────────────────────────────────────────
        _set_state(job, STATE_DOWNLOADING)
        pdf_contents = await _download_pdfs(discovered)

        # ── Step 4+5+6+7: Extract → Chunk → Embed → Store ────────────────────
        _set_state(job, STATE_INDEXING)
        indexed_count = await _index_documents(discovered, pdf_contents)
        job.docs_indexed = indexed_count

        # ── Step 8: Re-run local search ───────────────────────────────────────
        final_results = await _search_local(query)
        if not final_results:
            # Fallback: build results directly from discovered metadata
            final_results = _build_results_from_discovered(discovered)

        _set_state(job, STATE_COMPLETE)
        job.results = final_results
        job.completed_at = datetime.utcnow().isoformat()

    except Exception as e:
        logger.error(f"[Pipeline][{job.job_id[:8]}] Fatal error: {e}", exc_info=True)
        _set_state(job, STATE_ERROR, str(e))
        job.completed_at = datetime.utcnow().isoformat()


async def _search_local(query: str) -> List[Dict]:
    """Search ChromaDB with semantic embedding of the query."""
    try:
        embedding_svc = get_embedding_service()
        query_vec = embedding_svc.embed_text(query)

        store = VectorStore.get_instance()
        if store.total_chunks() == 0:
            return []

        raw_results = store.search(query_vec, n_results=20)

        # Deduplicate by doc_id, keep highest score per document
        seen_docs: Dict[str, Dict] = {}
        for r in raw_results:
            if r["distance"] > _SIMILARITY_THRESHOLD:
                continue
            meta = r["metadata"]
            doc_id = meta.get("doc_id", r["chunk_id"])
            if doc_id not in seen_docs or r["score"] > seen_docs[doc_id]["score"]:
                seen_docs[doc_id] = {
                    "id": doc_id,
                    "title": meta.get("title", "Untitled"),
                    "authors": _parse_list(meta.get("authors", "")),
                    "abstract": meta.get("abstract", r["text"][:300]),
                    "source": meta.get("provider", "vault"),
                    "source_label": _source_label(meta.get("provider", "vault")),
                    "doi": meta.get("doi"),
                    "year": meta.get("year"),
                    "pdf_url": meta.get("pdf_url"),
                    "score": r["score"],
                    "citations": int(meta.get("citations", 0)),
                    "is_peer_reviewed": meta.get("is_peer_reviewed", True),
                    "tags": _parse_list(meta.get("tags", "")),
                    "in_vault": True,
                }

        # Sort by score descending
        results = sorted(seen_docs.values(), key=lambda x: x["score"], reverse=True)
        return results[:20]

    except Exception as e:
        logger.error(f"Local search error: {e}")
        return []


async def _search_internet(query: str, job: PipelineJob) -> List[Any]:
    """Run all providers in parallel, merge + deduplicate results."""
    providers = _get_all_providers()

    async def _safe_discover(provider):
        try:
            results = await asyncio.wait_for(provider.discover(query, limit=15), timeout=12.0)
            job.providers_searched.append(provider.provider_name)
            return results
        except asyncio.TimeoutError:
            logger.warning(f"Provider {provider.provider_name} timed out")
            return []
        except Exception as e:
            logger.warning(f"Provider {provider.provider_name} error: {e}")
            return []

    all_results_nested = await asyncio.gather(*[_safe_discover(p) for p in providers])

    # Flatten
    all_results = []
    for batch in all_results_nested:
        all_results.extend(batch)

    # Deduplicate by DOI then arxiv_id then title similarity
    seen_dois: set = set()
    seen_titles: set = set()
    unique: list = []
    for r in all_results:
        doi = getattr(r, "doi", None)
        arxiv_id = getattr(r, "arxiv_id", None)
        title_key = (getattr(r, "title", "") or "").lower().strip()[:80]

        dedup_key = doi or arxiv_id or title_key
        if dedup_key and dedup_key in seen_dois:
            continue
        if title_key and title_key in seen_titles:
            continue
        if dedup_key:
            seen_dois.add(dedup_key)
        if title_key:
            seen_titles.add(title_key)
        unique.append(r)

    logger.info(f"Internet search: {len(all_results)} total, {len(unique)} unique from {len(job.providers_searched)} providers")
    return unique[:_MAX_INTERNET_RESULTS]


async def _download_pdfs(discovered: List[Any]) -> Dict[str, Optional[bytes]]:
    """Build PDF URL map and download concurrently."""
    url_map: Dict[str, str] = {}

    for item in discovered:
        # Try raw_metadata pdf_url first, then construct arxiv PDF URL
        pdf_url = (getattr(item, "raw_metadata", {}) or {}).get("pdf_url", "")
        arxiv_id = getattr(item, "arxiv_id", None)
        if not pdf_url and arxiv_id:
            pdf_url = get_arxiv_pdf_url(arxiv_id)

        if pdf_url:
            doc_id = VectorStore.make_doc_id(
                doi=getattr(item, "doi", None),
                arxiv_id=arxiv_id,
                source_url=getattr(item, "source_url", "") or "",
            )
            url_map[doc_id] = pdf_url

    if not url_map:
        return {}

    logger.info(f"Downloading {len(url_map)} PDFs...")
    download_results = await download_pdfs_concurrent(url_map, max_concurrent=4)

    # Return doc_id -> pdf_bytes mapping
    return {
        doc_id: r.content
        for doc_id, r in download_results.items()
        if r.success and r.content
    }


async def _index_documents(discovered: List[Any], pdf_map: Dict[str, Optional[bytes]]) -> int:
    """Extract text, chunk, embed, and store all discovered resources."""
    embedding_svc = get_embedding_service()
    doc_processor = get_document_processor()
    vector_store = VectorStore.get_instance()

    indexed = 0

    # Process in small batches to avoid memory spikes
    BATCH_SIZE = 10
    for i in range(0, len(discovered), BATCH_SIZE):
        batch = discovered[i:i + BATCH_SIZE]
        await asyncio.sleep(0)  # Yield to event loop

        for item in batch:
            try:
                doi = getattr(item, "doi", None)
                arxiv_id = getattr(item, "arxiv_id", None)
                source_url = getattr(item, "source_url", "") or ""
                title = getattr(item, "title", "") or "Untitled"
                abstract = getattr(item, "abstract_text", "") or ""
                authors = getattr(item, "authors", []) or []
                year = getattr(item, "publication_year", None)
                provider = getattr(item, "source_url", "").split("/")[2] if source_url else "unknown"
                tags = getattr(item, "tags", []) or []
                raw_meta = getattr(item, "raw_metadata", {}) or {}
                pdf_url = raw_meta.get("pdf_url", "")
                citations = int(raw_meta.get("citations", 0) or 0)

                doc_id = VectorStore.make_doc_id(doi=doi, arxiv_id=arxiv_id, source_url=source_url)

                # Skip if already indexed
                if vector_store.document_exists(doc_id):
                    continue

                # Get full text if PDF was downloaded
                full_text: Optional[str] = None
                if doc_id in pdf_map and pdf_map[doc_id]:
                    full_text = doc_processor.extract_from_pdf_bytes(pdf_map[doc_id])

                # Compose index text
                index_text = doc_processor.build_index_text(title, abstract, full_text)

                # Chunk
                chunks = doc_processor.chunk_text(index_text)
                if not chunks:
                    continue

                # Build shared metadata for all chunks
                base_meta = {
                    "doc_id": doc_id,
                    "title": title,
                    "authors": "|".join(authors[:5]),
                    "abstract": abstract[:500],
                    "doi": doi or "",
                    "arxiv_id": arxiv_id or "",
                    "year": str(year) if year else "",
                    "provider": _infer_provider(source_url, doi, arxiv_id),
                    "pdf_url": pdf_url or "",
                    "citations": str(citations),
                    "tags": "|".join(tags[:10]),
                    "is_peer_reviewed": str(True),
                    "source_url": source_url[:200],
                }

                # Embed all chunks in one batch pass
                chunk_texts = [c.text for c in chunks]
                embeddings = embedding_svc.embed_batch(chunk_texts)

                chunk_ids = [VectorStore.make_chunk_id(doc_id, c.index) for c in chunks]
                metadatas = [{**base_meta, "chunk_index": str(c.index)} for c in chunks]

                vector_store.upsert_chunks_batch(chunk_ids, embeddings, chunk_texts, metadatas)
                indexed += 1

            except Exception as e:
                logger.warning(f"Failed to index document: {e}")
                continue

    logger.info(f"Indexed {indexed} new documents into ChromaDB")
    return indexed


# ─── Helpers ──────────────────────────────────────────────────────────────────

def _build_results_from_discovered(discovered: List[Any]) -> List[Dict]:
    """Fallback: build result dicts directly from provider data (no vector search)."""
    results = []
    for item in discovered[:20]:
        raw_meta = getattr(item, "raw_metadata", {}) or {}
        results.append({
            "id": VectorStore.make_doc_id(
                doi=getattr(item, "doi", None),
                arxiv_id=getattr(item, "arxiv_id", None),
                source_url=getattr(item, "source_url", "") or "",
            ),
            "title": getattr(item, "title", "Untitled"),
            "authors": getattr(item, "authors", []),
            "abstract": getattr(item, "abstract_text", ""),
            "source": _infer_provider(getattr(item, "source_url", ""), getattr(item, "doi", None), getattr(item, "arxiv_id", None)),
            "source_label": _source_label(_infer_provider(getattr(item, "source_url", ""), getattr(item, "doi", None), getattr(item, "arxiv_id", None))),
            "doi": getattr(item, "doi", None),
            "year": getattr(item, "publication_year", None),
            "pdf_url": raw_meta.get("pdf_url", ""),
            "score": 0.8,
            "citations": int(raw_meta.get("citations", 0) or 0),
            "is_peer_reviewed": True,
            "tags": getattr(item, "tags", []),
            "in_vault": False,
        })
    return results


def _infer_provider(source_url: str, doi: Optional[str], arxiv_id: Optional[str]) -> str:
    if arxiv_id:
        return "arxiv"
    if not source_url:
        return "crossref" if doi else "unknown"
    url = source_url.lower()
    if "openalex" in url:
        return "openalex"
    if "arxiv" in url:
        return "arxiv"
    if "semanticscholar" in url:
        return "semantic_scholar"
    if "core.ac.uk" in url:
        return "core"
    if "doaj" in url:
        return "doaj"
    if "pubmed" in url or "ncbi" in url:
        return "pubmed"
    if "doi.org" in url:
        return "crossref"
    return "internet"


_SOURCE_LABELS = {
    "openalex": "OpenAlex",
    "arxiv": "arXiv",
    "semantic_scholar": "Semantic Scholar",
    "crossref": "Crossref",
    "core": "CORE",
    "doaj": "DOAJ",
    "pubmed": "PubMed",
    "vault": "Local Vault",
    "internet": "Web",
}


def _source_label(source: str) -> str:
    return _SOURCE_LABELS.get(source, source.replace("_", " ").title())


def _parse_list(val: str) -> List[str]:
    if not val:
        return []
    return [v.strip() for v in val.split("|") if v.strip()]
