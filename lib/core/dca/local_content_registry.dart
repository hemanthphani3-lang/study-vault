import 'dca_models.dart';

/// Local Content Registry maintaining persistent mappings of CIDs to ContentRecords.
class LocalContentRegistry {
  LocalContentRegistry();

  final Map<String, ContentRecord> _records = <String, ContentRecord>{};

  List<ContentRecord> get allRecords => _records.values.toList();

  List<ContentRecord> get pinnedRecords =>
      _records.values.where((ContentRecord r) => r.isPinned).toList();

  ContentRecord? getRecord(String cid) => _records[cid];

  void addOrUpdateRecord(ContentRecord record) {
    _records[record.cid] = record;
  }

  bool updatePinStatus(String cid, PinStatus status) {
    final record = _records[cid];
    if (record == null) return false;
    _records[cid] = record.copyWith(
      pinStatus: status,
      lastAccessTime: DateTime.now().toUtc(),
    );
    return true;
  }

  bool removeRecord(String cid) {
    return _records.remove(cid) != null;
  }

  void clear() {
    _records.clear();
  }
}
