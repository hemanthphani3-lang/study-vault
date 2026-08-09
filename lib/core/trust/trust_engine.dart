import 'trust_calculator.dart';
import 'trust_models.dart';
import 'trust_storage.dart';

/// Network event processor for SVTF/1.0.
class TrustEngine {
  TrustEngine({
    TrustCalculator? calculator,
    TrustStorage? storage,
  })  : _calculator = calculator ?? TrustCalculator(),
        _storage = storage ?? TrustStorage();

  final TrustCalculator _calculator;
  final TrustStorage _storage;

  TrustStorage get storage => _storage;
  TrustCalculator get calculator => _calculator;

  TrustScore getScore(String nodeId) {
    final history = _storage.getOrCreateHistory(nodeId);
    return _calculator.computeScore(history);
  }

  void onTransferSuccess(String nodeId, {int bytes = 0}) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      successfulTransfers: history.successfulTransfers + 1,
      lastSeenTime: DateTime.now().toUtc(),
    );
    _storage.saveHistory(history);

    _logEvent(nodeId, 'TRANSFER_SUCCESS', 2.0, 'Successful transfer of $bytes bytes');
  }

  void onTransferFailure(String nodeId, {String reason = ''}) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      failedTransfers: history.failedTransfers + 1,
      lastSeenTime: DateTime.now().toUtc(),
    );
    _storage.saveHistory(history);

    _logEvent(nodeId, 'TRANSFER_FAILURE', -3.0, 'Transfer failed: $reason');
  }

  void onHeartbeat(String nodeId) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      heartbeatCount: history.heartbeatCount + 1,
      lastSeenTime: DateTime.now().toUtc(),
    );
    _storage.saveHistory(history);
  }

  void onHeartbeatTimeout(String nodeId) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      heartbeatTimeouts: history.heartbeatTimeouts + 1,
    );
    _storage.saveHistory(history);

    _logEvent(nodeId, 'HEARTBEAT_TIMEOUT', -1.5, 'Peer heartbeat timeout');
  }

  void onIntegrityVerified(String nodeId, String cid) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      integritySuccesses: history.integritySuccesses + 1,
      lastSeenTime: DateTime.now().toUtc(),
    );
    _storage.saveHistory(history);
  }

  void onIntegrityFailed(String nodeId, String cid) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      integrityFailures: history.integrityFailures + 1,
      lastSeenTime: DateTime.now().toUtc(),
    );
    _storage.saveHistory(history);

    _logEvent(nodeId, 'CID_MISMATCH', -5.0, 'CID multihash verification failed for $cid');
  }

  void onSecurityViolation(String nodeId, String reason) {
    var history = _storage.getOrCreateHistory(nodeId);
    history = history.copyWith(
      securityViolations: history.securityViolations + 1,
      lastSeenTime: DateTime.now().toUtc(),
    );
    _storage.saveHistory(history);

    _logEvent(nodeId, 'SECURITY_VIOLATION', -15.0, 'SVSG Security violation: $reason');
  }

  void _logEvent(String nodeId, String eventType, double delta, String details) {
    final event = TrustEvent(
      id: 'tevent_${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}',
      nodeId: nodeId,
      timestamp: DateTime.now().toUtc(),
      eventType: eventType,
      scoreDelta: delta,
      details: details,
    );
    _storage.logEvent(event);
  }
}
