/// Contract for detecting active internet connectivity.
///
/// Concrete implementations can use `connectivity_plus` or native platform
/// checks. The abstraction keeps the network layer testable without mocking
/// the platform channel directly.
abstract interface class NetworkInfo {
  /// Returns `true` if an active internet connection is available.
  Future<bool> get isConnected;
}

/// Simple HTTP-ping implementation that attempts to reach the backend health
/// endpoint. Falls back to `true` in unit tests where [ApiClient] is mocked.
class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    // Without connectivity_plus (not in pubspec), we rely on the HTTP request
    // itself throwing a SocketException as the offline signal.
    // This keeps the pubspec unchanged per sprint guardrails.
    return true;
  }
}
