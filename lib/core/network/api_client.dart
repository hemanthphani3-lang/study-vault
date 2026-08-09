import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_endpoints.dart';
import 'api_exceptions.dart';

/// Low-level HTTP transport layer for the StudyVault FastAPI backend.
///
/// Uses `package:http` for cross-platform support (Flutter Web + native).
/// dart:io HttpClient does NOT work on Flutter Web — this fixes that.
class ApiClient {
  ApiClient({Duration? timeout, http.Client? httpClient})
      : _timeout = timeout ?? const Duration(seconds: 15),
        _client = httpClient ?? http.Client();

  final Duration _timeout;
  final http.Client _client;

  static const String _userAgent = 'StudyVault-Mobile/0.8.0-alpha';

  // ─── Public Verbs ──────────────────────────────────────────────────────────

  /// Issues a GET request to [path] relative to [ApiEndpoints.baseUrl].
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    final Uri uri = _buildUri(path, queryParams);
    return _send('GET', uri, null);
  }

  /// Issues a POST request with a JSON [body] map.
  Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    final Uri uri = _buildUri(path, null);
    return _send('POST', uri, body);
  }

  // ─── Internal Helpers ──────────────────────────────────────────────────────

  Uri _buildUri(String path, Map<String, String>? queryParams) {
    final Uri base = Uri.parse('${ApiEndpoints.baseUrl}$path');
    if (queryParams == null || queryParams.isEmpty) return base;
    return base.replace(queryParameters: queryParams);
  }

  Future<Map<String, dynamic>> _send(
    String method,
    Uri uri,
    Map<String, dynamic>? body,
  ) async {
    try {
      final Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': _userAgent,
      };

      http.Response response;
      if (method == 'GET') {
        response = await _client
            .get(uri, headers: headers)
            .timeout(_timeout, onTimeout: () => throw const TimeoutException());
      } else if (method == 'POST') {
        response = await _client
            .post(uri, headers: headers, body: body != null ? jsonEncode(body) : null)
            .timeout(_timeout, onTimeout: () => throw const TimeoutException());
      } else {
        throw UnknownApiException('Unsupported HTTP method: $method');
      }

      return _handleResponse(response.statusCode, response.body);
    } on TimeoutException {
      rethrow;
    } on ApiException {
      rethrow;
    } catch (e) {
      // On web, connection errors surface as different exceptions
      throw const NetworkException();

    }
  }

  Map<String, dynamic> _handleResponse(int statusCode, String body) {
    if (statusCode == 404) throw const NotFoundException();
    if (statusCode == 401 || statusCode == 403) throw const UnauthorizedException();
    if (statusCode == 429) throw const RateLimitException();
    if (statusCode >= 500) throw ServerException.withStatus(statusCode);

    if (statusCode >= 200 && statusCode < 300) {
      try {
        final dynamic decoded = jsonDecode(body);
        if (decoded is Map<String, dynamic>) return decoded;
        return <String, dynamic>{'data': decoded};
      } catch (_) {
        throw const ParseException();
      }
    }

    throw ServerException.withStatus(statusCode);
  }
}
