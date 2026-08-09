import 'trust_models.dart';

/// Storage repository for SVTF Node History records and Trust Events.
class TrustStorage {
  TrustStorage();

  final Map<String, NodeHistory> _histories = <String, NodeHistory>{};
  final List<TrustEvent> _events = <TrustEvent>[];

  List<NodeHistory> get allHistories => _histories.values.toList();
  List<TrustEvent> get allEvents => List<TrustEvent>.unmodifiable(_events);

  NodeHistory getOrCreateHistory(String nodeId) {
    return _histories[nodeId] ??
        NodeHistory(
          nodeId: nodeId,
          lastSeenTime: DateTime.now().toUtc(),
        );
  }

  void saveHistory(NodeHistory history) {
    _histories[history.nodeId] = history;
  }

  void logEvent(TrustEvent event) {
    _events.insert(0, event);
    if (_events.length > 1000) {
      _events.removeLast();
    }
  }

  void clear() {
    _histories.clear();
    _events.clear();
  }
}
