import 'dca_models.dart';
import 'local_content_registry.dart';

/// Pin Manager controlling pinning lifecycle, storage quotas, and LRU pin pruning.
class PinManager {
  PinManager({
    LocalContentRegistry? registry,
    this.maxQuotaBytes = defaultQuotaBytes,
  }) : _registry = registry ?? LocalContentRegistry();

  static const int defaultQuotaBytes = 10737418240; // 10 GB
  final int maxQuotaBytes;
  final LocalContentRegistry _registry;

  LocalContentRegistry get registry => _registry;

  bool pin(String cid) {
    return _registry.updatePinStatus(cid, PinStatus.pinned);
  }

  bool unpin(String cid) {
    return _registry.updatePinStatus(cid, PinStatus.unpinned);
  }

  List<ContentRecord> listPins() => _registry.pinnedRecords;

  /// Checks if adding [newBytes] exceeds maximum storage quota.
  bool isQuotaAvailable(int newBytes) {
    final int currentTotal = _registry.allRecords.fold(0, (int sum, ContentRecord r) => sum + r.fileSizeBytes);
    return (currentTotal + newBytes) <= maxQuotaBytes;
  }
}
