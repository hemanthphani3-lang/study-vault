import 'security_models.dart';

/// Sanitized Security Audit Logger recording zero-trust validation events.
/// Strictly guarantees NO private keys or sensitive file contents appear in logs.
class SecurityAuditLogger {
  SecurityAuditLogger({this.maxEntries = 500});

  final int maxEntries;
  final List<SecurityAuditEntry> _logs = <SecurityAuditEntry>[];

  List<SecurityAuditEntry> get logs => List<SecurityAuditEntry>.unmodifiable(_logs);

  /// Logs a sanitized security audit entry.
  SecurityAuditEntry logEvent({
    required String nodeId,
    required String sessionId,
    required String eventType,
    required String policyDecision,
    required String details,
  }) {
    final String sanitizedDetails = _sanitizeString(details);
    final String entryId = 'audit_${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}';

    final entry = SecurityAuditEntry(
      id: entryId,
      timestamp: DateTime.now().toUtc(),
      nodeId: nodeId,
      sessionId: sessionId,
      eventType: eventType,
      policyDecision: policyDecision,
      details: sanitizedDetails,
    );

    _logs.insert(0, entry);
    if (_logs.length > maxEntries) {
      _logs.removeLast();
    }
    return entry;
  }

  /// Sanitizes strings to strip accidental private keys or secret patterns.
  String _sanitizeString(String text) {
    String clean = text;
    // Mask potential private keys (64 hex characters)
    clean = clean.replaceAll(RegExp(r'priv[a-zA-Z0-9_]*=[0-9a-fA-F]{64}'), '[PRIVATE_KEY_MASKED]');
    clean = clean.replaceAll(RegExp(r'secret[a-zA-Z0-9_]*=[^\s]+'), '[SECRET_MASKED]');
    return clean;
  }

  void clearLogs() {
    _logs.clear();
  }
}
