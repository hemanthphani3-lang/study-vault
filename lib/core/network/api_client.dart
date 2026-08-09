import 'dart:convert';
import 'dart:io';

import 'api_endpoints.dart';
import 'api_exceptions.dart';

/// Low-level HTTP transport layer for the StudyVault FastAPI backend.
///
/// Features:
/// - Configurable request timeout (default 15 s)
/// - Structured `User-Agent` identifying the mobile client
/// - Status-code-driven exception mapping
/// - No third-party HTTP packages — uses `dart:io` `HttpClient`
class ApiClient {
  ApiClient({Duration? timeout})
      : _timeout = timeout ?? const Duration(seconds: 15);

  final Duration _timeout;

  static const String _userAgent = 'StudyVault-Mobile/0.8.0-alpha';

  // ─── Public Verbs ──────────────────────────────────────────────────────────

  /// Issues a GET request to [path] relative to [ApiEndpoints.baseUrl].
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    final uri = _buildUri(path, queryParams);
    return _send('GET', uri, null);
  }

  /// Issues a POST request with a JSON [body] map.
  Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    final uri = _buildUri(path, null);
    return _send('POST', uri, body);
  }

  // ─── Internal Helpers ──────────────────────────────────────────────────────

  Uri _buildUri(String path, Map<String, String>? queryParams) {
    final base = Uri.parse('${ApiEndpoints.baseUrl}$path');
    if (queryParams == null || queryParams.isEmpty) return base;
    return base.replace(queryParameters: queryParams);
  }

  Future<Map<String, dynamic>> _send(
    String method,
    Uri uri,
    Map<String, dynamic>? body,
  ) async {
    final client = HttpClient()..connectionTimeout = _timeout;
    try {
      final request = await client
          .openUrl(method, uri)
          .timeout(_timeout, onTimeout: () => throw const TimeoutException());

      request.headers
        ..set(HttpHeaders.contentTypeHeader, 'application/json')
        ..set(HttpHeaders.acceptHeader, 'application/json')
        ..set(HttpHeaders.userAgentHeader, _userAgent);

      if (body != null) {
        final encoded = utf8.encode(jsonEncode(body));
        request.headers.set(HttpHeaders.contentLengthHeader, encoded.length);
        request.add(encoded);
      }

      final response = await request
          .close()
          .timeout(_timeout, onTimeout: () => throw const TimeoutException());

      final responseBody = await response.transform(utf8.decoder).join();
      return _handleResponse(response.statusCode, responseBody);
    } on TimeoutException {
      rethrow;
    } on SocketException {
      throw const NetworkException();
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownApiException('Unexpected error: $e');
    } finally {
      client.close();
    }
  }

  Map<String, dynamic> _handleResponse(int statusCode, String body) {
    if (statusCode == 404) throw const NotFoundException();
    if (statusCode == 401 || statusCode == 403) throw const UnauthorizedException();
    if (statusCode == 429) throw const RateLimitException();
    if (statusCode >= 500) throw ServerException.withStatus(statusCode);

    if (statusCode >= 200 && statusCode < 300) {
      try {
        final decoded = jsonDecode(body);
        if (decoded is Map<String, dynamic>) return decoded;
        // Wrap non-object top-level responses
        return <String, dynamic>{'data': decoded};
      } catch (_) {
        throw const ParseException();
      }
    }

    throw ServerException.withStatus(statusCode);
  }
}
