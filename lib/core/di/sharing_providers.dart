import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sharing/advertisement_service.dart';
import '../sharing/content_sharing_manager.dart';
import '../sharing/sharing_policy_engine.dart';
import '../sharing/tracker_publisher.dart';
import 'data_providers.dart';

final Provider<SharingPolicyEngine> sharingPolicyEngineProvider = Provider<SharingPolicyEngine>((Ref ref) {
  return SharingPolicyEngine();
});

final Provider<AdvertisementService> advertisementServiceProvider = Provider<AdvertisementService>((Ref ref) {
  return AdvertisementService();
});

final Provider<TrackerPublisher> trackerPublisherProvider = Provider<TrackerPublisher>((Ref ref) {
  final client = ref.watch(apiClientProvider);
  return TrackerPublisher(apiClient: client);
});

final Provider<ContentSharingManager> contentSharingManagerProvider = Provider<ContentSharingManager>((Ref ref) {
  final policyEngine = ref.watch(sharingPolicyEngineProvider);
  final adService = ref.watch(advertisementServiceProvider);
  final publisher = ref.watch(trackerPublisherProvider);

  return ContentSharingManager(
    nodeId: 'node_local_client_01',
    policyEngine: policyEngine,
    advertisementService: adService,
    trackerPublisher: publisher,
  );
});
