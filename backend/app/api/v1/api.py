from fastapi import APIRouter
from app.api.v1.endpoints import (
    authors,
    categories,
    dca,
    discovery,
    health,
    languages,
    placeholders,
    resources,
    security,
    sharing,
    tracker,
    trust,
    version,
)

api_router = APIRouter()

api_router.include_router(health.router, tags=["Health & Diagnostics"])
api_router.include_router(version.router, tags=["Health & Diagnostics"])
api_router.include_router(resources.router, tags=["Academic Resources"])
api_router.include_router(categories.router, tags=["Taxonomy & Categories"])
api_router.include_router(authors.router, tags=["Authors & Bibliometrics"])
api_router.include_router(languages.router, tags=["Taxonomy & Categories"])
api_router.include_router(tracker.router, tags=["Global Academic Tracker Gateway"])
api_router.include_router(discovery.router, tags=["StudyVault Discovery Protocol (SVDP)"])
api_router.include_router(security.router, tags=["Security Gateway (SVSG)"])
api_router.include_router(dca.router, tags=["Distributed Content Addressing (DCA / IPFS)"])
api_router.include_router(sharing.router, tags=["Content Sharing Protocol (SVCS)"])
api_router.include_router(trust.router, tags=["StudyVault Trust Framework (SVTF)"])
api_router.include_router(placeholders.router, tags=["Future Contracts & Swarms"])
