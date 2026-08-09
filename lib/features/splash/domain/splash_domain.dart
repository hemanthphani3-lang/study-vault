/// Splash feature domain layer interface.
abstract interface class ISplashRepository {
  Future<bool> checkFirstRun();
  Future<void> prefetchBootstrapPeers();
}
