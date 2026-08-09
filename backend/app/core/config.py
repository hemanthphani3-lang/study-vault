from functools import lru_cache
from typing import List, Union
from pydantic import AnyHttpUrl, field_validator
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Central configuration management using environment variables."""

    PROJECT_NAME: str = "StudyVault Academic Metadata Gateway"
    VERSION: str = "0.6.0-alpha"
    ENVIRONMENT: str = "development"
    API_V1_STR: str = "/api/v1"

    # Database Configuration
    DATABASE_URL: str = "sqlite+aiosqlite:///./studyvault_metadata.db"
    POOL_SIZE: int = 20
    MAX_OVERFLOW: int = 10
    POOL_TIMEOUT: int = 30
    DB_ECHO: bool = False

    # CORS & Security
    CORS_ORIGINS: List[str] = ["*"]

    # Observability & Rate Limiting
    LOG_LEVEL: str = "INFO"
    RATE_LIMIT_PER_MINUTE: int = 120

    # API Documentation URLs
    DOCS_URL: str = "/docs"
    REDOC_URL: str = "/redoc"
    OPENAPI_URL: str = "/openapi.json"

    # Future Swarm & Gateway placeholders
    MAX_SEARCH_RESULTS_LIMIT: int = 100
    ENABLE_NODE_AUTH: bool = False
    DHT_BOOTSTRAP_NODES: List[str] = [
        "12D3KooWAcademicNodeZurichETH",
        "12D3KooWMITOpenCoursewareRelay",
    ]

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
    """Returns singleton cached instance of runtime settings."""
    return Settings()


settings = get_settings()
