import 'dart:typed_data';
import '../crypto/sha256_helper.dart';
import 'cid_manager.dart';
import 'dca_interface.dart';
import 'dca_models.dart';
import 'local_content_registry.dart';
import 'pin_manager.dart';

/// IPFS Storage Adapter implementing [DcaInterface].
/// Encapsulates IPFS node interaction and local DCA content storage.
class IpfsAdapter implements DcaInterface {
  IpfsAdapter({
    CidManager? cidManager,
    PinManager? pinManager,
    LocalContentRegistry? registry,
  })  : _cidManager = cidManager ?? CidManager(),
        _registry = registry ?? LocalContentRegistry(),
        _pinManager = pinManager ?? PinManager(registry: registry);

  final CidManager _cidManager;
  final LocalContentRegistry _registry;
  final PinManager _pinManager;

  final Map<String, Uint8List> _storagePayloads = <String, Uint8List>{};
  int _integrityFailuresCount = 0;

  @override
  Future<String> generateCid(Uint8List bytes) async {
    return _cidManager.generateCid(bytes);
  }

  @override
  Future<CidValidationResult> verifyCid(String cid, Uint8List bytes) async {
    final result = _cidManager.verifyContentCid(cid, bytes);
    if (!result.isValid) {
      _integrityFailuresCount++;
    }
    return result;
  }

  @override
  Future<ContentRecord> storeContent(Uint8List bytes, {required String metadataId}) async {
    final String cid = await generateCid(bytes);
    final String checksum = Sha256Helper.toHex(Sha256Helper.digest(bytes));

    if (!_pinManager.isQuotaAvailable(bytes.length)) {
      throw StateError('DCA Storage Exhausted: File size exceeds remaining storage quota.');
    }

    _storagePayloads[cid] = bytes;

    final now = DateTime.now().toUtc();
    final record = ContentRecord(
      cid: cid,
      localPath: '/dca/storage/$cid',
      metadataId: metadataId,
      pinStatus: PinStatus.pinned,
      fileSizeBytes: bytes.length,
      checksumHex: checksum,
      createdTime: now,
      lastAccessTime: now,
      referenceCount: 1,
    );

    _registry.addOrUpdateRecord(record);
    return record;
  }

  @override
  Future<Uint8List?> retrieveContent(String cid) async {
    final record = _registry.getRecord(cid);
    if (record == null) return null;

    final payload = _storagePayloads[cid];
    if (payload != null) {
      _registry.addOrUpdateRecord(record.copyWith(lastAccessTime: DateTime.now().toUtc()));
    }
    return payload;
  }

  @override
  Future<bool> pinContent(String cid) async {
    return _pinManager.pin(cid);
  }

  @override
  Future<bool> unpinContent(String cid) async {
    return _pinManager.unpin(cid);
  }

  @override
  Future<List<ContentRecord>> listPins() async {
    return _pinManager.listPins();
  }

  @override
  Future<StorageMetrics> getStorageMetrics() async {
    final all = _registry.allRecords;
    final pinned = _registry.pinnedRecords;
    final int totalSize = all.fold(0, (int sum, ContentRecord r) => sum + r.fileSizeBytes);

    return StorageMetrics(
      totalCidCount: all.length,
      pinnedCidCount: pinned.length,
      totalSizeBytes: totalSize,
      quotaSizeBytes: _pinManager.maxQuotaBytes,
      integrityFailuresCount: _integrityFailuresCount,
    );
  }
}
