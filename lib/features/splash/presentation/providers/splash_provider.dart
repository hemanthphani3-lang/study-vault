import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State of the splash screen bootstrap initialization.
enum SplashStatus { initializing, ready, complete }

/// StateNotifier controlling the animated splash sequence and initialization readiness.
class SplashNotifier extends StateNotifier<SplashStatus> {
  SplashNotifier() : super(SplashStatus.initializing) {
    _initialize();
  }

  Future<void> _initialize() async {
    // Scaffold for future bootstrap routines (DB migrations, P2P keyring validation)
    await Future<void>.delayed(const Duration(milliseconds: 1800));
    state = SplashStatus.ready;
  }

  void markComplete() {
    state = SplashStatus.complete;
  }
}

final StateNotifierProvider<SplashNotifier, SplashStatus> splashProvider =
    StateNotifierProvider<SplashNotifier, SplashStatus>(
  (Ref ref) => SplashNotifier(),
);
