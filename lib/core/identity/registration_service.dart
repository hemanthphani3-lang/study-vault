import '../network/api_client.dart';
import '../network/api_exceptions.dart';
import 'key_management_service.dart';
import 'node_profile.dart';

/// Registration Service submitting cryptographic Node Identity to Tracker via FastAPI Gateway.
class RegistrationService {
  RegistrationService({
    required ApiClient apiClient,
    required KeyManagementService keyManager,
  })  : _client = apiClient,
        _keyManager = keyManager;

  final ApiClient _client;
  final KeyManagementService _keyManager;

  /// Registers the node's Ed25519 identity, public key, and fingerprint with the Tracker.
  Future<bool> registerNodeIdentity(NodeProfile profile) async {
    final String timestampStr = DateTime.now().toUtc().toIso8601String();
    final String challengeMessage = '${profile.nodeId}:$timestampStr';
    final String signatureHex = _keyManager.sign(challengeMessage);

    final Map<String, dynamic> payload = <String, dynamic>{
      'node_id': profile.nodeId,
      'public_key': profile.publicKeyHex,
      'fingerprint': profile.fingerprint,
      'signature': signatureHex,
      'timestamp': timestampStr,
      'platform': profile.platform,
      'app_version': profile.appVersion,
      'country_code': profile.countryCode,
      'capabilities': profile.capabilities,
      'available_metadata_ids': <String>[],
      'network_address': '127.0.0.1:8000',
    };

    try {
      final Map<String, dynamic> response = await _client.post(
        '/api/v1/tracker/register',
        payload,
      );
      return response['success'] as bool? ?? false;
    } on ApiException {
      return false;
    } catch (_) {
      return false;
    }
  }
}
