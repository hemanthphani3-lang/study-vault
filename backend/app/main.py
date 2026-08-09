from contextlib import asynccontextmanager
from typing import AsyncGenerator
from fastapi import FastAPI
from fastapi.exceptions import RequestValidationError
from starlette.exceptions import HTTPException as StarletteHTTPException
from app.api.v1.api import api_router
from app.core.config import settings
from app.core.exceptions import (
    StudyVaultException,
    global_exception_handler,
    http_exception_handler,
    studyvault_exception_handler,
    validation_exception_handler,
)
from app.core.logging import logger
from app.core.middleware import setup_middleware
from app.database.session import init_db


@asynccontextmanager
async def lifespan(app: FastAPI) -> AsyncGenerator[None, None]:
    """Lifespan manager for backend startup and shutdown lifecycle events."""
    logger.info(f"Starting {settings.PROJECT_NAME} v{settings.VERSION} [{settings.ENVIRONMENT}]")
    await init_db()
    yield
    logger.info("Shutting down StudyVault backend services cleanly.")


app = FastAPI(
    title=settings.PROJECT_NAME,
    version=settings.VERSION,
    description=(
        "Production-grade metadata, search, and discovery coordination gateway for StudyVault. "
        "Strictly metadata-only — zero PDF or binary document storage."
    ),
    docs_url=settings.DOCS_URL,
    redoc_url=settings.REDOC_URL,
    openapi_url=settings.OPENAPI_URL,
    lifespan=lifespan,
)

# 1. Register Middlewares
setup_middleware(app)

# 2. Register Global Exception Handlers
app.add_exception_handler(StudyVaultException, studyvault_exception_handler) # type: ignore
app.add_exception_handler(RequestValidationError, validation_exception_handler) # type: ignore
app.add_exception_handler(StarletteHTTPException, http_exception_handler) # type: ignore
app.add_exception_handler(Exception, global_exception_handler) # type: ignore

# 3. Include API Routers
app.include_router(api_router, prefix=settings.API_V1_STR)


@app.get("/", include_in_schema=False)
async def root():
    """Redirect or basic landing status."""
    return {
        "project": settings.PROJECT_NAME,
        "version": settings.VERSION,
        "docs": settings.DOCS_URL,
        "health": f"{settings.API_V1_STR}/health",
    }
