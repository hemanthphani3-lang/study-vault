from typing import Any, Dict, Optional
from fastapi import Request, status
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from starlette.exceptions import HTTPException as StarletteHTTPException
from app.core.logging import logger


class StudyVaultException(Exception):
    """Base domain exception for StudyVault backend services."""

    def __init__(self, message: str, status_code: int = status.HTTP_500_INTERNAL_SERVER_ERROR, details: Optional[Dict[str, Any]] = None):
        super().__init__(message)
        self.message = message
        self.status_code = status_code
        self.details = details or {}


class ResourceNotFoundException(StudyVaultException):
    """Raised when an academic resource ID, DOI, or CID does not exist."""

    def __init__(self, resource_id: str):
        super().__init__(
            message=f"Academic resource with identifier '{resource_id}' was not found.",
            status_code=status.HTTP_404_NOT_FOUND,
            details={"resource_id": resource_id},
        )


class CategoryNotFoundException(StudyVaultException):
    """Raised when a requested category slug or ID does not exist."""

    def __init__(self, category_id: str):
        super().__init__(
            message=f"Category '{category_id}' was not found.",
            status_code=status.HTTP_404_NOT_FOUND,
            details={"category_id": category_id},
        )


class InvalidFilterException(StudyVaultException):
    """Raised when filter query parameters violate search validation rules."""

    def __init__(self, message: str):
        super().__init__(
            message=message,
            status_code=status.HTTP_400_BAD_REQUEST,
        )


# -----------------------------------------------------------------------------
# Global FastAPI Exception Handlers
# -----------------------------------------------------------------------------

async def studyvault_exception_handler(request: Request, exc: StudyVaultException) -> JSONResponse:
    """Handles domain-specific StudyVault exceptions."""
    logger.warning(f"Domain exception on {request.method} {request.url.path}: {exc.message}")
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "success": False,
            "error": {
                "type": exc.__class__.__name__,
                "message": exc.message,
                "details": exc.details,
            },
        },
    )


async def validation_exception_handler(request: Request, exc: RequestValidationError) -> JSONResponse:
    """Handles Pydantic request validation errors."""
    errors = exc.errors()
    logger.warning(f"Validation error on {request.method} {request.url.path}: {len(errors)} errors")
    return JSONResponse(
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
        content={
            "success": False,
            "error": {
                "type": "RequestValidationError",
                "message": "Invalid request parameters or payload structure.",
                "details": errors,
            },
        },
    )


async def http_exception_handler(request: Request, exc: StarletteHTTPException) -> JSONResponse:
    """Handles standard HTTPExceptions."""
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "success": False,
            "error": {
                "type": "HTTPException",
                "message": exc.detail,
                "details": {},
            },
        },
    )


async def global_exception_handler(request: Request, exc: Exception) -> JSONResponse:
    """Catches all unhandled exceptions and logs traceback."""
    logger.critical(f"Unhandled critical error on {request.method} {request.url.path}: {str(exc)}", exc_info=True)
    return JSONResponse(
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
        content={
            "success": False,
            "error": {
                "type": "InternalServerError",
                "message": "An unexpected error occurred. Please contact the network administrator.",
                "details": {},
            },
        },
    )
