import '../../../../shared/models/peer_node.dart';
import '../domain/network_domain.dart';
import '../presentation/providers/network_provider.dart';

/// Concrete Network repository implementation.
class NetworkRepositoryImpl implements INetworkRepository {
  const NetworkRepositoryImpl();

  @override
  Future<List<PeerNode>> getConnectedPeers() async {
    return NetworkState.initial.connectedPeers;
  }

  @override
  Future<String> getLocalPeerId() async {
    return NetworkState.initial.localPeerId;
  }
}
