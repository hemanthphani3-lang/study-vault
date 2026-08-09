import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_register_node_success(tracker_client: AsyncClient):
    payload = {
        "node_id": "node_alpha_001",
        "public_key": "a" * 64,
        "fingerprint": "SHA256:AA:BB:CC:DD:EE:FF:11:22",
        "signature": "b" * 128,
        "platform": "flutter",
        "app_version": "0.10.0-alpha",
        "country_code": "US",
        "region": "us-east",
        "capabilities": ["metadata_relay", "search_index"],
        "available_metadata_ids": ["res_001", "res_002"],
        "network_address": "192.168.1.100:8000",
    }
    response = await tracker_client.post("/api/v1/tracker/register", json=payload)
    assert response.status_code == 201
    body = response.json()
    assert body["success"] is True
    assert body["data"]["node_id"] == "node_alpha_001"
    assert body["data"]["public_key"] == "a" * 64
    assert body["data"]["fingerprint"] == "SHA256:AA:BB:CC:DD:EE:FF:11:22"
    assert body["data"]["is_online"] is True
    assert body["data"]["metadata_count"] == 2


@pytest.mark.asyncio
async def test_heartbeat_success(tracker_client: AsyncClient):
    # 1. Register node first
    reg_payload = {
        "node_id": "node_hb_002",
        "platform": "flutter",
        "country_code": "DE",
    }
    await tracker_client.post("/api/v1/tracker/register", json=reg_payload)

    # 2. Send heartbeat
    hb_payload = {
        "node_id": "node_hb_002",
        "active_connections": 5,
        "status": "healthy",
    }
    response = await tracker_client.post("/api/v1/tracker/heartbeat", json=hb_payload)
    assert response.status_code == 200
    body = response.json()
    assert body["success"] is True
    assert body["data"]["acknowledged"] is True
    assert body["data"]["is_online"] is True


@pytest.mark.asyncio
async def test_heartbeat_unknown_node_raises_404(tracker_client: AsyncClient):
    hb_payload = {"node_id": "non_existent_node_999"}
    response = await tracker_client.post("/api/v1/tracker/heartbeat", json=hb_payload)
    assert response.status_code == 404
    body = response.json()
    assert body["success"] is False
    assert body["error"]["type"] == "NodeNotFoundException"


@pytest.mark.asyncio
async def test_peer_discovery(tracker_client: AsyncClient):
    # Register 2 nodes carrying target metadata 'res_math_101'
    await tracker_client.post("/api/v1/tracker/register", json={
        "node_id": "seeder_node_1",
        "available_metadata_ids": ["res_math_101"],
        "network_address": "10.0.0.1:8000",
    })
    await tracker_client.post("/api/v1/tracker/register", json={
        "node_id": "seeder_node_2",
        "available_metadata_ids": ["res_math_101"],
        "network_address": "10.0.0.2:8000",
    })

    # Discover peers
    response = await tracker_client.get("/api/v1/tracker/discover?metadata_id=res_math_101")
    assert response.status_code == 200
    body = response.json()
    assert body["success"] is True
    assert body["data"]["metadata_id"] == "res_math_101"
    assert body["data"]["total_seeders"] == 2
    assert len(body["data"]["online_peers"]) == 2


@pytest.mark.asyncio
async def test_metadata_update_and_query(tracker_client: AsyncClient):
    await tracker_client.post("/api/v1/tracker/register", json={
        "node_id": "meta_node_1",
        "available_metadata_ids": ["meta_100"],
    })

    # Add meta_200, remove meta_100
    update_payload = {
        "node_id": "meta_node_1",
        "metadata_ids_to_add": ["meta_200"],
        "metadata_ids_to_remove": ["meta_100"],
    }
    resp = await tracker_client.post("/api/v1/tracker/metadata", json=update_payload)
    assert resp.status_code == 200
    body = resp.json()
    assert body["data"]["total_metadata_registered"] == 1
    assert body["data"]["added_count"] == 1
    assert body["data"]["removed_count"] == 1

    # Query metadata info for meta_200
    info_resp = await tracker_client.get("/api/v1/tracker/metadata/meta_200")
    assert info_resp.status_code == 200
    info_body = info_resp.json()
    assert info_body["data"]["total_nodes_available"] == 1
    assert "meta_node_1" in info_body["data"]["available_node_ids"]


@pytest.mark.asyncio
async def test_node_status_endpoint(tracker_client: AsyncClient):
    await tracker_client.post("/api/v1/tracker/register", json={
        "node_id": "status_node_77",
        "country_code": "CH",
        "region": "Zurich",
    })

    resp = await tracker_client.get("/api/v1/tracker/status/status_node_77")
    assert resp.status_code == 200
    body = resp.json()
    assert body["data"]["node_id"] == "status_node_77"
    assert body["data"]["is_online"] is True
    assert body["data"]["country_code"] == "CH"


@pytest.mark.asyncio
async def test_global_statistics(tracker_client: AsyncClient):
    await tracker_client.post("/api/v1/tracker/register", json={"node_id": "stat_node_1", "country_code": "US"})
    await tracker_client.post("/api/v1/tracker/register", json={"node_id": "stat_node_2", "country_code": "GB"})

    resp = await tracker_client.get("/api/v1/tracker/statistics")
    assert resp.status_code == 200
    body = resp.json()
    assert body["success"] is True
    assert body["data"]["total_registered_nodes"] == 2
    assert body["data"]["online_nodes"] == 2
    assert body["data"]["active_countries_count"] == 2
    assert body["data"]["nodes_by_country"]["US"] == 1
    assert body["data"]["nodes_by_country"]["GB"] == 1
