from services.resource_discovery.core.interfaces import DiscoveredResource
from services.resource_discovery.validators.metadata_validator import MetadataValidator


def test_validator_high_quality_resource(sample_raw_resource: DiscoveredResource):
    is_valid, score, reasons = MetadataValidator.validate_resource(sample_raw_resource)
    assert is_valid is True
    assert score >= 0.85
    assert len(reasons) == 0


def test_validator_reject_missing_title():
    invalid_resource = DiscoveredResource(
        title="",
        source_url="https://arxiv.org/abs/2601.00123",
    )
    is_valid, score, reasons = MetadataValidator.validate_resource(invalid_resource)
    assert is_valid is False
    assert "title" in reasons[0].lower()


def test_validator_reject_missing_url():
    invalid_resource = DiscoveredResource(
        title="Valid Academic Paper Title",
        source_url="invalid_url",
    )
    is_valid, score, reasons = MetadataValidator.validate_resource(invalid_resource)
    assert is_valid is False
    assert "source url" in reasons[0].lower()
