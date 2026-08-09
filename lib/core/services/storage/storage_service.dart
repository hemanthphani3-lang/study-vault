/// Service managing offline vault storage quotas, paths, and capacity metrics.
class StorageService {
  const StorageService({
    this.maxQuotaBytes = 2147483648, // 2.0 GB default quota
  });

  final int maxQuotaBytes;

  /// Calculates storage usage fraction (0.0 to 1.0).
  double calculateUsageFraction(int usedBytes) {
    if (maxQuotaBytes <= 0) return 0.0;
    return (usedBytes / maxQuotaBytes).clamp(0.0, 1.0);
  }

  /// Formats raw byte count into human-readable MB / GB strings.
  String formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// Verifies if sufficient space remains before starting a large download.
  bool hasSufficientCapacity(int currentUsedBytes, int incomingSizeBytes) {
    return (currentUsedBytes + incomingSizeBytes) <= maxQuotaBytes;
  }
}
