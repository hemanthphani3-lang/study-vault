import '../domain/splash_domain.dart';

/// Splash data source and repository implementation.
class SplashRepositoryImpl implements ISplashRepository {
  const SplashRepositoryImpl();

  @override
  Future<bool> checkFirstRun() async => false;

  @override
  Future<void> prefetchBootstrapPeers() async {
    // Sprint 1 scaffold ready for future P2P bootstrap
  }
}
