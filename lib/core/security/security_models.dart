enum SecurityState {
  idle,
  validating,
  identityVerified,
  metadataVerified,
  policyCheck,
  authorized,
  rejected,
  expired,
  failed,
}

/// Request payload sent to SVSG/1.0 Zero Trust authorization pipeline.
class SecurityAuthRequest {
  const SecurityAuthRequest({
    required this.nodeId,
    required this.publicKeyHex,
    required this.fingerprint,
    required this.signatureHex,
    required this.timestamp,
    required this.nonce,
    required this.metadataId,
    required this.targetPeerId,
    required this.fileSizeBytes,
    this.capabilities = const <String>['metadata_relay', 'peer_seeder'],
    this.svsgVersion = 'SVSG/1.0',
    this.svtpVersion = 'SVTP/1.0',
  });

  final String nodeId;
  final String publicKeyHex;
  final String fingerprint;
  final String signatureHex;
  final DateTime timestamp;
  final String nonce;
  final String metadataId;
  final String targetPeerId;
  final int fileSizeBytes;
  final List<String> capabilities;
  final String svsgVersion;
  final String svtpVersion;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'node_id': nodeId,
      'public_key': publicKeyHex,
      'fingerprint': fingerprint,
      'signature': signatureHex,
      'timestamp': timestamp.toIso8601String(),
      'nonce': nonce,
      'metadata_id': metadataId,
      'target_peer_id': targetPeerId,
      'file_size_bytes': fileSizeBytes,
      'capabilities': capabilities,
      'svsg_version': svsgVersion,
      'svtp_version': svtpVersion,
    };
  }

  factory SecurityAuthRequest.fromJson(Map<String, dynamic> json) {
    return SecurityAuthRequest(
      nodeId: json['node_id'] as String? ?? '',
      publicKeyHex: json['public_key'] as String? ?? '',
      fingerprint: json['fingerprint'] as String? ?? '',
      signatureHex: json['signature'] as String? ?? '',
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'] as String) : DateTime.now(),
      nonce: json['nonce'] as String? ?? '',
      metadataId: json['metadata_id'] as String? ?? '',
      targetPeerId: json['target_peer_id'] as String? ?? '',
      fileSizeBytes: json['file_size_bytes'] as int? ?? 0,
      capabilities: (json['capabilities'] as List<dynamic>?)?.map((dynamic e) => e.toString()).toList() ??
          const <String>['metadata_relay', 'peer_seeder'],
      svsgVersion: json['svsg_version'] as String? ?? 'SVSG/1.0',
      svtpVersion: json['svtp_version'] as String? ?? 'SVTP/1.0',
    );
  }
}

/// Response returned by SVSG/1.0 authorization gate.
class SecurityAuthResponse {
  const SecurityAuthResponse({
    required this.isAuthorized,
    required this.status,
    this.authToken,
    this.failureReason,
    this.validationResults = const <String, bool>{},
    required this.authorizedAt,
  });

  final bool isAuthorized;
  final SecurityState status;
  final String? authToken;
  final String? failureReason;
  final Map<String, bool> validationResults;
  final DateTime authorizedAt;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'is_authorized': isAuthorized,
      'status': status.name,
      'auth_token': authToken,
      'failure_reason': failureReason,
      'validation_results': validationResults,
      'authorized_at': authorizedAt.toIso8601String(),
    };
  }

  factory SecurityAuthResponse.fromJson(Map<String, dynamic> json) {
    return SecurityAuthResponse(
      isAuthorized: json['is_authorized'] as bool? ?? false,
      status: SecurityState.values.firstWhere(
        (SecurityState e) => e.name == json['status'],
        orElse: () => json['is_authorized'] == true ? SecurityState.authorized : SecurityState.rejected,
      ),
      authToken: json['auth_token'] as String?,
      failureReason: json['failure_reason'] as String?,
      validationResults: (json['validation_results'] as Map<String, dynamic>?)?.map(
            (String k, dynamic v) => MapEntry<String, bool>(k, v as bool? ?? false),
          ) ??
          const <String, bool>{},
      authorizedAt: json['authorized_at'] != null ? DateTime.parse(json['authorized_at'] as String) : DateTime.now(),
    );
  }
}

/// Structured SVSG Audit Log Entry.
class SecurityAuditEntry {
  const SecurityAuditEntry({
    required this.id,
    required this.timestamp,
    required this.nodeId,
    required this.sessionId,
    required this.eventType,
    required this.policyDecision,
    required this.details,
  });

  final String id;
  final DateTime timestamp;
  final String nodeId;
  final String sessionId;
  final String eventType; // e.g. SUCCESSFUL_VALIDATION, REPLAY_ATTEMPT, POLICY_VIOLATION
  final String policyDecision; // AUTHORIZED, REJECTED
  final String details;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'node_id': nodeId,
      'session_id': sessionId,
      'event_type': eventType,
      'policy_decision': policyDecision,
      'details': details,
    };
  }

  factory SecurityAuditEntry.fromJson(Map<String, dynamic> json) {
    return SecurityAuditEntry(
      id: json['id'] as String? ?? '',
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'] as String) : DateTime.now(),
      nodeId: json['node_id'] as String? ?? 'unknown_node',
      sessionId: json['session_id'] as String? ?? 'unknown_session',
      eventType: json['event_type'] as String? ?? 'SECURITY_EVENT',
      policyDecision: json['policy_decision'] as String? ?? 'UNKNOWN',
      details: json['details'] as String? ?? '',
    );
  }
}
