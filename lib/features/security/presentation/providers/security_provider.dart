import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/security_providers.dart';
import '../../../../core/security/security_gateway_service.dart';
import '../../../../core/security/security_models.dart';

class SecurityGatewayStateContainer {
  const SecurityGatewayStateContainer({
    this.lastResponse,
    this.auditLogs = const <SecurityAuditEntry>[],
    this.isValidating = false,
    this.errorMessage,
  });

  final SecurityAuthResponse? lastResponse;
  final List<SecurityAuditEntry> auditLogs;
  final bool isValidating;
  final String? errorMessage;

  SecurityGatewayStateContainer copyWith({
    SecurityAuthResponse? lastResponse,
    List<SecurityAuditEntry>? auditLogs,
    bool? isValidating,
    String? errorMessage,
  }) {
    return SecurityGatewayStateContainer(
      lastResponse: lastResponse ?? this.lastResponse,
      auditLogs: auditLogs ?? this.auditLogs,
      isValidating: isValidating ?? this.isValidating,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class SecurityGatewayNotifier extends Notifier<SecurityGatewayStateContainer> {
  @override
  SecurityGatewayStateContainer build() {
    return const SecurityGatewayStateContainer();
  }

  SecurityGatewayService get _service => ref.read(securityGatewayServiceProvider);

  Future<SecurityAuthResponse> authorizeSession(SecurityAuthRequest request) async {
    state = state.copyWith(isValidating: true, errorMessage: null);
    try {
      final SecurityAuthResponse response = await _service.authorizeTransfer(request);
      state = state.copyWith(
        lastResponse: response,
        auditLogs: _service.getAuditLogs(),
        isValidating: false,
      );
      return response;
    } catch (e) {
      state = state.copyWith(
        isValidating: false,
        errorMessage: 'Security Authorization Failed: $e',
      );
      rethrow;
    }
  }

  void refreshAuditLogs() {
    state = state.copyWith(auditLogs: _service.getAuditLogs());
  }
}

final NotifierProvider<SecurityGatewayNotifier, SecurityGatewayStateContainer> securityGatewayProvider =
    NotifierProvider<SecurityGatewayNotifier, SecurityGatewayStateContainer>(SecurityGatewayNotifier.new);
