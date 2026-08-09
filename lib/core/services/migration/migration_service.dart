/// Service managing schema versions, migration logs, and schema integrity validation.
class MigrationService {
  const MigrationService();

  /// Current application database schema version.
  static const int currentSchemaVersion = 1;

  /// Validates whether a database at [detectedVersion] can be upgraded safely to [targetVersion].
  bool canMigrate(int detectedVersion, {int targetVersion = currentSchemaVersion}) {
    if (detectedVersion > targetVersion) {
      // Downgrades are not supported to prevent data corruption
      return false;
    }
    return true;
  }

  /// List of version change summaries for auditing and diagnostic logs.
  List<String> getMigrationHistory() {
    return const <String>[
      'v1: Initial Drift SQLite schema with 14 production tables, base sync mixin, and WAL mode.',
    ];
  }
}
