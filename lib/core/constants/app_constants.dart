/// Global application constants and metadata.
abstract final class AppConstants {
  static const String appName = 'StudyVault';
  static const String appTagline = 'Knowledge Beyond Borders';
  static const String appVersion = '0.1.0-alpha';
  static const String appBuildNumber = '1';
  static const String appDescription =
      'Open Source Cross Platform Academic Knowledge Network';

  // --- Network Protocol Stubs ---
  static const String defaultP2PProtocol = '/studyvault/mesh/1.0.0';
  static const int defaultP2PPort = 4001;
  static const int maxPeerConnections = 64;

  // --- Storage & Cache Defaults ---
  static const int defaultCacheMaxAgeDays = 30;
  static const int maxRecentSearches = 15;
  static const int maxDownloadChunkBytes = 1024 * 1024; // 1 MB chunks
}
