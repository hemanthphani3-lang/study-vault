import time
import uuid
from fastapi import FastAPI, Request, Response
from fastapi.middleware.cors import CORSMiddleware
from starlette.middleware.base import BaseHTTPMiddleware, RequestResponseEndpoint
from app.core.config import settings
from app.core.logging import logger


class RequestTelemetryMiddleware(BaseHTTPMiddleware):
    """Measures request execution duration and injects unique trace IDs."""

    async def dispatch(self, request: Request, call_next: RequestResponseEndpoint) -> Response:
        request_id = str(uuid.uuid4())
        request.state.request_id = request_id

        start_time = time.perf_counter()
        response = await call_next(request)
        process_time_ms = (time.perf_counter() - start_time) * 1000

        response.headers["X-Request-ID"] = request_id
        response.headers["X-Process-Time-Ms"] = f"{process_time_ms:.2f}"

        if request.url.path not in ["/api/v1/health"]:
            logger.info(
                f"{request.method} {request.url.path} -> {response.status_code} "
                f"({process_time_ms:.2f}ms) [ID: {request_id[:8]}]"
            )

        return response


def setup_middleware(app: FastAPI) -> None:
    """Registers all security, telemetry, and CORS middlewares."""
    # 1. CORS
    app.add_middleware(
        CORSMiddleware,
        allow_origins=settings.CORS_ORIGINS,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    # 2. Timing and Tracing
    app.add_middleware(RequestTelemetryMiddleware)
