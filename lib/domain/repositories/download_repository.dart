import '../../data/models/download_model.dart';

/// Domain contract for managing local download queue, throughput, and progress tracking.
abstract interface class IDownloadRepository {
  Future<List<DownloadModel>> getDownloads({bool activeOnly = false});
  Future<DownloadModel?> getDownloadByResourceId(String resourceId);
  Future<void> queueDownload(DownloadModel download);
  Future<void> updateProgress(String resourceId, double progress, int bytesDownloaded, int speedBps);
  Future<void> cancelDownload(String resourceId);
  Stream<List<DownloadModel>> watchDownloads();
}
