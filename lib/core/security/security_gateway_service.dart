import '../network/api_client.dart';
import '../network/api_exceptions.dart';
import 'security_audit_logger.dart';
import 'security_models.dart';
import 'verification_pipeline.dart';

/// Central SVSG/1.0 Security Gateway Service managing Zero Trust authorizations.
class SecurityGatewayService {
  SecurityGatewayService({
    required ApiClient apiClient,
    VerificationPipeline? pipeline,
    SecurityAuditLogger? auditLogger,
  })  : _client = apiClient,
        _pipeline = pipeline ?? VerificationPipeline(),
        _auditLogger = auditLogger ?? SecurityAuditLogger();

  final ApiClient _client;
  final VerificationPipeline _pipeline;
  final SecurityAuditLogger _auditLogger;

  SecurityAuditLogger get auditLogger => _auditLogger;

  /// Authorizes a transfer request through local 11-stage pipeline and syncs with Gateway backend.
  Future<SecurityAuthResponse> authorizeTransfer(SecurityAuthRequest request) async {
    // Local pipeline execution (Zero Trust at edge)
    final SecurityAuthResponse localResult = _pipeline.executePipeline(request);

    if (!localResult.isAuthorized) {
      return localResult;
    }

    // Backend Gateway validation check
    try {
      final Map<String, dynamic> response = await _client.post(
        '/api/v1/security/authorize',
        request.toJson(),
      );

      final Map<String, dynamic> data = response['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
      final bool backendAuth = data['is_authorized'] as bool? ?? true;
      final String token = data['auth_token'] as String? ?? localResult.authToken ?? 'svsg_auth_fallback';

      if (!backendAuth) {
        return SecurityAuthResponse(
          isAuthorized: false,
          status: SecurityState.rejected,
          failureReason: data['failure_reason'] as String? ?? 'Backend security gate rejected session',
          authorizedAt: DateTime.now().toUtc(),
        );
      }

      return SecurityAuthResponse(
        isAuthorized: true,
        status: SecurityState.authorized,
        authToken: token,
        validationResults: localResult.validationResults,
        authorizedAt: DateTime.now().toUtc(),
      );
    } on ApiException {
      // Local Fallback Authorization when backend is offline
      return localResult;
    } catch (_) {
      return localResult;
    }
  }

  /// Returns historical security audit logs.
  List<SecurityAuditEntry> getAuditLogs() => _auditLogger.logs;
}
