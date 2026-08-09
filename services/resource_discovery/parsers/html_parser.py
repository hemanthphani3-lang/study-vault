from typing import Dict, List, Optional
from bs4 import BeautifulSoup


class HTMLParser:
    """Parses HTML documents and extracts Highwire Press, Dublin Core, and OpenGraph academic metadata tags."""

    @staticmethod
    def parse_meta_tags(html_content: str) -> Dict[str, List[str]]:
        soup = BeautifulSoup(html_content, "lxml")
        metadata: Dict[str, List[str]] = {}

        # 1. Highwire Press & Dublin Core meta tags
        for meta in soup.find_all("meta"):
            name = meta.get("name") or meta.get("property")
            content = meta.get("content")
            if name and content:
                key = name.lower().strip()
                val = content.strip()
                if key not in metadata:
                    metadata[key] = []
                metadata[key].append(val)

        return metadata

    @staticmethod
    def extract_title(html_content: str) -> Optional[str]:
        soup = BeautifulSoup(html_content, "lxml")
        # Try Highwire/Dublin Core
        meta_title = soup.find("meta", attrs={"name": ["citation_title", "dc.title", "DC.Title"]})
        if meta_title and meta_title.get("content"):
            return meta_title["content"].strip()
        # Fallback to <title> tag
        title_tag = soup.find("title")
        if title_tag and title_tag.text:
            return title_tag.text.strip()
        return None
