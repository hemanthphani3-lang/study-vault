import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Settings table storing local preferences, security toggles, and sync parameters.
@TableIndex(name: 'settings_key_idx', columns: {#key})
@TableIndex(name: 'settings_category_idx', columns: {#category})
@TableIndex(name: 'settings_is_deleted_idx', columns: {#isDeleted})
class Settings extends Table with BaseSyncTable {
  /// Unique configuration parameter key (e.g., 'theme_mode', 'p2p_seeding_enabled').
  TextColumn get key => text().withLength(min: 1, max: 150)();

  /// String or JSON-encoded configuration value.
  TextColumn get value => text()();

  /// Category grouping ('appearance', 'storage', 'security', 'network', 'system').
  TextColumn get category => text().withDefault(const Constant('system'))();

  /// Whether the value is stored with AES-GCM encryption.
  BoolColumn get isEncrypted => boolean().withDefault(const Constant(false))();
}
