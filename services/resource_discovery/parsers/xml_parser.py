from typing import Any, Dict, List, Optional
from bs4 import BeautifulSoup


class XMLParser:
    """Parses Atom/XML feeds (arXiv, Dublin Core, OAI-PMH)."""

    @staticmethod
    def parse_atom_entries(xml_content: str) -> List[Dict[str, Any]]:
        soup = BeautifulSoup(xml_content, "xml")
        entries = []

        for entry in soup.find_all("entry"):
            title = entry.find("title")
            summary = entry.find("summary")
            published = entry.find("published")
            doi_tag = entry.find("arxiv:doi") or entry.find("doi")

            authors = [a.find("name").text.strip() for a in entry.find_all("author") if a.find("name")]
            categories = [c.get("term") for c in entry.find_all("category") if c.get("term")]

            links = {}
            for link in entry.find_all("link"):
                rel = link.get("rel", "alternate")
                href = link.get("href")
                if href:
                    links[rel] = href

            entries.append({
                "id": entry.find("id").text.strip() if entry.find("id") else "",
                "title": title.text.strip() if title else "",
                "summary": summary.text.strip() if summary else "",
                "published": published.text.strip() if published else "",
                "authors": authors,
                "categories": categories,
                "doi": doi_tag.text.strip() if doi_tag else None,
                "links": links,
            })

        return entries
