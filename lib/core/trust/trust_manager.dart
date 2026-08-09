import 'trust_engine.dart';
import 'trust_models.dart';

/// Central Trust Framework Orchestrator for SVTF/1.0.
class TrustManager {
  TrustManager({TrustEngine? engine}) : _engine = engine ?? TrustEngine();

  final TrustEngine _engine;

  TrustEngine get engine => _engine;

  /// Returns active [TrustScore] for a peer node.
  TrustScore getNodeTrustScore(String nodeId) {
    return _engine.getScore(nodeId);
  }

  /// Returns [NodeHistory] for a peer node.
  NodeHistory getNodeHistory(String nodeId) {
    return _engine.storage.getOrCreateHistory(nodeId);
  }

  /// Returns historical trust audit events.
  List<TrustEvent> getTrustEvents() => _engine.storage.allEvents;

  /// Returns cluster telemetry metrics.
  TrustMetrics getMetrics() {
    final histories = _engine.storage.allHistories;
    if (histories.isEmpty) {
      return const TrustMetrics(
        totalNodesTracked: 0,
        trustedNodesCount: 0,
        restrictedNodesCount: 0,
        averageTrustScore: 50.0,
        totalEventsProcessed: 0,
      );
    }

    int trusted = 0;
    int restricted = 0;
    double sumScore = 0.0;

    for (final history in histories) {
      final score = _engine.getScore(history.nodeId);
      sumScore += score.overallScore;
      if (score.overallScore >= 70.0) trusted++;
      if (score.overallScore < 30.0) restricted++;
    }

    return TrustMetrics(
      totalNodesTracked: histories.length,
      trustedNodesCount: trusted,
      restrictedNodesCount: restricted,
      averageTrustScore: double.parse((sumScore / histories.length).toStringAsFixed(1)),
      totalEventsProcessed: _engine.storage.allEvents.length,
    );
  }
}
