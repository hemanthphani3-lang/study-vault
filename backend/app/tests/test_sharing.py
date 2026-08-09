import pytest
from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)

def test_sharing_status_endpoint():
    response = client.get("/api/v1/sharing/status")
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["data"]["protocol"] == "SVCS/1.0"
    assert data["data"]["manual_uploads_allowed"] is False

def test_sharing_advertise_and_unadvertise():
    ad_payload = {
        "node_id": "node_test_seeder_01",
        "metadata_id": "res_quantum_101",
        "cid": "bafybeic11223344556677889900112233445566",
        "capabilities": ["peer_seeder"],
        "availability": "online",
        "storage_status": "pinned",
    }

    # Step 1: Publish Advertisement
    res1 = client.post("/api/v1/sharing/advertise", json=ad_payload)
    assert res1.status_code == 200
    assert res1.json()["data"]["status"] == "advertised"

    # Step 2: Query Catalog
    res2 = client.get("/api/v1/sharing/catalog")
    assert res2.status_code == 200
    catalog = res2.json()["data"]["catalog"]
    assert len(catalog) > 0

    # Step 3: Withdraw Advertisement
    unad_payload = {
        "node_id": "node_test_seeder_01",
        "cid": "bafybeic11223344556677889900112233445566",
    }
    res3 = client.post("/api/v1/sharing/unadvertise", json=unad_payload)
    assert res3.status_code == 200
    assert res3.json()["data"]["status"] == "unadvertised"
