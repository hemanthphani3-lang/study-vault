import hashlib
import pytest
from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)

def test_dca_status_endpoint():
    response = client.get("/api/v1/dca/status")
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["data"]["subsystem"] == "Distributed Content Addressing (DCA)"
    assert data["data"]["specification"] == "SVE-006"

def test_dca_verify_cid_success():
    payload = b"StudyVault DCA Test Payload 2026"
    payload_hex = payload.hex()
    computed_hash = hashlib.sha256(payload).hexdigest()[:32]
    cid = f"bafybeic{computed_hash}"

    response = client.post(
        "/api/v1/dca/verify-cid",
        json={"cid": cid, "payload_hex": payload_hex},
    )
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["data"]["is_valid"] is True

def test_dca_verify_cid_mismatch():
    payload = b"StudyVault DCA Test Payload 2026"
    payload_hex = payload.hex()
    cid = "bafybeic00000000000000000000000000000000"

    response = client.post(
        "/api/v1/dca/verify-cid",
        json={"cid": cid, "payload_hex": payload_hex},
    )
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is False
    assert data["data"]["is_valid"] is False

def test_dca_metrics_endpoint():
    response = client.get("/api/v1/dca/metrics")
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "total_cids" in data["data"]
    assert "quota_bytes" in data["data"]
