enum TrustState {
  unknown,
  newNode,
  trusted,
  highlyTrusted,
  warning,
  restricted,
  recovery,
}

/// Composite Trust Score container for SVTF/1.0.
class TrustScore {
  const TrustScore({
    required this.overallScore,
    required this.availabilityScore,
    required this.integrityScore,
    required this.reliabilityScore,
    required this.securityScore,
    required this.freshnessScore,
    required this.trustState,
  });

  final double overallScore;
  final double availabilityScore;
  final double integrityScore;
  final double reliabilityScore;
  final double securityScore;
  final double freshnessScore;
  final TrustState trustState;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'overall_score': overallScore,
      'availability_score': availabilityScore,
      'integrity_score': integrityScore,
      'reliability_score': reliabilityScore,
      'security_score': securityScore,
      'freshness_score': freshnessScore,
      'trust_state': trustState.name,
    };
  }

  factory TrustScore.fromJson(Map<String, dynamic> json) {
    return TrustScore(
      overallScore: (json['overall_score'] as num?)?.toDouble() ?? 50.0,
      availabilityScore: (json['availability_score'] as num?)?.toDouble() ?? 50.0,
      integrityScore: (json['integrity_score'] as num?)?.toDouble() ?? 50.0,
      reliabilityScore: (json['reliability_score'] as num?)?.toDouble() ?? 50.0,
      securityScore: (json['security_score'] as num?)?.toDouble() ?? 100.0,
      freshnessScore: (json['freshness_score'] as num?)?.toDouble() ?? 100.0,
      trustState: TrustState.values.firstWhere(
        (TrustState s) => s.name == json['trust_state'],
        orElse: () => TrustState.newNode,
      ),
    );
  }
}

/// Historical interaction telemetry for a peer node.
class NodeHistory {
  const NodeHistory({
    required this.nodeId,
    this.successfulTransfers = 0,
    this.failedTransfers = 0,
    this.heartbeatCount = 0,
    this.heartbeatTimeouts = 0,
    this.integritySuccesses = 0,
    this.integrityFailures = 0,
    this.securityViolations = 0,
    required this.lastSeenTime,
  });

  final String nodeId;
  final int successfulTransfers;
  final int failedTransfers;
  final int heartbeatCount;
  final int heartbeatTimeouts;
  final int integritySuccesses;
  final int integrityFailures;
  final int securityViolations;
  final DateTime lastSeenTime;

  NodeHistory copyWith({
    String? nodeId,
    int? successfulTransfers,
    int? failedTransfers,
    int? heartbeatCount,
    int? heartbeatTimeouts,
    int? integritySuccesses,
    int? integrityFailures,
    int? securityViolations,
    DateTime? lastSeenTime,
  }) {
    return NodeHistory(
      nodeId: nodeId ?? this.nodeId,
      successfulTransfers: successfulTransfers ?? this.successfulTransfers,
      failedTransfers: failedTransfers ?? this.failedTransfers,
      heartbeatCount: heartbeatCount ?? this.heartbeatCount,
      heartbeatTimeouts: heartbeatTimeouts ?? this.heartbeatTimeouts,
      integritySuccesses: integritySuccesses ?? this.integritySuccesses,
      integrityFailures: integrityFailures ?? this.integrityFailures,
      securityViolations: securityViolations ?? this.securityViolations,
      lastSeenTime: lastSeenTime ?? this.lastSeenTime,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'node_id': nodeId,
      'successful_transfers': successfulTransfers,
      'failed_transfers': failedTransfers,
      'heartbeat_count': heartbeatCount,
      'heartbeat_timeouts': heartbeatTimeouts,
      'integrity_successes': integritySuccesses,
      'integrity_failures': integrityFailures,
      'security_violations': securityViolations,
      'last_seen_time': lastSeenTime.toIso8601String(),
    };
  }
}

/// Structured network trust event.
class TrustEvent {
  const TrustEvent({
    required this.id,
    required this.nodeId,
    required this.timestamp,
    required this.eventType,
    required this.scoreDelta,
    required this.details,
  });

  final String id;
  final String nodeId;
  final DateTime timestamp;
  final String eventType; // e.g. TRANSFER_SUCCESS, SECURITY_VIOLATION
  final double scoreDelta;
  final String details;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'node_id': nodeId,
      'timestamp': timestamp.toIso8601String(),
      'event_type': eventType,
      'score_delta': scoreDelta,
      'details': details,
    };
  }
}

/// SVTF Telemetry Metrics.
class TrustMetrics {
  const TrustMetrics({
    required this.totalNodesTracked,
    required this.trustedNodesCount,
    required this.restrictedNodesCount,
    required this.averageTrustScore,
    required this.totalEventsProcessed,
  });

  final int totalNodesTracked;
  final int trustedNodesCount;
  final int restrictedNodesCount;
  final double averageTrustScore;
  final int totalEventsProcessed;
}
