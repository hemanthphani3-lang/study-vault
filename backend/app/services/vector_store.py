"""
ChromaDB-backed persistent vector store for Study Vault.

Provides semantic search over academic resource chunks using cosine similarity.
Each chunk is stored with full metadata for result reconstruction.
Duplicate detection uses DOI > arxiv_id > checksum > source_url priority chain.
"""
import hashlib
import os
from typing import Any, Dict, List, Optional

import chromadb
from chromadb.config import Settings


class VectorStore:
    """Persistent ChromaDB collection for semantic academic search."""

    _instance: Optional["VectorStore"] = None

    def __init__(self, persist_directory: str = "./chroma_db"):
        self._client = chromadb.PersistentClient(
            path=persist_directory,
            settings=Settings(anonymized_telemetry=False),
        )
        self._collection = self._client.get_or_create_collection(
            name="academic_chunks",
            metadata={"hnsw:space": "cosine"},
        )

    @classmethod
    def get_instance(cls) -> "VectorStore":
        if cls._instance is None:
            persist_dir = os.environ.get("CHROMA_PERSIST_DIR", "./chroma_db")
            cls._instance = cls(persist_directory=persist_dir)
        return cls._instance

    # ─── Write ────────────────────────────────────────────────────────────────

    def upsert_chunk(
        self,
        chunk_id: str,
        embedding: List[float],
        text: str,
        metadata: Dict[str, Any],
    ) -> None:
        """Upsert a single text chunk with its embedding and metadata."""
        self._collection.upsert(
            ids=[chunk_id],
            embeddings=[embedding],
            documents=[text],
            metadatas=[metadata],
        )

    def upsert_chunks_batch(
        self,
        chunk_ids: List[str],
        embeddings: List[List[float]],
        texts: List[str],
        metadatas: List[Dict[str, Any]],
    ) -> None:
        """Batch upsert for efficiency during indexing."""
        if not chunk_ids:
            return
        self._collection.upsert(
            ids=chunk_ids,
            embeddings=embeddings,
            documents=texts,
            metadatas=metadatas,
        )

    # ─── Search ───────────────────────────────────────────────────────────────

    def search(
        self,
        query_embedding: List[float],
        n_results: int = 20,
        where: Optional[Dict] = None,
    ) -> List[Dict[str, Any]]:
        """Semantic search returning ranked results with distances."""
        kwargs: Dict[str, Any] = {
            "query_embeddings": [query_embedding],
            "n_results": min(n_results, max(1, self._collection.count())),
            "include": ["documents", "metadatas", "distances"],
        }
        if where:
            kwargs["where"] = where

        try:
            raw = self._collection.query(**kwargs)
        except Exception:
            return []

        results: List[Dict[str, Any]] = []
        if not raw["ids"] or not raw["ids"][0]:
            return results

        for i, chunk_id in enumerate(raw["ids"][0]):
            meta = (raw["metadatas"][0][i] if raw["metadatas"] else {}) or {}
            results.append(
                {
                    "chunk_id": chunk_id,
                    "text": raw["documents"][0][i] if raw["documents"] else "",
                    "metadata": meta,
                    "distance": raw["distances"][0][i] if raw["distances"] else 1.0,
                    "score": max(0.0, 1.0 - (raw["distances"][0][i] if raw["distances"] else 1.0)),
                }
            )

        return results

    # ─── Deduplication ────────────────────────────────────────────────────────

    def document_exists(self, doc_id: str) -> bool:
        """Check if any chunk with this document_id already exists."""
        try:
            results = self._collection.get(where={"doc_id": doc_id}, limit=1)
            return bool(results["ids"])
        except Exception:
            return False

    @staticmethod
    def make_doc_id(doi: Optional[str] = None, arxiv_id: Optional[str] = None,
                     checksum: Optional[str] = None, source_url: str = "") -> str:
        """Generate canonical document ID using DOI > arxiv > checksum > URL."""
        identifier = doi or arxiv_id or checksum or source_url
        return "doc_" + hashlib.sha256(identifier.encode()).hexdigest()[:20]

    @staticmethod
    def make_chunk_id(doc_id: str, chunk_index: int) -> str:
        return f"{doc_id}_chunk_{chunk_index:04d}"

    # ─── Stats ────────────────────────────────────────────────────────────────

    def total_chunks(self) -> int:
        return self._collection.count()

    def total_documents(self) -> int:
        """Approximate: count unique doc_ids."""
        try:
            all_meta = self._collection.get(include=["metadatas"])
            doc_ids = {m.get("doc_id") for m in all_meta["metadatas"] if m.get("doc_id")}
            return len(doc_ids)
        except Exception:
            return 0
