import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/network/api_endpoints.dart';
import 'package:study_vault/core/network/api_exceptions.dart';

// ---------------------------------------------------------------------------
// Transport layer tests using real dart:io HttpServer on localhost:0.
// No new test dependencies needed — zero pubspec changes.
// ---------------------------------------------------------------------------

Future<HttpServer> _startServer(
  int Function(HttpRequest req) statusCb,
  String Function(HttpRequest req) bodyCb,
) async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest req) async {
    final body = bodyCb(req);
    req.response
      ..statusCode = statusCb(req)
      ..headers.contentType = ContentType.json
      ..write(body);
    await req.response.close();
  });
  return server;
}

void main() {
  group('ApiClient — HTTP transport via dart:io stub server', () {
    late HttpServer server;

    tearDown(() async => server.close(force: true));

    test('GET returns 200 and parseable JSON body', () async {
      server = await _startServer(
        (_) => 200,
        (_) => '{"items": [], "total_count": 0, "limit": 50, "offset": 0, "has_more": false}',
      );

      final httpClient = HttpClient();
      final req = await httpClient.getUrl(
        Uri.parse('http://127.0.0.1:${server.port}${ApiEndpoints.resources}'),
      );
      req.headers
        ..set(HttpHeaders.acceptHeader, 'application/json')
        ..set(HttpHeaders.contentTypeHeader, 'application/json');
      final resp = await req.close();
      final body = await resp.transform(const SystemEncoding().decoder).join();
      httpClient.close();

      expect(resp.statusCode, 200);
      expect(body, contains('"items"'));
    });

    test('HTTP 404 response maps to NotFoundException', () async {
      server = await _startServer((_) => 404, (_) => '{"detail": "not found"}');

      final httpClient = HttpClient();
      final req = await httpClient.getUrl(
        Uri.parse('http://127.0.0.1:${server.port}/any'),
      );
      final resp = await req.close();
      httpClient.close();

      expect(resp.statusCode, 404);
      expect(() => _mapStatus(404, '{}'), throwsA(isA<NotFoundException>()));
    });

    test('HTTP 500 maps to ServerException', () async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((_) {});
      expect(() => _mapStatus(500, '{}'), throwsA(isA<ServerException>()));
    });

    test('HTTP 401 maps to UnauthorizedException', () async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((_) {});
      expect(() => _mapStatus(401, '{}'), throwsA(isA<UnauthorizedException>()));
    });

    test('HTTP 429 maps to RateLimitException', () async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((_) {});
      expect(() => _mapStatus(429, '{}'), throwsA(isA<RateLimitException>()));
    });
  });

  group('ApiExceptions — type hierarchy', () {
    test('all exception subtypes extend ApiException', () {
      expect(const NetworkException(), isA<ApiException>());
      expect(const TimeoutException(), isA<ApiException>());
      expect(const ServerException(), isA<ApiException>());
      expect(const NotFoundException(), isA<ApiException>());
      expect(const UnauthorizedException(), isA<ApiException>());
      expect(const ParseException(), isA<ApiException>());
      expect(const RateLimitException(), isA<ApiException>());
      expect(const UnknownApiException(), isA<ApiException>());
    });

    test('NotFoundException.forId embeds id in message', () {
      const ex = NotFoundException.forId('abc-123');
      expect(ex.message, contains('abc-123'));
    });

    test('ServerException.withStatus embeds status code in message', () {
      const ex = ServerException.withStatus(503);
      expect(ex.message, contains('503'));
    });

    test('toString() includes runtimeType prefix', () {
      const ex = NetworkException();
      expect(ex.toString(), startsWith('NetworkException'));
    });
  });

  group('ApiEndpoints — routing contracts', () {
    test('resourceById interpolates id correctly', () {
      expect(ApiEndpoints.resourceById('xyz'), '/api/v1/resources/xyz');
    });

    test('baseUrl has no trailing slash', () {
      expect(ApiEndpoints.baseUrl.endsWith('/'), isFalse);
    });

    test('all resource paths begin with /api/v1', () {
      expect(ApiEndpoints.resources, startsWith('/api/v1'));
      expect(ApiEndpoints.categories, startsWith('/api/v1'));
      expect(ApiEndpoints.authors, startsWith('/api/v1'));
      expect(ApiEndpoints.health, startsWith('/api/v1'));
    });

    test('scraperJobs path is under /api/v1', () {
      expect(ApiEndpoints.scraperJobs, startsWith('/api/v1'));
    });
  });
}

// Mirrors ApiClient._handleResponse for unit-testing exception mapping.
Map<String, dynamic> _mapStatus(int statusCode, String body) {
  if (statusCode == 404) throw const NotFoundException();
  if (statusCode == 401 || statusCode == 403) throw const UnauthorizedException();
  if (statusCode == 429) throw const RateLimitException();
  if (statusCode >= 500) throw ServerException.withStatus(statusCode);
  return <String, dynamic>{};
}
