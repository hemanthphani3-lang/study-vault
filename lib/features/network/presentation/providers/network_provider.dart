import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/enums/network_status.dart';
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
    totalRelayedBytes: 0,
    averageLatencyMs: 0,
    connectedPeers: <PeerNode>[],
  );

}

final StateProvider<NetworkState> networkProvider =
    StateProvider<NetworkState>((Ref ref) => NetworkState.initial);
