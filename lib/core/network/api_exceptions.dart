/// Hierarchical exception model for all StudyVault network and API failures.
sealed class ApiException implements Exception {
  const ApiException(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// The device has no active internet connection.
final class NetworkException extends ApiException {
  const NetworkException([super.message = 'No internet connection. Operating in offline mode.']);
}

/// The HTTP request exceeded the configured timeout window.
final class TimeoutException extends ApiException {
  const TimeoutException([super.message = 'Request timed out. The backend may be unreachable.']);
}

/// The backend returned an HTTP 5xx status code.
final class ServerException extends ApiException {
  const ServerException([super.message = 'Backend server error. Please try again later.']);
  const ServerException.withStatus(int statusCode)
      : this('Backend returned HTTP $statusCode — Internal Server Error.');
}

/// The backend returned an HTTP 401 or 403 Unauthorized / Forbidden response.
/// Placeholder for future JWT / Node Authentication (Sprint 9+).
final class UnauthorizedException extends ApiException {
  const UnauthorizedException([super.message = 'Unauthorized. Authentication is required.']);
}

/// The requested academic resource was not found on the backend (HTTP 404).
final class NotFoundException extends ApiException {
  const NotFoundException([super.message = 'The requested resource was not found on the backend.']);
  const NotFoundException.forId(String id)
      : this('Academic resource with ID "$id" was not found on the backend.');
}

/// The server returned an invalid or malformed JSON body.
final class ParseException extends ApiException {
  const ParseException([super.message = 'Failed to parse backend response. Invalid JSON or schema mismatch.']);
}

/// Rate limiting (HTTP 429 Too Many Requests).
final class RateLimitException extends ApiException {
  const RateLimitException([super.message = 'Rate limit exceeded. Please slow down requests.']);
}

/// Catch-all for unexpected network-layer failures.
final class UnknownApiException extends ApiException {
  const UnknownApiException([super.message = 'An unexpected network error occurred.']);
}
