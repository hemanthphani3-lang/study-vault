import 'sharing_models.dart';

/// Advertisement Service constructing sanitized tracker advertisement payloads.
class AdvertisementService {
  AdvertisementService();

  /// Builds a sanitized [AdvertisementPayload] for a shared resource.
  AdvertisementPayload createPayload({
    required String nodeId,
    required String metadataId,
    required String cid,
    List<String> capabilities = const <String>['peer_seeder', 'metadata_relay'],
  }) {

    return AdvertisementPayload(
      nodeId: nodeId,
      metadataId: metadataId,
      cid: cid,
      capabilities: capabilities,
      availability: 'online',
      storageStatus: 'pinned',
    );
  }
}
