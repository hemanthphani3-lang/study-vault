/// Central registry of all FastAPI backend endpoints.
abstract final class ApiEndpoints {
  /// Base URL for the StudyVault FastAPI backend.
  /// Override via environment config for staging/production.
  static const String baseUrl = 'http://127.0.0.1:8000';

  // ─── API Version Prefix ────────────────────────────────────────────────────
  static const String _v1 = '/api/v1';

  // ─── Health & System ───────────────────────────────────────────────────────
  static const String health = '$_v1/health';
  static const String version = '$_v1/version';

  // ─── Academic Resources ────────────────────────────────────────────────────
  static const String resources = '$_v1/resources';
  static String resourceById(String id) => '$_v1/resources/$id';

  // ─── Taxonomy Catalog ──────────────────────────────────────────────────────
  static const String categories = '$_v1/categories';
  static const String authors = '$_v1/authors';
  static const String languages = '$_v1/languages';

  // ─── Future Contracts (Placeholder) ───────────────────────────────────────
  // These endpoints will be activated in Sprint 9+ (Tracker / P2P / Swarm).
  static const String scraperJobs = '$_v1/scraper/jobs';
  static const String trackerAnnounce = '$_v1/tracker/announce';
  static const String nodesSync = '$_v1/nodes/sync';
}
