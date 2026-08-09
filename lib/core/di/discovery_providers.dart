import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../discovery/peer_discovery_service.dart';
import '../discovery/peer_ranking_engine.dart';
import 'data_providers.dart';

final Provider<PeerRankingEngine> peerRankingEngineProvider =
    Provider<PeerRankingEngine>((Ref ref) {
  return const PeerRankingEngine();
});

final Provider<PeerDiscoveryService> peerDiscoveryServiceProvider =
    Provider<PeerDiscoveryService>((Ref ref) {
  final client = ref.watch(apiClientProvider);
  final rankingEngine = ref.watch(peerRankingEngineProvider);
  return PeerDiscoveryService(apiClient: client, rankingEngine: rankingEngine);
});
