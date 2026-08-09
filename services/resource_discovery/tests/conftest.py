import os
import sys

# Ensure project root is on sys.path for test suite execution
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../../..")))

import pytest
import pytest_asyncio
from services.resource_discovery.core.interfaces import DiscoveredResource


@pytest.fixture
def sample_raw_resource() -> DiscoveredResource:
    return DiscoveredResource(
        title="  Decentralized  zkSNARK Proof Systems  ",
        subtitle=" Advanced   Cryptographic Proofs ",
        abstract_text="  This paper introduces a novel   zkSNARK architecture. ",
        authors=["Dr. Elena Vance", "Prof. Marcus Chen"],
        resource_type="paper",
        category_slug="Computer Science",
        language_code="English",
        publication_year=2026,
        doi="10.1038/s41586-026-04289-w",
        source_url="https://arxiv.org/abs/2601.00123",
    )
