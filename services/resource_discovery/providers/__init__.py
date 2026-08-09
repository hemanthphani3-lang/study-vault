from services.resource_discovery.providers.base import AbstractProvider
from services.resource_discovery.providers.open_library_provider import OpenLibraryProvider
from services.resource_discovery.providers.internet_archive_provider import InternetArchiveProvider
from services.resource_discovery.providers.arxiv_provider import ArxivProvider
from services.resource_discovery.providers.university_provider import UniversityProvider

__all__ = [
    "AbstractProvider",
    "OpenLibraryProvider",
    "InternetArchiveProvider",
    "ArxivProvider",
    "UniversityProvider",
]
