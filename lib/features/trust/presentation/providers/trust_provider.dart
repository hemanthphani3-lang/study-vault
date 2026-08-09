import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/trust_providers.dart';
import '../../../../core/trust/trust_manager.dart';
import '../../../../core/trust/trust_models.dart';

class TrustStateContainer {
  const TrustStateContainer({
    this.selectedNodeId = 'node_alpha_seeder_01',
    this.selectedScore,
    this.selectedHistory,
    this.events = const <TrustEvent>[],
    this.metrics,
  });

  final String selectedNodeId;
  final TrustScore? selectedScore;
  final NodeHistory? selectedHistory;
  final List<TrustEvent> events;
  final TrustMetrics? metrics;

  TrustStateContainer copyWith({
    String? selectedNodeId,
    TrustScore? selectedScore,
    NodeHistory? selectedHistory,
    List<TrustEvent>? events,
    TrustMetrics? metrics,
  }) {
    return TrustStateContainer(
      selectedNodeId: selectedNodeId ?? this.selectedNodeId,
      selectedScore: selectedScore ?? this.selectedScore,
      selectedHistory: selectedHistory ?? this.selectedHistory,
      events: events ?? this.events,
      metrics: metrics ?? this.metrics,
    );
  }
}

class TrustNotifier extends Notifier<TrustStateContainer> {
  @override
  TrustStateContainer build() {
    return const TrustStateContainer();
  }

  TrustManager get _manager => ref.read(trustManagerProvider);

  void selectNode(String nodeId) {
    final score = _manager.getNodeTrustScore(nodeId);
    final history = _manager.getNodeHistory(nodeId);
    state = state.copyWith(
      selectedNodeId: nodeId,
      selectedScore: score,
      selectedHistory: history,
      events: _manager.getTrustEvents(),
      metrics: _manager.getMetrics(),
    );
  }

  void simulateEvent(String eventType) {
    final nodeId = state.selectedNodeId;
    final engine = ref.read(trustEngineProvider);

    switch (eventType) {
      case 'TRANSFER_SUCCESS':
        engine.onTransferSuccess(nodeId, bytes: 1048576);
        break;
      case 'TRANSFER_FAILURE':
        engine.onTransferFailure(nodeId, reason: 'Network Connection Timeout');
        break;
      case 'SECURITY_VIOLATION':
        engine.onSecurityViolation(nodeId, 'Replay Attack Nonce Duplicate');
        break;
      case 'CID_MISMATCH':
        engine.onIntegrityFailed(nodeId, 'bafybeic00001111');
        break;
    }

    selectNode(nodeId);
  }

  void refreshMetrics() {
    selectNode(state.selectedNodeId);
  }
}

final NotifierProvider<TrustNotifier, TrustStateContainer> trustProvider =
    NotifierProvider<TrustNotifier, TrustStateContainer>(TrustNotifier.new);
