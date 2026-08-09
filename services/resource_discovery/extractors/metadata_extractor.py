import re
from typing import Dict, List, Optional
from services.resource_discovery.parsers.html_parser import HTMLParser


class MetadataExtractor:
    """Extracts field-specific metadata from parsed Highwire, Dublin Core, and raw data dictionaries."""

    @staticmethod
    def extract_doi(text_or_meta: str) -> Optional[str]:
        """Extracts DOI via regex pattern matching."""
        match = re.search(r"10\.\d{4,9}/[-._;()/:A-Za-z0-9]+", text_or_meta)
        return match.group(0).rstrip(".") if match else None

    @staticmethod
    def extract_isbn(text_or_meta: str) -> Optional[str]:
        """Extracts ISBN-10 or ISBN-13 via regex pattern matching."""
        clean = text_or_meta.replace("-", "").replace(" ", "")
        match = re.search(r"\b(?:978|979)?\d{9}[\dX]\b", clean)
        return match.group(0) if match else None

    @staticmethod
    def extract_publication_year(date_str: str) -> Optional[int]:
        """Extracts 4-digit publication year from date strings."""
        match = re.search(r"\b(18\d{2}|19\d{2}|20\d{2})\b", date_str)
        return int(match.group(1)) if match else None
