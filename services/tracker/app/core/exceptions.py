from typing import Any, Optional
from fastapi import Request, status
from fastapi.responses import JSONResponse


class TrackerException(Exception):
    """Base exception class for Tracker service exceptions."""
    def __init__(self, message: str, status_code: int = status.HTTP_400_BAD_REQUEST, details: Optional[dict[str, Any]] = None):
        self.message = message
        self.status_code = status_code
        self.details = details
        super().__init__(message)


class NodeNotFoundException(TrackerException):
    def __init__(self, node_id: str):
        super().__init__(
            message=f"Node with ID '{node_id}' not found on global tracker.",
            status_code=status.HTTP_404_NOT_FOUND,
        )


class NodeExpiredException(TrackerException):
    def __init__(self, node_id: str):
        super().__init__(
            message=f"Node session '{node_id}' has expired. Re-registration required.",
            status_code=status.HTTP_401_UNAUTHORIZED,
        )


async def tracker_exception_handler(request: Request, exc: TrackerException) -> JSONResponse:
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
