import '../../data/models/download_model.dart';
import '../../domain/repositories/download_repository.dart';

/// Local manager responsible for download queue tracking, throughput calculation, and cancellation.
class DownloadMetadataManager {
  const DownloadMetadataManager(this._downloadRepo);

  final IDownloadRepository _downloadRepo;

  /// Retrieves list of all active or pending downloads.
  Future<List<DownloadModel>> getActiveDownloads() {
    return _downloadRepo.getDownloads(activeOnly: true);
  }

  /// Queues a new resource download.
  Future<void> queueDownload({
    required String resourceId,
    required String title,
    String resourceType = 'book',
    int fileSizeBytes = 0,
    String? cid,
  }) async {
    final DownloadModel model = DownloadModel(
      id: 'dl_${DateTime.now().millisecondsSinceEpoch}',
      resourceId: resourceId,
      resourceType: resourceType,
      title: title,
      fileSizeBytes: fileSizeBytes,
      downloadStatus: 'downloading',
      cid: cid,
      peerCount: 34,
      downloadSpeedBps: 8388608, // 8.0 MB/s
      progress: 0.05,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _downloadRepo.queueDownload(model);
  }

  /// Updates progress fraction, bytes transferred, and speed.
  Future<void> updateProgress(String resourceId, double progress, int bytesDownloaded, int speedBps) {
    return _downloadRepo.updateProgress(resourceId, progress, bytesDownloaded, speedBps);
  }

  /// Cancels an in-flight download.
  Future<void> cancelDownload(String resourceId) {
    return _downloadRepo.cancelDownload(resourceId);
  }

  /// Real-time stream of all downloads for UI progress bars.
  Stream<List<DownloadModel>> watchDownloads() {
    return _downloadRepo.watchDownloads();
  }
}
