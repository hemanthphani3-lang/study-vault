import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/discovery_providers.dart';
import '../../../../core/discovery/peer_discovery_service.dart';
import '../../../../core/discovery/peer_node_model.dart';

class PeerDiscoveryState {
  const PeerDiscoveryState({
    this.peers = const <PeerNodeModel>[],
    this.activeMetadataId,
    this.isLoading = false,
    this.errorMessage,
  });

  final List<PeerNodeModel> peers;
  final String? activeMetadataId;
  final bool isLoading;
  final String? errorMessage;

  PeerDiscoveryState copyWith({
    List<PeerNodeModel>? peers,
    String? activeMetadataId,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PeerDiscoveryState(
      peers: peers ?? this.peers,
      activeMetadataId: activeMetadataId ?? this.activeMetadataId,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  int get totalOnlineSeeders => peers.where((PeerNodeModel p) => p.availability == 'online').length;
}

class PeerDiscoveryNotifier extends Notifier<PeerDiscoveryState> {
  @override
  PeerDiscoveryState build() {
    return const PeerDiscoveryState();
  }

  PeerDiscoveryService get _service => ref.read(peerDiscoveryServiceProvider);

  Future<void> discoverPeers(String metadataId, {String clientCountry = 'US'}) async {
    state = state.copyWith(isLoading: true, activeMetadataId: metadataId, errorMessage: null);
    try {
      final List<PeerNodeModel> discovered = await _service.discoverPeersForMetadata(
        metadataId,
        clientCountry: clientCountry,
      );
      state = state.copyWith(peers: discovered, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Peer discovery failed: $e',
      );
    }
  }
}

final NotifierProvider<PeerDiscoveryNotifier, PeerDiscoveryState> peerDiscoveryProvider =
    NotifierProvider<PeerDiscoveryNotifier, PeerDiscoveryState>(PeerDiscoveryNotifier.new);
