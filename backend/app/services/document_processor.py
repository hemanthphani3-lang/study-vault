"""
Document processor: text extraction + semantic chunking.

Supports: PDF (pdfplumber), HTML (html2text), plain text.
Falls back to abstract text if full content is unavailable.
Chunks with ~750-word windows and 20% overlap.
"""
import logging
import re
from typing import List, Optional

logger = logging.getLogger("studyvault.processor")

_CHUNK_SIZE_WORDS = 750
_OVERLAP_WORDS = 150  # 20% of 750


class TextChunk:
    __slots__ = ("text", "index", "start_word", "end_word")

    def __init__(self, text: str, index: int, start_word: int, end_word: int):
        self.text = text
        self.index = index
        self.start_word = start_word
        self.end_word = end_word


class DocumentProcessor:
    """Extracts text from various document formats and splits into semantic chunks."""

    # ─── Extraction ───────────────────────────────────────────────────────────

    def extract_from_pdf_bytes(self, pdf_bytes: bytes) -> Optional[str]:
        """Extract full text from raw PDF bytes using pdfplumber."""
        try:
            import pdfplumber
            import io
            pages: List[str] = []
            with pdfplumber.open(io.BytesIO(pdf_bytes)) as pdf:
                for page in pdf.pages:
                    text = page.extract_text()
                    if text:
                        pages.append(text.strip())
            return "\n\n".join(pages) if pages else None
        except ImportError:
            logger.warning("pdfplumber not installed. Cannot extract PDF text.")
            return None
        except Exception as e:
            logger.warning(f"PDF extraction failed: {e}")
            return None

    def extract_from_html(self, html: str) -> str:
        """Convert HTML to clean plain text."""
        try:
            import html2text
            h = html2text.HTML2Text()
            h.ignore_links = False
            h.ignore_images = True
            h.body_width = 0
            return h.handle(html).strip()
        except ImportError:
            # Fallback: strip HTML tags
            text = re.sub(r"<[^>]+>", " ", html)
            return re.sub(r"\s+", " ", text).strip()
        except Exception as e:
            logger.warning(f"HTML extraction failed: {e}")
            return re.sub(r"<[^>]+>", " ", html).strip()

    def extract_from_text(self, text: str) -> str:
        """Clean and normalize plain text."""
        # Remove excessive whitespace
        text = re.sub(r"\r\n", "\n", text)
        text = re.sub(r"\n{3,}", "\n\n", text)
        text = re.sub(r"[ \t]+", " ", text)
        return text.strip()

    # ─── Chunking ─────────────────────────────────────────────────────────────

    def chunk_text(self, text: str, chunk_size: int = _CHUNK_SIZE_WORDS,
                   overlap: int = _OVERLAP_WORDS) -> List[TextChunk]:
        """
        Split text into overlapping word-based chunks.
        Preserves sentence boundaries where possible.
        """
        if not text or not text.strip():
            return []

        words = text.split()
        if not words:
            return []

        chunks: List[TextChunk] = []
        start = 0
        idx = 0

        while start < len(words):
            end = min(start + chunk_size, len(words))
            chunk_words = words[start:end]
            chunk_text = " ".join(chunk_words)

            # Try to break at sentence boundary within last 20% of chunk
            if end < len(words):
                look_back = max(end - chunk_size // 5, start + chunk_size // 2)
                best_break = end
                for i in range(end - 1, look_back, -1):
                    if words[i - 1][-1] in ".!?":
                        best_break = i
                        break
                if best_break != end:
                    chunk_words = words[start:best_break]
                    chunk_text = " ".join(chunk_words)
                    end = best_break

            chunks.append(TextChunk(
                text=chunk_text,
                index=idx,
                start_word=start,
                end_word=end,
            ))

            idx += 1
            start = end - overlap  # slide with overlap
            if start >= end:
                break

        return chunks

    def build_index_text(self, title: str, abstract: Optional[str], full_text: Optional[str]) -> str:
        """
        Compose the text to be indexed for a document.
        Uses full_text if available, otherwise falls back to abstract.
        Always prepends title for search boosting.
        """
        parts = [f"Title: {title}"]
        if abstract and abstract.strip():
            parts.append(f"Abstract: {abstract.strip()}")
        if full_text and full_text.strip():
            # Prepend but deduplicate with abstract
            body = full_text.strip()
            if abstract and abstract.strip() in body:
                parts.append(body)
            else:
                parts.append(body)
        return "\n\n".join(parts)


# Singleton
_processor: Optional[DocumentProcessor] = None


def get_document_processor() -> DocumentProcessor:
    global _processor
    if _processor is None:
        _processor = DocumentProcessor()
    return _processor
