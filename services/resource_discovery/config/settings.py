from functools import lru_cache
from pydantic_settings import BaseSettings, SettingsConfigDict


class DiscoverySettings(BaseSettings):
    """Configuration for the independent Resource Discovery Service."""

    SERVICE_NAME: str = "StudyVault Academic Resource Discovery Engine"
    VERSION: str = "0.7.0-alpha"
    ENVIRONMENT: str = "development"

    # FastAPI Backend Connectivity
    BACKEND_URL: str = "http://127.0.0.1:8000"
    BACKEND_API_PREFIX: str = "/api/v1"
    BACKEND_RESOURCES_ENDPOINT: str = "/api/v1/resources"

    # Ethical Scraping & Bot Headers
    USER_AGENT: str = "StudyVaultBot/1.0 (+https://studyvault.org/bot; Academic Metadata Ingest Engine)"
    RATE_LIMIT_DELAY_SECONDS: float = 1.0
    MAX_RETRIES: int = 3
    REQUEST_TIMEOUT_SECONDS: float = 15.0
    ROBOTS_TXT_COMPLIANCE: bool = True

    # Validation & Deduplication
    MIN_CONFIDENCE_THRESHOLD: float = 0.60
    CACHE_CAPACITY: int = 10000

    # Log Level
    LOG_LEVEL: str = "INFO"

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )


@lru_cache()
def get_settings() -> DiscoverySettings:
    return DiscoverySettings()


settings = get_settings()
