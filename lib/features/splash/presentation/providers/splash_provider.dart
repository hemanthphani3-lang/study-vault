import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State of the splash screen bootstrap initialization.
enum SplashStatus { initializing, ready, complete }

/// StateNotifier controlling the animated splash sequence and initialization readiness.
class SplashNotifier extends StateNotifier<SplashStatus> {
  SplashNotifier() : super(SplashStatus.initializing) {
    _initialize();
  }

  Timer? _timer;

  void _initialize() {
    _timer = Timer(const Duration(milliseconds: 1800), () {
      if (mounted) {
        state = SplashStatus.ready;
      }
    });
  }

  void markComplete() {
    if (mounted) {
      state = SplashStatus.complete;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final StateNotifierProvider<SplashNotifier, SplashStatus> splashProvider =
    StateNotifierProvider<SplashNotifier, SplashStatus>(
  (Ref ref) => SplashNotifier(),
);

