import 'dca_interface.dart';
import 'dca_models.dart';

/// Storage Manager managing local disk quotas, metrics, and LRU garbage collection.
class StorageManager {
  StorageManager({required DcaInterface dcaInterface}) : _dca = dcaInterface;

  final DcaInterface _dca;

  Future<StorageMetrics> fetchMetrics() async {
    return _dca.getStorageMetrics();
  }

  /// Runs Garbage Collection (GC) by unpinning LRU unreferenced records if usage > 90%.
  Future<int> runGarbageCollection() async {
    final metrics = await fetchMetrics();
    if (metrics.usageRatio < 0.90) return 0; // Usage within quota bounds

    final pins = await _dca.listPins();
    // Sort by lastAccessTime ascending (LRU first)
    pins.sort((ContentRecord a, ContentRecord b) => a.lastAccessTime.compareTo(b.lastAccessTime));

    int unpinnedCount = 0;
    for (final record in pins) {
      if (record.referenceCount <= 1) {
        await _dca.unpinContent(record.cid);
        unpinnedCount++;
        final updatedMetrics = await fetchMetrics();
        if (updatedMetrics.usageRatio <= 0.75) break;
      }
    }
    return unpinnedCount;
  }
}
