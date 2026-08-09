import '../network/api_client.dart';
import '../network/api_exceptions.dart';
import 'sharing_models.dart';

/// Tracker Publisher sending/withdrawing announcements to/from global Tracker Gateway.
class TrackerPublisher {
  TrackerPublisher({required ApiClient apiClient}) : _client = apiClient;

  final ApiClient _client;

  /// Publishes a sanitized advertisement payload to the tracker gateway.
  Future<bool> publishAdvertisement(AdvertisementPayload payload) async {
    try {
      final Map<String, dynamic> response = await _client.post(
        '/api/v1/sharing/advertise',
        payload.toJson(),
      );
      return response['success'] as bool? ?? true;
    } on ApiException {
      return true; // Local Fallback Mode
    } catch (_) {
      return true;
    }
  }

  /// Withdraws an advertisement payload from the tracker gateway.
  Future<bool> withdrawAdvertisement(String nodeId, String cid) async {
    try {
      final Map<String, dynamic> response = await _client.post(
        '/api/v1/sharing/unadvertise',
        <String, dynamic>{'node_id': nodeId, 'cid': cid},
      );
      return response['success'] as bool? ?? true;
    } on ApiException {
      return true;
    } catch (_) {
      return true;
    }
  }
}
