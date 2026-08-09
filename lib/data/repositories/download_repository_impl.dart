import '../../domain/repositories/download_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../models/download_model.dart';

/// Concrete repository implementation for Downloads using [ILocalDataSource].
class DownloadRepositoryImpl implements IDownloadRepository {
  const DownloadRepositoryImpl(this._localDataSource);

  final ILocalDataSource _localDataSource;

  @override
  Future<List<DownloadModel>> getDownloads({bool activeOnly = false}) {
    return _localDataSource.getDownloads(activeOnly: activeOnly);
  }

  @override
  Future<DownloadModel?> getDownloadByResourceId(String resourceId) {
    return _localDataSource.getDownloadByResourceId(resourceId);
  }

  @override
  Future<void> queueDownload(DownloadModel download) {
    return _localDataSource.saveDownload(download);
  }

  @override
  Future<void> updateProgress(String resourceId, double progress, int bytesDownloaded, int speedBps) {
    return _localDataSource.updateDownloadProgress(resourceId, progress, bytesDownloaded, speedBps);
  }

  @override
  Future<void> cancelDownload(String resourceId) async {
    final DownloadModel? item = await _localDataSource.getDownloadByResourceId(resourceId);
    if (item != null) {
      await _localDataSource.saveDownload(item.copyWith(downloadStatus: 'cancelled'));
    }
  }

  @override
  Stream<List<DownloadModel>> watchDownloads() {
    return _localDataSource.watchDownloads();
  }
}
