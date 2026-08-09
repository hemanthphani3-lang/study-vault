import 'trust_models.dart';

/// Configurable SVTF/1.0 Trust Policy Parameters.
class TrustPolicy {
  const TrustPolicy({
    this.weightAvailability = 0.25,
    this.weightIntegrity = 0.25,
    this.weightReliability = 0.25,
    this.weightSecurity = 0.15,
    this.weightFreshness = 0.10,
    this.decayRatePerHour = 5.0,
  });

  final double weightAvailability;
  final double weightIntegrity;
  final double weightReliability;
  final double weightSecurity;
  final double weightFreshness;
  final double decayRatePerHour;

  /// Evaluates [TrustState] based on composite score [overallScore].
  TrustState determineTrustState(double overallScore, {bool isNewNode = false, bool wasRestricted = false}) {
    if (isNewNode) return TrustState.newNode;
    if (overallScore >= 90.0) return TrustState.highlyTrusted;
    if (overallScore >= 70.0) return TrustState.trusted;
    if (wasRestricted && overallScore >= 30.0) return TrustState.recovery;
    if (overallScore >= 50.0) return TrustState.newNode;
    if (overallScore >= 30.0) return TrustState.warning;
    return TrustState.restricted;
  }
}
