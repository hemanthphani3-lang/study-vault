import 'sharing_models.dart';

/// Zero-Trust Sharing Policy Engine evaluating user policies against hardware state.
class SharingPolicyEngine {
  SharingPolicyEngine({SharingPolicy? initialPolicy})
      : policy = initialPolicy ?? const SharingPolicy();

  SharingPolicy policy;

  /// Evaluates whether content sharing is allowed under current system conditions.
  Map<String, bool> evaluatePolicies({
    required bool isWifiConnected,
    required int batteryPercentage,
    required bool isCharging,
    required int currentSharedSizeBytes,
    required int activeUploadsCount,
  }) {
    final Map<String, bool> results = <String, bool>{};

    // Rule 1: Network Connection Policy
    results['network_allowed'] = policy.allowMobileData || isWifiConnected;

    // Rule 2: Battery Threshold Policy
    results['battery_threshold'] = batteryPercentage >= policy.minBatteryLevelPercentage || isCharging;

    // Rule 3: Charging Required Policy
    results['charging_satisfied'] = !policy.requireCharging || isCharging;

    // Rule 4: Storage Quota Policy
    results['quota_available'] = currentSharedSizeBytes <= policy.maxSharedQuotaBytes;

    // Rule 5: Concurrent Uploads Cap
    results['concurrency_allowed'] = activeUploadsCount < policy.maxConcurrentUploads;

    return results;
  }

  /// Returns true if all evaluated rules pass cleanly.
  bool isSharingPermitted({
    required bool isWifiConnected,
    required int batteryPercentage,
    required bool isCharging,
    required int currentSharedSizeBytes,
    required int activeUploadsCount,
  }) {
    final results = evaluatePolicies(
      isWifiConnected: isWifiConnected,
      batteryPercentage: batteryPercentage,
      isCharging: isCharging,
      currentSharedSizeBytes: currentSharedSizeBytes,
      activeUploadsCount: activeUploadsCount,
    );
    return results.values.every((bool pass) => pass);
  }
}
