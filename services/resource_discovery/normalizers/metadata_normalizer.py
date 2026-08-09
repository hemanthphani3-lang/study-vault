import re
from typing import List, Optional
from services.resource_discovery.core.interfaces import DiscoveredResource


class MetadataNormalizer:
    """Normalizes and canonicalizes metadata fields."""

    TITLE_PREFIX_PATTERN = re.compile(r"^(Dr\.|Prof\.|PhD|MD|Sir)\s+", re.IGNORECASE)

    CATEGORY_MAPPINGS = {
        "cs": "computer-science",
        "computer science": "computer-science",
        "math": "mathematics",
        "mathematics": "mathematics",
        "physics": "physics",
        "biology": "biology",
        "bio": "biology",
        "engineering": "engineering",
        "medicine": "medicine",
    }

    LANGUAGE_MAPPINGS = {
        "english": "en",
        "eng": "en",
        "en": "en",
        "german": "de",
        "deutsch": "de",
        "french": "fr",
        "spanish": "es",
    }

    @classmethod
    def normalize_resource(cls, resource: DiscoveredResource) -> DiscoveredResource:
        """Applies normalization pipeline to a DiscoveredResource instance."""
        # 1. Clean Title
        title = cls.clean_whitespace(resource.title)
        subtitle = cls.clean_whitespace(resource.subtitle) if resource.subtitle else None
        abstract = cls.clean_whitespace(resource.abstract_text) if resource.abstract_text else None

        # 2. Clean Authors
        cleaned_authors = []
        for author in resource.authors:
            a_clean = cls.clean_whitespace(author)
            a_clean = cls.TITLE_PREFIX_PATTERN.sub("", a_clean)
            if a_clean and a_clean not in cleaned_authors:
                cleaned_authors.append(a_clean)

        # 3. Normalize Category
        cat_lower = (resource.category_slug or "general").lower().strip()
        cat_slug = cls.CATEGORY_MAPPINGS.get(cat_lower, cat_lower.replace(" ", "-"))

        # 4. Normalize Language Code
        lang_lower = (resource.language_code or "en").lower().strip()
        lang_code = cls.LANGUAGE_MAPPINGS.get(lang_lower, "en")

        return resource.model_copy(
            update={
                "title": title,
                "subtitle": subtitle,
                "abstract_text": abstract,
                "authors": cleaned_authors,
                "category_slug": cat_slug,
                "language_code": lang_code,
            }
        )

    @staticmethod
    def clean_whitespace(text: str) -> str:
        if not text:
            return ""
        return re.sub(r"\s+", " ", text).strip()
