import 'dart:typed_data';
import 'dca_models.dart';

/// Provider-agnostic Abstract Interface for Distributed Content Addressing (DCA).
/// Higher application protocols (SVTP, Peer Cache, UI) consume this interface ONLY.
abstract class DcaInterface {
  /// Computes the Content Identifier (CIDv1) for binary [bytes].
  Future<String> generateCid(Uint8List bytes);

  /// Verifies payload [bytes] match expected [cid].
  Future<CidValidationResult> verifyCid(String cid, Uint8List bytes);

  /// Stores content payload into DCA storage and returns local [ContentRecord].
  Future<ContentRecord> storeContent(Uint8List bytes, {required String metadataId});

  /// Retrieves content bytes for [cid].
  Future<Uint8List?> retrieveContent(String cid);

  /// Pins content by [cid] to prevent storage garbage collection.
  Future<bool> pinContent(String cid);

  /// Removes pin for [cid].
  Future<bool> unpinContent(String cid);

  /// Lists all pinned content records.
  Future<List<ContentRecord>> listPins();

  /// Returns active storage metrics and quota telemetry.
  Future<StorageMetrics> getStorageMetrics();
}
