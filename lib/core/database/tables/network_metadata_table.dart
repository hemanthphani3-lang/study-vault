import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// NetworkMetadata table storing P2P swarm telemetry, DHT health, and bandwidth aggregates.
@TableIndex(name: 'network_swarm_idx', columns: {#swarmId})
@TableIndex(name: 'network_health_idx', columns: {#lastHealthCheckAt})
class NetworkMetadata extends Table with BaseSyncTable {
  /// Swarm or subnetwork identifier.
  TextColumn get swarmId => text().withLength(min: 1, max: 200)();

  /// Connected peer count.
  IntColumn get peerCount => integer().withDefault(const Constant(0))();

  /// Average round-trip ping latency in milliseconds.
  IntColumn get averageLatencyMs => integer().withDefault(const Constant(0))();

  /// Observed download speed in bytes per second.
  IntColumn get downloadSpeedBps => integer().withDefault(const Constant(0))();

  /// Observed upload throughput in bytes per second.
  IntColumn get uploadSpeedBps => integer().withDefault(const Constant(0))();

  /// Distributed Hash Table (DHT) consensus reputation score (0.0 to 100.0).
  RealColumn get dhtReputationScore => real().withDefault(const Constant(100.0))();

  /// Lifetime total bytes shared to network peers.
  IntColumn get totalBytesShared => integer().withDefault(const Constant(0))();

  /// Lifetime total bytes received from network peers.
  IntColumn get totalBytesReceived => integer().withDefault(const Constant(0))();

  /// Timestamp of the most recent swarm health check.
  DateTimeColumn get lastHealthCheckAt => dateTime().withDefault(currentDateAndTime)();
}
