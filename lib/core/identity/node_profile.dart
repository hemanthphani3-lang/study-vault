/// Immutable Node Profile representing a unique device installation.
/// No user accounts, no passwords, no email — identity belongs to device.
class NodeProfile {
  const NodeProfile({
    required this.nodeId,
    required this.publicKeyHex,
    required this.fingerprint,
    required this.platform,
    required this.appVersion,
    required this.countryCode,
    required this.capabilities,
    required this.createdAt,
    required this.lastSeenAt,
    this.trustScore = 1.0,
    this.reputationTier = 'standard',
    this.registrationStatus = 'unregistered',
    this.metadataCount = 0,
  });

  final String nodeId;
  final String publicKeyHex;
  final String fingerprint;
  final String platform;
  final String appVersion;
  final String countryCode;
  final List<String> capabilities;
  final DateTime createdAt;
  final DateTime lastSeenAt;
  final double trustScore;
  final String reputationTier;
  final String registrationStatus; // unregistered, registered, pending
  final int metadataCount;

  NodeProfile copyWith({
    String? nodeId,
    String? publicKeyHex,
    String? fingerprint,
    String? platform,
    String? appVersion,
    String? countryCode,
    List<String>? capabilities,
    DateTime? createdAt,
    DateTime? lastSeenAt,
    double? trustScore,
    String? reputationTier,
    String? registrationStatus,
    int? metadataCount,
  }) {
    return NodeProfile(
      nodeId: nodeId ?? this.nodeId,
      publicKeyHex: publicKeyHex ?? this.publicKeyHex,
      fingerprint: fingerprint ?? this.fingerprint,
      platform: platform ?? this.platform,
      appVersion: appVersion ?? this.appVersion,
      countryCode: countryCode ?? this.countryCode,
      capabilities: capabilities ?? this.capabilities,
      createdAt: createdAt ?? this.createdAt,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      trustScore: trustScore ?? this.trustScore,
      reputationTier: reputationTier ?? this.reputationTier,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      metadataCount: metadataCount ?? this.metadataCount,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nodeId': nodeId,
      'publicKeyHex': publicKeyHex,
      'fingerprint': fingerprint,
      'platform': platform,
      'appVersion': appVersion,
      'countryCode': countryCode,
      'capabilities': capabilities,
      'createdAt': createdAt.toIso8601String(),
      'lastSeenAt': lastSeenAt.toIso8601String(),
      'trustScore': trustScore,
      'reputationTier': reputationTier,
      'registrationStatus': registrationStatus,
      'metadataCount': metadataCount,
    };
  }

  factory NodeProfile.fromJson(Map<String, dynamic> json) {
    return NodeProfile(
      nodeId: json['nodeId'] as String? ?? '',
      publicKeyHex: json['publicKeyHex'] as String? ?? '',
      fingerprint: json['fingerprint'] as String? ?? '',
      platform: json['platform'] as String? ?? 'flutter',
      appVersion: json['appVersion'] as String? ?? '0.10.0-alpha',
      countryCode: json['countryCode'] as String? ?? 'US',
      capabilities: (json['capabilities'] as List<dynamic>?)?.map((dynamic e) => e.toString()).toList() ??
          const <String>['metadata_relay', 'search_index'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      lastSeenAt: json['lastSeenAt'] != null ? DateTime.parse(json['lastSeenAt'] as String) : DateTime.now(),
      trustScore: (json['trustScore'] as num?)?.toDouble() ?? 1.0,
      reputationTier: json['reputationTier'] as String? ?? 'standard',
      registrationStatus: json['registrationStatus'] as String? ?? 'unregistered',
      metadataCount: json['metadataCount'] as int? ?? 0,
    );
  }
}
