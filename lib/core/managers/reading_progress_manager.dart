import '../../data/models/reading_progress_model.dart';
import '../../domain/repositories/library_repository.dart';

/// Local manager responsible for tracking active reading sessions, pagination, and continue-reading telemetry.
class ReadingProgressManager {
  const ReadingProgressManager(this._libraryRepo);

  final ILibraryRepository _libraryRepo;

  /// Retrieves current reading progress for a given resource.
  Future<ReadingProgressModel?> getProgress(String resourceId) {
    return _libraryRepo.getReadingProgress(resourceId);
  }

  /// Updates current reading progress, page position, and duration.
  Future<void> updateProgress({
    required String resourceId,
    required String title,
    required int currentPage,
    required int totalPages,
    String? lastReadPosition,
    int additionalSeconds = 0,
  }) async {
    final double fraction = totalPages > 0 ? (currentPage / totalPages).clamp(0.0, 1.0) : 0.0;
    final ReadingProgressModel? existing = await _libraryRepo.getReadingProgress(resourceId);
    final int cumulativeSeconds = (existing?.timeSpentSeconds ?? 0) + additionalSeconds;

    final ReadingProgressModel model = ReadingProgressModel(
      id: existing?.id ?? 'prog_${DateTime.now().millisecondsSinceEpoch}',
      resourceId: resourceId,
      title: title,
      currentPage: currentPage,
      totalPages: totalPages,
      progress: fraction,
      lastReadPosition: lastReadPosition ?? existing?.lastReadPosition,
      timeSpentSeconds: cumulativeSeconds,
      lastReadAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _libraryRepo.updateReadingProgress(model);
  }

  /// Real-time stream of the most recent reading sessions for the dashboard.
  Stream<List<ReadingProgressModel>> watchRecentReading() {
    return _libraryRepo.watchRecentReading();
  }
}
