import 'peer_node_model.dart';

/// Modular Peer Ranking Engine scoring and sorting candidate peer seeders.
/// Adheres to SVDP Specification (SVE-003 Section 5).
class PeerRankingEngine {
  const PeerRankingEngine();

  /// Weights for composite score calculation
  static const double weightAvailability = 0.40;
  static const double weightCapabilities = 0.30;
  static const double weightGeography = 0.20;
  static const double weightLatency = 0.10;

  /// Ranks a list of candidate peers and returns a new sorted list (highest score first).
  List<PeerNodeModel> rankPeers(
    List<PeerNodeModel> peers, {
    String clientCountry = 'US',
    String? clientRegion,
  }) {
    final List<PeerNodeModel> scored = peers.map((PeerNodeModel peer) {
      final double score = calculatePeerScore(
        peer,
        clientCountry: clientCountry,
        clientRegion: clientRegion,
      );
      return peer.copyWith(rankScore: double.parse(score.toStringAsFixed(1)));
    }).toList();

    scored.sort((PeerNodeModel a, PeerNodeModel b) => b.rankScore.compareTo(a.rankScore));
    return scored;
  }

  /// Calculates composite score S in range [0, 100].
  double calculatePeerScore(
    PeerNodeModel peer, {
    required String clientCountry,
    String? clientRegion,
  }) {
    // 1. Availability Score A
    double scoreA = 0.0;
    if (peer.availability == 'online') {
      scoreA = 100.0;
    } else if (peer.availability == 'degraded') {
      scoreA = 50.0;
    }

    // 2. Capabilities Score C
    double scoreC = 0.0;
    if (peer.capabilities.contains('peer_seeder')) scoreC += 40.0;
    if (peer.capabilities.contains('full_node')) scoreC += 30.0;
    if (peer.capabilities.contains('metadata_relay')) scoreC += 30.0;
    if (scoreC > 100.0) scoreC = 100.0;

    // 3. Geographic Proximity Score G
    double scoreG = 20.0;
    if (peer.country.toUpperCase() == clientCountry.toUpperCase()) {
      scoreG = 100.0;
    } else if (clientRegion != null && peer.country.substring(0, 1) == clientCountry.substring(0, 1)) {
      scoreG = 60.0;
    }

    // 4. Latency Score L
    double scoreL = 100.0 - peer.pingMs;
    if (scoreL < 0.0) scoreL = 0.0;

    final double composite = (weightAvailability * scoreA) +
        (weightCapabilities * scoreC) +
        (weightGeography * scoreG) +
        (weightLatency * scoreL);

    return composite;
  }
}
