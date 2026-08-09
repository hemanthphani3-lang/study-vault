import 'trust_models.dart';
import 'trust_policy.dart';

/// 5-Dimensional Trust Calculator Engine for SVTF/1.0.
class TrustCalculator {
  TrustCalculator({TrustPolicy? policy}) : policy = policy ?? const TrustPolicy();

  final TrustPolicy policy;

  /// Calculates composite [TrustScore] from a node's [history].
  TrustScore computeScore(NodeHistory history) {
    // 1. Availability Score (S_avail)
    final int totalHeartbeats = history.heartbeatCount + history.heartbeatTimeouts;
    final double availScore = totalHeartbeats == 0
        ? 50.0
        : ((history.heartbeatCount / totalHeartbeats) * 100.0).clamp(0.0, 100.0);

    // 2. Integrity Score (S_integrity)
    final int totalIntegrity = history.integritySuccesses + history.integrityFailures;
    final double integrityScore = totalIntegrity == 0
        ? 50.0
        : ((history.integritySuccesses / totalIntegrity) * 100.0).clamp(0.0, 100.0);

    // 3. Reliability Score (S_reliability)
    final int totalTransfers = history.successfulTransfers + history.failedTransfers;
    final double relScore = totalTransfers == 0
        ? 50.0
        : ((history.successfulTransfers / totalTransfers) * 100.0).clamp(0.0, 100.0);

    // 4. Security Score (S_security)
    final double secScore = (100.0 - (20.0 * history.securityViolations)).clamp(0.0, 100.0);

    // 5. Freshness Score (S_freshness)
    final now = DateTime.now().toUtc();
    final double hoursInactive = now.difference(history.lastSeenTime.toUtc()).inMilliseconds / (1000.0 * 3600.0);
    final double freshnessScore = (100.0 - (policy.decayRatePerHour * hoursInactive)).clamp(0.0, 100.0);

    // Composite Weighted Calculation
    final double overall = (availScore * policy.weightAvailability) +
        (integrityScore * policy.weightIntegrity) +
        (relScore * policy.weightReliability) +
        (secScore * policy.weightSecurity) +
        (freshnessScore * policy.weightFreshness);

    final bool isNew = totalTransfers == 0 && totalHeartbeats == 0;
    final TrustState state = policy.determineTrustState(overall, isNewNode: isNew);

    return TrustScore(
      overallScore: double.parse(overall.toStringAsFixed(1)),
      availabilityScore: double.parse(availScore.toStringAsFixed(1)),
      integrityScore: double.parse(integrityScore.toStringAsFixed(1)),
      reliabilityScore: double.parse(relScore.toStringAsFixed(1)),
      securityScore: double.parse(secScore.toStringAsFixed(1)),
      freshnessScore: double.parse(freshnessScore.toStringAsFixed(1)),
      trustState: state,
    );
  }
}
