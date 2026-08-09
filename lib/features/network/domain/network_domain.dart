import '../../../../shared/models/peer_node.dart';

/// Clean Architecture domain contract for P2P Mesh Network.
abstract interface class INetworkRepository {
  Future<List<PeerNode>> getConnectedPeers();
  Future<String> getLocalPeerId();
}
