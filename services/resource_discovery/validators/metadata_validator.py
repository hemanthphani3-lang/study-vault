from typing import List, Tuple
from services.resource_discovery.config.settings import settings
from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.logging.logger import validator_logger


class MetadataValidator:
    """Validates extracted academic metadata quality and calculates confidence scores."""

    @classmethod
    def validate_resource(cls, resource: DiscoveredResource) -> Tuple[bool, float, List[str]]:
        rejection_reasons: List[str] = []
        score = 0.0

        # 1. Mandatory Title Check
        if not resource.title or len(resource.title.strip()) < 3:
            rejection_reasons.append("Resource title is empty or too short.")
        else:
            score += 0.30

        # 2. Mandatory Source URL Check
        if not resource.source_url or not resource.source_url.startswith(("http://", "https://")):
            rejection_reasons.append("Invalid or missing HTTP source URL.")
        else:
            score += 0.10

        # 3. Authors Weight
        if resource.authors and len(resource.authors) > 0:
            score += 0.20

        # 4. Bibliometric Identifiers Weight (DOI, ISBN, arXiv)
        if resource.doi or resource.isbn or resource.arxiv_id:
            score += 0.25

        # 5. Abstract & Year Weight
        if resource.abstract_text and len(resource.abstract_text.strip()) > 20:
            score += 0.10
        if resource.publication_year and 1800 <= resource.publication_year <= 2100:
            score += 0.05

        score = min(1.0, round(score, 2))

        # Decision
        is_valid = len(rejection_reasons) == 0 and score >= settings.MIN_CONFIDENCE_THRESHOLD

        if not is_valid:
            validator_logger.warning(
                f"Rejected resource '{resource.title[:30]}...' (Score: {score:.2f}): {', '.join(rejection_reasons)}"
            )

        return is_valid, score, rejection_reasons
