import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_exceptions.dart';
import '../../dtos/resource_dto.dart';
import '../../models/resource_model.dart';

/// Remote data source interface. Guarantees Flutter never calls
/// the Resource Discovery Service directly — all traffic routes
/// through the FastAPI backend gateway.
abstract interface class IRemoteDataSource {
  /// Fetches a paginated page of resources from the FastAPI backend.
  Future<List<ResourceModel>> fetchRemoteCatalog({int page = 1, int limit = 50});

  /// Fetches metadata for a single academic resource by its backend [id].
  Future<ResourceModel?> fetchRemoteBookDetails(String id);

  /// Fetches metadata for a research paper by its backend [id].
  Future<ResourceModel?> fetchRemotePaperDetails(String id);

  /// Queries the backend catalog for resources matching [query].
  Future<List<ResourceModel>> queryRemoteMesh(String query);

  /// Fetches all resources updated after [since] for incremental sync.
  Future<List<ResourceModel>> fetchUpdatedSince(DateTime since);
}

/// Concrete implementation of [IRemoteDataSource] backed by [ApiClient].
///
/// Sprint 8 Contract: Flutter NEVER communicates with the Resource Discovery
/// Service directly. All communication passes through the FastAPI Backend API.
class RemoteDataSourceImpl implements IRemoteDataSource {
  const RemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<List<ResourceModel>> fetchRemoteCatalog({
    int page = 1,
    int limit = 50,
  }) async {
    final offset = (page - 1) * limit;
    final json = await _client.get(
      ApiEndpoints.resources,
      queryParams: <String, String>{
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );
    return _parseResourceList(json);
  }

  @override
  Future<ResourceModel?> fetchRemoteBookDetails(String id) async {
    try {
      final json = await _client.get(ApiEndpoints.resourceById(id));
      return _parseSingleResource(json);
    } on NotFoundException {
      return null;
    }
  }

  @override
  Future<ResourceModel?> fetchRemotePaperDetails(String id) =>
      fetchRemoteBookDetails(id);

  @override
  Future<List<ResourceModel>> queryRemoteMesh(String query) async {
    final json = await _client.get(
      ApiEndpoints.resources,
      queryParams: <String, String>{'query': query, 'limit': '50'},
    );
    return _parseResourceList(json);
  }

  @override
  Future<List<ResourceModel>> fetchUpdatedSince(DateTime since) async {
    final json = await _client.get(
      ApiEndpoints.resources,
      queryParams: <String, String>{
        'updated_after': since.toUtc().toIso8601String(),
        'limit': '200',
      },
    );
    return _parseResourceList(json);
  }

  // ─── Private Parsers ──────────────────────────────────────────────────────

  List<ResourceModel> _parseResourceList(Map<String, dynamic> json) {
    final rawItems = json['items'] as List<dynamic>? ??
        (json['data'] is List ? json['data'] as List<dynamic> : <dynamic>[]);
    return rawItems
        .whereType<Map<String, dynamic>>()
        .map((Map<String, dynamic> item) => ResourceDto.fromJson(item).toDomain())
        .toList();
  }

  ResourceModel? _parseSingleResource(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;
    if (data.isEmpty) return null;
    return ResourceDto.fromJson(data).toDomain();
  }
}
