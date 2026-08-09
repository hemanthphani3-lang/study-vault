"""
Async PDF download manager with retry, timeout, dedup, and checksum verification.

Downloads PDFs to memory (no disk I/O) for immediate text extraction.
Falls back gracefully — never blocks the pipeline on a failed download.
"""
import asyncio
import hashlib
import logging
from typing import Dict, Optional, Tuple

import httpx

logger = logging.getLogger("studyvault.downloader")

_TIMEOUT = httpx.Timeout(30.0, connect=10.0)
_MAX_RETRIES = 2
_MAX_CONTENT_MB = 50
_HEADERS = {
    "User-Agent": "StudyVault Academic Pipeline/1.0 (research; contact@studyvault.app)",
    "Accept": "application/pdf,*/*",
}

# In-memory checksum cache to avoid re-downloading
_downloaded_checksums: Dict[str, str] = {}  # url -> sha256


class DownloadResult:
    __slots__ = ("url", "content", "checksum", "content_type", "success", "error")

    def __init__(self, url: str, content: Optional[bytes], checksum: Optional[str],
                 content_type: str, success: bool, error: str = ""):
        self.url = url
        self.content = content
        self.checksum = checksum
        self.content_type = content_type
        self.success = success
        self.error = error


async def download_pdf(url: str) -> DownloadResult:
    """
    Download a PDF from url into memory with retry and checksum.
    Returns DownloadResult with content=None if failed.
    """
    if not url or not url.startswith("http"):
        return DownloadResult(url, None, None, "", False, "Invalid URL")

    # Dedup: already downloaded this URL?
    if url in _downloaded_checksums:
        logger.debug(f"Skipping duplicate download: {url}")
        return DownloadResult(url, None, _downloaded_checksums[url], "cached", True)

    for attempt in range(1, _MAX_RETRIES + 2):
        try:
            async with httpx.AsyncClient(
                headers=_HEADERS,
                timeout=_TIMEOUT,
                follow_redirects=True,
                max_redirects=5,
            ) as client:
                response = await client.get(url)
                response.raise_for_status()

                content_type = response.headers.get("content-type", "").lower()
                content_length = int(response.headers.get("content-length", 0))

                if content_length > _MAX_CONTENT_MB * 1024 * 1024:
                    return DownloadResult(url, None, None, content_type, False, "File too large")

                content = response.content
                if len(content) > _MAX_CONTENT_MB * 1024 * 1024:
                    return DownloadResult(url, None, None, content_type, False, "Content too large")

                checksum = hashlib.sha256(content).hexdigest()
                _downloaded_checksums[url] = checksum

                logger.info(f"Downloaded {len(content)//1024}KB from {url[:80]}")
                return DownloadResult(url, content, checksum, content_type, True)

        except httpx.HTTPStatusError as e:
            if e.response.status_code in (403, 404, 410):
                return DownloadResult(url, None, None, "", False, f"HTTP {e.response.status_code}")
            if attempt <= _MAX_RETRIES:
                await asyncio.sleep(1.5 * attempt)
                continue
            return DownloadResult(url, None, None, "", False, str(e))

        except (httpx.TimeoutException, httpx.ConnectError) as e:
            if attempt <= _MAX_RETRIES:
                await asyncio.sleep(2.0 * attempt)
                continue
            return DownloadResult(url, None, None, "", False, str(e))

        except Exception as e:
            return DownloadResult(url, None, None, "", False, str(e))

    return DownloadResult(url, None, None, "", False, "Max retries exceeded")


async def download_pdfs_concurrent(
    url_map: Dict[str, str],  # doc_id -> pdf_url
    max_concurrent: int = 5,
) -> Dict[str, DownloadResult]:
    """Download multiple PDFs concurrently with a semaphore limit."""
    semaphore = asyncio.Semaphore(max_concurrent)
    results: Dict[str, DownloadResult] = {}

    async def _download_one(doc_id: str, url: str) -> Tuple[str, DownloadResult]:
        async with semaphore:
            result = await download_pdf(url)
            return doc_id, result

    tasks = [_download_one(doc_id, url) for doc_id, url in url_map.items() if url]
    completed = await asyncio.gather(*tasks, return_exceptions=True)

    for item in completed:
        if isinstance(item, tuple):
            doc_id, result = item
            results[doc_id] = result
        else:
            logger.error(f"Download task failed: {item}")

    return results


def get_arxiv_pdf_url(arxiv_id: str) -> Optional[str]:
    """Construct arXiv PDF URL from arxiv_id."""
    if not arxiv_id:
        return None
    clean_id = arxiv_id.replace("http://arxiv.org/abs/", "").replace("https://arxiv.org/abs/", "")
    return f"https://arxiv.org/pdf/{clean_id}.pdf"
