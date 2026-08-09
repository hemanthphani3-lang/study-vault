import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../security/policy_engine.dart';
import '../security/security_audit_logger.dart';
import '../security/security_gateway_service.dart';
import '../security/verification_pipeline.dart';
import 'data_providers.dart';

final Provider<PolicyEngine> policyEngineProvider = Provider<PolicyEngine>((Ref ref) {
  return PolicyEngine();
});

final Provider<SecurityAuditLogger> securityAuditLoggerProvider = Provider<SecurityAuditLogger>((Ref ref) {
  return SecurityAuditLogger();
});

final Provider<VerificationPipeline> verificationPipelineProvider = Provider<VerificationPipeline>((Ref ref) {
  final engine = ref.watch(policyEngineProvider);
  final logger = ref.watch(securityAuditLoggerProvider);
  return VerificationPipeline(policyEngine: engine, auditLogger: logger);
});

final Provider<SecurityGatewayService> securityGatewayServiceProvider = Provider<SecurityGatewayService>((Ref ref) {
  final client = ref.watch(apiClientProvider);
  final pipeline = ref.watch(verificationPipelineProvider);
  final logger = ref.watch(securityAuditLoggerProvider);

  return SecurityGatewayService(
    apiClient: client,
    pipeline: pipeline,
    auditLogger: logger,
  );
});
