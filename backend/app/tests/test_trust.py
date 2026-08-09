import pytest
from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)

def test_trust_status_endpoint():
    response = client.get("/api/v1/trust/status")
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["data"]["version"] == "SVTF/1.0"
    assert data["data"]["permanent_blacklists"] is False

def test_trust_node_query_and_event_recording():
    node_id = "node_test_eval_01"

    # Step 1: Query initial score
    res1 = client.get(f"/api/v1/trust/node/{node_id}")
    assert res1.status_code == 200
    assert res1.json()["data"]["node_id"] == node_id

    # Step 2: Record a transfer success event
    event_payload = {
        "node_id": node_id,
        "event_type": "TRANSFER_SUCCESS",
        "score_delta": 2.0,
        "details": "Successful transfer of 1048576 bytes",
    }
    res2 = client.post("/api/v1/trust/event", json=event_payload)
    assert res2.status_code == 200
    assert res2.json()["data"]["event_type"] == "TRANSFER_SUCCESS"

    # Step 3: Verify metrics
    res3 = client.get("/api/v1/trust/metrics")
    assert res3.status_code == 200
    assert res3.json()["data"]["total_events_processed"] >= 1
