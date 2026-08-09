import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// NodeMetadata table tracking peer descriptors, cryptographic public keys, and routing multiaddrs.
@TableIndex(name: 'nodes_public_key_idx', columns: {#nodePublicKey})
@TableIndex(name: 'nodes_is_connected_idx', columns: {#isConnected})
@TableIndex(name: 'nodes_last_seen_idx', columns: {#lastSeenAt})
class NodeMetadata extends Table with BaseSyncTable {
  /// Base58 or hex encoded Ed25519/Secp256k1 public key of the peer node.
  TextColumn get nodePublicKey => text().withLength(min: 1, max: 256)();

  /// JSON array of libp2p/IPFS multiaddresses (e.g., `["/ip4/192.168.1.1/tcp/4001/p2p/..."]`).
  TextColumn get multiaddressesJson => text().withDefault(const Constant('[]'))();

  /// Node client and protocol version string.
  TextColumn get protocolVersion => text().withDefault(const Constant('studyvault/0.4.0'))();

  /// Quorum peer trust and consensus reputation score (0.0 to 100.0).
  RealColumn get reputationScore => real().withDefault(const Constant(100.0))();

  /// Observed ping latency in milliseconds.
  IntColumn get latencyMs => integer().withDefault(const Constant(0))();

  /// Whether active socket connection exists with this peer.
  BoolColumn get isConnected => boolean().withDefault(const Constant(false))();

  /// Whether peer is quarantined or banned due to invalid cryptographic proofs.
  BoolColumn get isBanned => boolean().withDefault(const Constant(false))();

  /// Timestamp when peer was last active or responded to ping.
  DateTimeColumn get lastSeenAt => dateTime().withDefault(currentDateAndTime)();
}
