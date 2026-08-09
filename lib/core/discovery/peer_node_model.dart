/// Immutable domain model for a Discovered Peer Node in StudyVault network.
class PeerNodeModel {
  const PeerNodeModel({
    required this.peerId,
    required this.nodeId,
    required this.publicKey,
    required this.fingerprint,
    required this.country,
    required this.capabilities,
    required this.pingMs,
    required this.availability,
    required this.metadataMatch,
    this.trustScore = 1.0,
    this.rankScore = 0.0,
    this.connectionMethod = 'direct_p2p',
  });

  final String peerId;
  final String nodeId;
  final String publicKey;
  final String fingerprint;
  final String country;
  final List<String> capabilities;
  final int pingMs;
  final String availability; // online, degraded, offline
  final bool metadataMatch;
  final double trustScore;
  final double rankScore;
  final String connectionMethod; // direct_p2p, relay_placeholder

  PeerNodeModel copyWith({
    String? peerId,
    String? nodeId,
    String? publicKey,
    String? fingerprint,
    String? country,
    List<String>? capabilities,
    int? pingMs,
    String? availability,
    bool? metadataMatch,
    double? trustScore,
    double? rankScore,
    String? connectionMethod,
  }) {
    return PeerNodeModel(
      peerId: peerId ?? this.peerId,
      nodeId: nodeId ?? this.nodeId,
      publicKey: publicKey ?? this.publicKey,
      fingerprint: fingerprint ?? this.fingerprint,
      country: country ?? this.country,
      capabilities: capabilities ?? this.capabilities,
      pingMs: pingMs ?? this.pingMs,
      availability: availability ?? this.availability,
      metadataMatch: metadataMatch ?? this.metadataMatch,
      trustScore: trustScore ?? this.trustScore,
      rankScore: rankScore ?? this.rankScore,
      connectionMethod: connectionMethod ?? this.connectionMethod,
    );
  }

  factory PeerNodeModel.fromJson(Map<String, dynamic> json) {
    return PeerNodeModel(
      peerId: json['peer_id'] as String? ?? json['node_id'] as String? ?? 'peer_unknown',
      nodeId: json['node_id'] as String? ?? 'node_unknown',
      publicKey: json['public_key'] as String? ?? '',
      fingerprint: json['fingerprint'] as String? ?? 'SHA256:UNKNOWN',
      country: json['country'] as String? ?? json['country_code'] as String? ?? 'US',
      capabilities: (json['capabilities'] as List<dynamic>?)?.map((dynamic e) => e.toString()).toList() ??
          const <String>['metadata_relay'],
      pingMs: (json['ping_ms'] as num?)?.toInt() ?? 45,
      availability: json['availability'] as String? ?? (json['is_online'] == true ? 'online' : 'offline'),
      metadataMatch: json['metadata_match'] as bool? ?? true,
      trustScore: (json['trust_score'] as num?)?.toDouble() ?? 1.0,
      rankScore: (json['rank_score'] as num?)?.toDouble() ?? 0.0,
      connectionMethod: json['connection_method'] as String? ?? 'direct_p2p',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'peer_id': peerId,
      'node_id': nodeId,
      'public_key': publicKey,
      'fingerprint': fingerprint,
      'country': country,
      'capabilities': capabilities,
      'ping_ms': pingMs,
      'availability': availability,
      'metadata_match': metadataMatch,
      'trust_score': trustScore,
      'rank_score': rankScore,
      'connection_method': connectionMethod,
    };
  }
}
