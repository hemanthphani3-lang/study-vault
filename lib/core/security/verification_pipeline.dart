import '../crypto/sha256_helper.dart';
import 'policy_engine.dart';
import 'security_audit_logger.dart';
import 'security_models.dart';

/// SVSG/1.0 11-Stage Verification Pipeline implementation.
class VerificationPipeline {
  VerificationPipeline({
    PolicyEngine? policyEngine,
    SecurityAuditLogger? auditLogger,
  })  : _policyEngine = policyEngine ?? PolicyEngine(),
        _auditLogger = auditLogger ?? SecurityAuditLogger();

  final PolicyEngine _policyEngine;
  final SecurityAuditLogger _auditLogger;

  /// Executes the 11-stage Zero Trust verification pipeline on [request].
  SecurityAuthResponse executePipeline(SecurityAuthRequest request) {
    final Map<String, bool> validationResults = _policyEngine.evaluatePolicies(request);
    final String sessionId = 'sess_${request.metadataId}_${request.nonce.substring(0, request.nonce.length > 8 ? 8 : request.nonce.length)}';

    // Check if any rule failed
    final bool allPassed = validationResults.values.every((bool pass) => pass);

    if (!allPassed) {
      final List<String> failedRules = validationResults.entries
          .where((MapEntry<String, bool> e) => !e.value)
          .map((MapEntry<String, bool> e) => e.key)
          .toList();

      final String reason = 'Zero Trust Policy Failed: ${failedRules.join(", ")}';

      _auditLogger.logEvent(
        nodeId: request.nodeId,
        sessionId: sessionId,
        eventType: failedRules.contains('nonce_uniqueness') ? 'REPLAY_ATTEMPT' : 'POLICY_VIOLATION',
        policyDecision: 'REJECTED',
        details: reason,
      );

      return SecurityAuthResponse(
        isAuthorized: false,
        status: SecurityState.rejected,
        failureReason: reason,
        validationResults: validationResults,
        authorizedAt: DateTime.now().toUtc(),
      );
    }

    // Generate signed Authorization Token (svsg_auth_<hash>)
    final String tokenSource = '${request.nodeId}:${request.metadataId}:${request.nonce}:SVSG_SECRET_SALT_2026';
    final String authToken = 'svsg_auth_${Sha256Helper.hashString(tokenSource).substring(0, 32)}';

    _auditLogger.logEvent(
      nodeId: request.nodeId,
      sessionId: sessionId,
      eventType: 'SUCCESSFUL_VALIDATION',
      policyDecision: 'AUTHORIZED',
      details: 'Issued authorization token for metadata ${request.metadataId}',
    );

    return SecurityAuthResponse(
      isAuthorized: true,
      status: SecurityState.authorized,
      authToken: authToken,
      validationResults: validationResults,
      authorizedAt: DateTime.now().toUtc(),
    );
  }
}
