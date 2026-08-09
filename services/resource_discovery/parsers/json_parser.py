import json
from typing import Any, Dict, Optional


class JSONParser:
    """Parses JSON responses from REST APIs (OpenLibrary, Internet Archive, arXiv)."""

    @staticmethod
    def parse_dict(json_text: str) -> Optional[Dict[str, Any]]:
        try:
            return json.loads(json_text)
        except Exception:
            return None
