from app.core.config import Settings, settings


class ConfigurationService:
    """Runtime configuration inspection service."""

    @staticmethod
    def get_public_config() -> dict:
        return {
            "project_name": settings.PROJECT_NAME,
            "version": settings.VERSION,
            "environment": settings.ENVIRONMENT,
            "rate_limit_per_minute": settings.RATE_LIMIT_PER_MINUTE,
            "cors_origins": settings.CORS_ORIGINS,
            "dht_bootstrap_nodes": settings.DHT_BOOTSTRAP_NODES,
        }
