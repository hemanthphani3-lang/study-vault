"""
Embedding service using sentence-transformers (all-MiniLM-L6-v2).

Lazy-loads the model on first use to avoid startup delay.
Falls back to zero-vector if model unavailable (graceful degradation).
"""
import logging
from typing import List, Optional

logger = logging.getLogger("studyvault.embeddings")

_MODEL_NAME = "all-MiniLM-L6-v2"
_EMBEDDING_DIM = 384

_model = None


def _load_model():
    global _model
    if _model is None:
        try:
            from sentence_transformers import SentenceTransformer
            logger.info(f"Loading embedding model: {_MODEL_NAME}")
            _model = SentenceTransformer(_MODEL_NAME)
            logger.info("Embedding model loaded successfully.")
        except Exception as e:
            logger.error(f"Failed to load embedding model: {e}. Falling back to zero vectors.")
    return _model


class EmbeddingService:
    """Generates dense embeddings for semantic search."""

    def embed_text(self, text: str) -> List[float]:
        """Embed a single text string. Falls back to zero vector on failure."""
        if not text or not text.strip():
            return [0.0] * _EMBEDDING_DIM
        try:
            model = _load_model()
            if model is None:
                return self._hash_fallback(text)
            vec = model.encode(text, normalize_embeddings=True)
            return vec.tolist()
        except Exception as e:
            logger.warning(f"Embedding failed: {e}")
            return self._hash_fallback(text)

    def embed_batch(self, texts: List[str]) -> List[List[float]]:
        """Embed a list of texts efficiently in one forward pass."""
        if not texts:
            return []
        try:
            model = _load_model()
            if model is None:
                return [self._hash_fallback(t) for t in texts]
            vecs = model.encode(texts, normalize_embeddings=True, batch_size=32, show_progress_bar=False)
            return [v.tolist() for v in vecs]
        except Exception as e:
            logger.warning(f"Batch embedding failed: {e}")
            return [self._hash_fallback(t) for t in texts]

    def _hash_fallback(self, text: str) -> List[float]:
        """Deterministic pseudo-embedding from text hash for graceful degradation."""
        import hashlib, struct
        h = hashlib.sha256(text.encode()).digest()
        floats = []
        for i in range(0, min(len(h), _EMBEDDING_DIM * 4), 4):
            val = struct.unpack("f", h[i:i+4])[0] if i + 4 <= len(h) else 0.0
            floats.append(float(val) if not (val != val) else 0.0)  # NaN guard
        # Pad or truncate to _EMBEDDING_DIM
        while len(floats) < _EMBEDDING_DIM:
            floats.append(0.0)
        return floats[:_EMBEDDING_DIM]

    @staticmethod
    def embedding_dim() -> int:
        return _EMBEDDING_DIM


# Singleton
_embedding_service: Optional[EmbeddingService] = None


def get_embedding_service() -> EmbeddingService:
    global _embedding_service
    if _embedding_service is None:
        _embedding_service = EmbeddingService()
    return _embedding_service
