import pytest
from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)

def test_security_status_endpoint():
    response = client.get("/api/v1/security/status")
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["data"]["protocol"] == "SVSG/1.0"
    assert data["data"]["zero_trust_status"] == "ENFORCED"

def test_security_authorize_success():
    payload = {
        "node_id": "node_test_client_01",
        "public_key": "0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9",
        "fingerprint": "SHA256:AA:BB:CC:DD:EE:FF:11:22",
        "signature": "11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff",
        "timestamp": "2026-08-08T23:00:00Z",
        "nonce": "test_nonce_unique_001",
        "metadata_id": "res_math_101",
        "target_peer_id": "node_seeder_01",
        "file_size_bytes": 1048576,
        "capabilities": ["peer_seeder", "metadata_relay"],
        "svsg_version": "SVSG/1.0",
        "svtp_version": "SVTP/1.0",
    }
    response = client.post("/api/v1/security/authorize", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["data"]["is_authorized"] is True
    assert data["data"]["auth_token"].startswith("svsg_auth_")

def test_security_authorize_replay_rejection():
    payload = {
        "node_id": "node_test_client_01",
        "public_key": "0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9",
        "fingerprint": "SHA256:AA:BB:CC:DD:EE:FF:11:22",
        "signature": "11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff",
        "timestamp": "2026-08-08T23:00:00Z",
        "nonce": "test_nonce_replay_002",
        "metadata_id": "res_math_101",
        "target_peer_id": "node_seeder_01",
        "file_size_bytes": 1048576,
    }
    # First attempt: Authorized
    res1 = client.post("/api/v1/security/authorize", json=payload)
    assert res1.json()["data"]["is_authorized"] is True

    # Second attempt with same nonce: Rejected (Replay Attack)
    res2 = client.post("/api/v1/security/authorize", json=payload)
    assert res2.status_code == 200
    data = res2.json()
    assert data["success"] is False
    assert data["data"]["is_authorized"] is False
    assert "Replay" in data["data"]["failure_reason"] or "nonce_uniqueness" in data["data"]["failure_reason"]

def test_security_validate_identity():
    payload = {
        "node_id": "node_test_01",
        "public_key": "0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9",
        "fingerprint": "SHA256:AA:BB:CC:DD:EE:FF:11:22",
        "signature": "11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff",
        "challenge": "test_challenge_str",
    }
    response = client.post("/api/v1/security/validate-identity", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["data"]["is_valid"] is True

def test_security_audit_logs():
    response = client.get("/api/v1/security/audit-logs")
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "logs" in data["data"]
    assert len(data["data"]["logs"]) > 0
