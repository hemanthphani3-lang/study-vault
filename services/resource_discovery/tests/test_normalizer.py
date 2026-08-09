from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.normalizers.metadata_normalizer import MetadataNormalizer


def test_metadata_normalization(sample_raw_resource: DiscoveredResource):
    normalized = MetadataNormalizer.normalize_resource(sample_raw_resource)

    # 1. Whitespace
    assert normalized.title == "Decentralized zkSNARK Proof Systems"
    assert normalized.subtitle == "Advanced Cryptographic Proofs"
    assert normalized.abstract_text == "This paper introduces a novel zkSNARK architecture."

    # 2. Authors title stripping
    assert "Elena Vance" in normalized.authors
    assert "Marcus Chen" in normalized.authors

    # 3. Category & Language mapping
    assert normalized.category_slug == "computer-science"
    assert normalized.language_code == "en"
