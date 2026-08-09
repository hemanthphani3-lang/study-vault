import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/discovery/peer_node_model.dart';
import 'package:study_vault/core/discovery/peer_ranking_engine.dart';

void main() {
  group('PeerNodeModel & Serialization', () {
    test('PeerNodeModel deserializes correctly from JSON', () {
      final json = <String, dynamic>{
        'peer_id': 'peer_001',
        'node_id': 'node_alpha',
        'public_key': 'a' * 64,
        'fingerprint': 'SHA256:11:22:33:44',
        'country': 'CH',
        'capabilities': <String>['metadata_relay', 'peer_seeder'],
        'ping_ms': 35,
        'availability': 'online',
        'metadata_match': true,
        'trust_score': 1.0,
        'rank_score': 95.0,
        'connection_method': 'direct_p2p',
      };

      final peer = PeerNodeModel.fromJson(json);
      expect(peer.peerId, 'peer_001');
      expect(peer.nodeId, 'node_alpha');
      expect(peer.country, 'CH');
      expect(peer.capabilities, contains('peer_seeder'));
      expect(peer.pingMs, 35);
      expect(peer.availability, 'online');
    });

    test('toJson produces expected structure', () {
      const peer = PeerNodeModel(
        peerId: 'p1',
        nodeId: 'n1',
        publicKey: 'pubkey123',
        fingerprint: 'SHA256:FF',
        country: 'US',
        capabilities: <String>['metadata_relay'],
        pingMs: 20,
        availability: 'online',
        metadataMatch: true,
      );

      final json = peer.toJson();
      expect(json['peer_id'], 'p1');
      expect(json['node_id'], 'n1');
      expect(json['country'], 'US');
    });
  });

  group('PeerRankingEngine', () {
    late PeerRankingEngine engine;

    setUp(() {
      engine = const PeerRankingEngine();
    });

    test('ranks peers with same country and seeder capability higher', () {
      const p1 = PeerNodeModel(
        peerId: 'p_us_seeder',
        nodeId: 'n1',
        publicKey: 'k1',
        fingerprint: 'fp1',
        country: 'US',
        capabilities: <String>['peer_seeder', 'full_node'],
        pingMs: 20,
        availability: 'online',
        metadataMatch: true,
      );

      const p2 = PeerNodeModel(
        peerId: 'p_de_relay',
        nodeId: 'n2',
        publicKey: 'k2',
        fingerprint: 'fp2',
        country: 'DE',
        capabilities: <String>['metadata_relay'],
        pingMs: 150,
        availability: 'degraded',
        metadataMatch: true,
      );

      final ranked = engine.rankPeers(<PeerNodeModel>[p2, p1], clientCountry: 'US');

      expect(ranked.first.peerId, 'p_us_seeder');
      expect(ranked.first.rankScore, greaterThan(ranked.last.rankScore));
    });

    test('calculatePeerScore returns score in range [0, 100]', () {
      const peer = PeerNodeModel(
        peerId: 'p_test',
        nodeId: 'n_test',
        publicKey: 'k_test',
        fingerprint: 'fp_test',
        country: 'US',
        capabilities: <String>['peer_seeder', 'full_node', 'metadata_relay'],
        pingMs: 10,
        availability: 'online',
        metadataMatch: true,
      );

      final score = engine.calculatePeerScore(peer, clientCountry: 'US');
      expect(score, greaterThanOrEqualTo(0.0));
      expect(score, lessThanOrEqualTo(100.0));
    });
  });
}
