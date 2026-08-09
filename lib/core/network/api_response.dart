
/// Generic typed response wrapper from the StudyVault FastAPI backend.
///
/// Mirrors the FastAPI `BaseResponse<T>` and `PaginatedResponse<T>` schemas.
class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final T data;
  final String? message;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromData,
  ) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? true,
      data: fromData(json['data']),
      message: json['message'] as String?,
    );
  }
}

/// Typed paginated response container matching FastAPI `PaginatedResponse<T>`.
class PaginatedApiResponse<T> {
  const PaginatedApiResponse({
    required this.items,
    required this.totalCount,
    required this.limit,
    required this.offset,
    required this.hasMore,
  });

  final List<T> items;
  final int totalCount;
  final int limit;
  final int offset;
  final bool hasMore;

  factory PaginatedApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromItem,
  ) {
    final rawItems = json['items'] as List<dynamic>? ?? <dynamic>[];
    return PaginatedApiResponse<T>(
      items: rawItems
          .whereType<Map<String, dynamic>>()
          .map(fromItem)
          .toList(),
      totalCount: json['total_count'] as int? ?? 0,
      limit: json['limit'] as int? ?? 50,
      offset: json['offset'] as int? ?? 0,
      hasMore: json['has_more'] as bool? ?? false,
    );
  }
}
