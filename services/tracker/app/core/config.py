from functools import lru_cache
from typing import List, Union
from pydantic import field_validator
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Central configuration management for Global Tracker Service."""

    PROJECT_NAME: str = "StudyVault Global Academic Tracker Service"
    VERSION: str = "0.9.0-alpha"
    ENVIRONMENT: str = "development"
    API_V1_STR: str = "/api/v1/tracker"

    # Port and Database
    PORT: int = 8001
    DATABASE_URL: str = "sqlite+aiosqlite:///./studyvault_tracker.db"
    POOL_SIZE: int = 20
    MAX_OVERFLOW: int = 10
    POOL_TIMEOUT: int = 30
    DB_ECHO: bool = False

    # Tracker Behavior Config
    HEARTBEAT_INTERVAL_SECS: int = 60
    HEARTBEAT_TIMEOUT_SECS: int = 180
    REGISTRATION_EXPIRY_HOURS: int = 24
    MAX_DISCOVERY_PEERS_LIMIT: int = 100

    # CORS & Security
    CORS_ORIGINS: List[str] = ["*"]
    LOG_LEVEL: str = "INFO"

    # API Documentation URLs
    DOCS_URL: str = "/docs"
    REDOC_URL: str = "/redoc"
    OPENAPI_URL: str = "/openapi.json"

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        case_sensitive=True,
        extra="ignore",
    )

    @field_validator("CORS_ORIGINS", mode="before")
    @classmethod
    def assemble_cors_origins(cls, v: Union[str, List[str]]) -> List[str]:
        if isinstance(v, str) and not v.startswith("["):
            return [i.strip() for i in v.split(",")]
        elif isinstance(v, (list, str)):
            return v
        raise ValueError(v)


@lru_cache()
def get_settings() -> Settings:
    """Returns singleton cached instance of runtime tracker settings."""
    return Settings()


settings = get_settings()
