import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/trust/trust_calculator.dart';
import 'package:study_vault/core/trust/trust_engine.dart';
import 'package:study_vault/core/trust/trust_manager.dart';
import 'package:study_vault/core/trust/trust_models.dart';
import 'package:study_vault/core/trust/trust_policy.dart';

void main() {
  group('TrustCalculator 5-Dimensional Formula', () {
    late TrustCalculator calculator;

    setUp(() {
      calculator = TrustCalculator(policy: const TrustPolicy());
    });

    test('new node computes default baseline score T = 50.0 and state newNode', () {
      final history = NodeHistory(
        nodeId: 'node_new_01',
        lastSeenTime: DateTime.now().toUtc(),
      );

      final score = calculator.computeScore(history);
      expect(score.overallScore, 50.0);
      expect(score.trustState, TrustState.newNode);
    });

    test('node with 100% transfer and heartbeat success computes highlyTrusted score', () {
      final history = NodeHistory(
        nodeId: 'node_star_01',
        successfulTransfers: 50,
        failedTransfers: 0,
        heartbeatCount: 100,
        heartbeatTimeouts: 0,
        integritySuccesses: 50,
        integrityFailures: 0,
        securityViolations: 0,
        lastSeenTime: DateTime.now().toUtc(),
      );

      final score = calculator.computeScore(history);
      expect(score.overallScore, 100.0);
      expect(score.trustState, TrustState.highlyTrusted);
    });

    test('node with security violations drops score significantly', () {
      final history = NodeHistory(
        nodeId: 'node_bad_01',
        successfulTransfers: 10,
        failedTransfers: 5,
        heartbeatCount: 20,
        heartbeatTimeouts: 10,
        securityViolations: 3, // -60 pts on security component
        lastSeenTime: DateTime.now().toUtc(),
      );

      final score = calculator.computeScore(history);
      expect(score.overallScore, lessThan(60.0));
      expect(score.securityScore, 40.0);
    });
  });

  group('TrustEngine Event Processing', () {
    late TrustEngine engine;

    setUp(() {
      engine = TrustEngine();
    });

    test('transfer success increments successfulTransfers and logs audit event', () {
      const nodeId = 'node_eval_01';
      engine.onTransferSuccess(nodeId, bytes: 2048576);

      final history = engine.storage.getOrCreateHistory(nodeId);
      expect(history.successfulTransfers, 1);

      final events = engine.storage.allEvents;
      expect(events.length, 1);
      expect(events.first.eventType, 'TRANSFER_SUCCESS');
      expect(events.first.scoreDelta, 2.0);
    });

    test('security violation decreases score and logs security violation event', () {
      const nodeId = 'node_eval_02';
      engine.onSecurityViolation(nodeId, 'Timestamp expired');

      final history = engine.storage.getOrCreateHistory(nodeId);
      expect(history.securityViolations, 1);

      final score = engine.getScore(nodeId);
      expect(score.securityScore, 80.0);

      final events = engine.storage.allEvents;
      expect(events.first.eventType, 'SECURITY_VIOLATION');
    });
  });

  group('TrustManager Orchestration & Metrics', () {
    late TrustManager manager;

    setUp(() {
      manager = TrustManager();
    });

    test('getMetrics computes accurate cluster statistics', () {
      manager.engine.onTransferSuccess('node_01', bytes: 1000);
      manager.engine.onTransferSuccess('node_02', bytes: 1000);
      manager.engine.onSecurityViolation('node_03', 'Violation');

      final metrics = manager.getMetrics();
      expect(metrics.totalNodesTracked, 3);
      expect(metrics.totalEventsProcessed, 3);
      expect(metrics.averageTrustScore, greaterThan(0.0));
    });
  });
}
