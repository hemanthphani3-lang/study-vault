import 'package:flutter/foundation.dart';
import '../enums/peer_status.dart';

/// Immutable domain model representing a connected peer in the academic mesh.
@immutable
class PeerNode {
  const PeerNode({
    required this.peerId,
    required this.displayName,
    required this.status,
    required this.latencyMs,
    required this.sharedResourcesCount,
    required this.bandwidthKbps,
    required this.isInstitutionNode,
    this.region = 'Global Relay',
  });

  final String peerId;
  final String displayName;
  final PeerStatus status;
  final int latencyMs;
  final int sharedResourcesCount;
  final double bandwidthKbps;
  final bool isInstitutionNode;
  final String region;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeerNode &&
          runtimeType == other.runtimeType &&
          peerId == other.peerId;

  @override
  int get hashCode => peerId.hashCode;
}
