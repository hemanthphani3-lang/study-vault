import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/enums/network_status.dart';
import '../../../../shared/enums/peer_status.dart';
import '../../../../shared/models/peer_node.dart';

/// State representation of the P2P Mesh Network.
class NetworkState {
  const NetworkState({
    required this.status,
    required this.localPeerId,
    required this.connectedPeers,
    required this.totalRelayedBytes,
    required this.averageLatencyMs,
  });

  final NetworkStatus status;
  final String localPeerId;
  final List<PeerNode> connectedPeers;
  final int totalRelayedBytes;
  final int averageLatencyMs;

  static const NetworkState initial = NetworkState(
    status: NetworkStatus.online,
    localPeerId: '12D3KooWStudyVaultLocalPeerNodeKey99x1',
    totalRelayedBytes: 104857600, // 100 MB
    averageLatencyMs: 32,
    connectedPeers: <PeerNode>[
      PeerNode(
        peerId: '12D3KooWAcademicNodeZurichETH',
        displayName: 'ETH Zurich Relay Node',
        status: PeerStatus.connected,
        latencyMs: 18,
        sharedResourcesCount: 412,
        bandwidthKbps: 4800,
        isInstitutionNode: true,
        region: 'EU-Central',
      ),
      PeerNode(
        peerId: '12D3KooWMITOpenCoursewareRelay',
        displayName: 'MIT Academic Mesh #04',
        status: PeerStatus.connected,
        latencyMs: 29,
        sharedResourcesCount: 890,
        bandwidthKbps: 9200,
        isInstitutionNode: true,
        region: 'US-East',
      ),
      PeerNode(
        peerId: '12D3KooWTokyoInstituteTechRelay',
        displayName: 'Tokyo Tech Seeder Node',
        status: PeerStatus.relaying,
        latencyMs: 54,
        sharedResourcesCount: 230,
        bandwidthKbps: 2400,
        isInstitutionNode: false,
        region: 'AP-Northeast',
      ),
    ],
  );
}

final StateProvider<NetworkState> networkProvider =
    StateProvider<NetworkState>((Ref ref) => NetworkState.initial);
