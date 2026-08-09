import 'dart:math';

/// Bandwidth Limiter and Real-Time Transfer Speed Calculator.
class BandwidthLimiter {
  BandwidthLimiter({this.maxBytesPerSecond});

  int? maxBytesPerSecond;

  DateTime? _lastSampleTime;
  int _lastBytesCount = 0;
  double _currentSpeedBps = 0.0;

  double get currentSpeedBps => _currentSpeedBps;

  /// Formatted speed string (e.g., "1.5 MB/s" or "350.0 KB/s")
  String get formattedSpeed {
    if (_currentSpeedBps >= 1024 * 1024) {
      return '${(_currentSpeedBps / (1024 * 1024)).toStringAsFixed(2)} MB/s';
    } else if (_currentSpeedBps >= 1024) {
      return '${(_currentSpeedBps / 1024).toStringAsFixed(1)} KB/s';
    } else {
      return '${_currentSpeedBps.toStringAsFixed(0)} B/s';
    }
  }

  /// Updates transfer speed calculations based on total bytes downloaded so far.
  void updateProgress(int totalDownloadedBytes) {
    final now = DateTime.now();
    if (_lastSampleTime == null) {
      _lastSampleTime = now;
      _lastBytesCount = totalDownloadedBytes;
      return;
    }

    final elapsedSecs = now.difference(_lastSampleTime!).inMilliseconds / 1000.0;
    if (elapsedSecs >= 0.2) {
      final bytesDiff = max(0, totalDownloadedBytes - _lastBytesCount);
      final instantSpeed = bytesDiff / elapsedSecs;
      
      // Moving average smooth (0.7 old + 0.3 new)
      _currentSpeedBps = (_currentSpeedBps == 0.0)
          ? instantSpeed
          : (_currentSpeedBps * 0.7) + (instantSpeed * 0.3);

      _lastSampleTime = now;
      _lastBytesCount = totalDownloadedBytes;
    }
  }

  /// Estimates Time Remaining (ETA) in seconds.
  int estimateEtaSeconds(int remainingBytes) {
    if (_currentSpeedBps <= 0.0) return 0;
    return (remainingBytes / _currentSpeedBps).ceil();
  }

  /// Resets speed state.
  void reset() {
    _lastSampleTime = null;
    _lastBytesCount = 0;
    _currentSpeedBps = 0.0;
  }
}
