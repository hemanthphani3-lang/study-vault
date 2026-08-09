import logging
import sys


class StructuredDiscoveryFormatter(logging.Formatter):
    COLORS = {
        logging.DEBUG: "\033[36m",     # Cyan
        logging.INFO: "\033[32m",      # Green
        logging.WARNING: "\033[33m",   # Yellow
        logging.ERROR: "\033[31m",     # Red
        logging.CRITICAL: "\033[35m",  # Magenta
    }
    RESET = "\033[0m"

    def format(self, record: logging.LogRecord) -> str:
        color = self.COLORS.get(record.levelno, self.RESET)
        timestamp = self.formatTime(record, "%Y-%m-%d %H:%M:%S")
        levelname = f"{color}{record.levelname:<8}{self.RESET}"
        return f"[{timestamp}] [{levelname}] [{record.name}] {record.getMessage()}"


def setup_logger(name: str = "resource_discovery") -> logging.Logger:
    logger = logging.getLogger(name)
    logger.setLevel(logging.INFO)

    if not logger.handlers:
        handler = logging.StreamHandler(sys.stdout)
        handler.setFormatter(StructuredDiscoveryFormatter())
        logger.addHandler(handler)

    return logger


logger = setup_logger()
provider_logger = setup_logger("discovery.provider")
validator_logger = setup_logger("discovery.validator")
