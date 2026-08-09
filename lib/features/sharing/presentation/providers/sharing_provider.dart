import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/sharing_providers.dart';
import '../../../../core/sharing/content_sharing_manager.dart';
import '../../../../core/sharing/sharing_models.dart';

class ContentSharingStateContainer {
  const ContentSharingStateContainer({
    this.catalog = const <SharedResourceRecord>[],
    this.policy = const SharingPolicy(),
    this.telemetry,
    this.isLoading = false,
  });

  final List<SharedResourceRecord> catalog;
  final SharingPolicy policy;
  final SharingTelemetry? telemetry;
  final bool isLoading;

  ContentSharingStateContainer copyWith({
    List<SharedResourceRecord>? catalog,
    SharingPolicy? policy,
    SharingTelemetry? telemetry,
    bool? isLoading,
  }) {
    return ContentSharingStateContainer(
      catalog: catalog ?? this.catalog,
      policy: policy ?? this.policy,
      telemetry: telemetry ?? this.telemetry,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ContentSharingNotifier extends Notifier<ContentSharingStateContainer> {
  @override
  ContentSharingStateContainer build() {
    return const ContentSharingStateContainer();
  }

  ContentSharingManager get _manager => ref.read(contentSharingManagerProvider);

  Future<void> registerNewDownload({
    required String metadataId,
    required String title,
    required String cid,
    required int fileSizeBytes,
  }) async {
    state = state.copyWith(isLoading: true);
    await _manager.registerCompletedDownload(
      metadataId: metadataId,
      title: title,
      cid: cid,
      fileSizeBytes: fileSizeBytes,
    );
    _updateState();
  }

  Future<void> updatePolicy(SharingPolicy newPolicy) async {
    ref.read(sharingPolicyEngineProvider).policy = newPolicy;
    await _manager.reevaluateAllPolicies();
    state = state.copyWith(policy: newPolicy);
    _updateState();
  }

  Future<void> toggleAllowMobileData(bool allow) async {
    final updated = state.policy.copyWith(allowMobileData: allow);
    await updatePolicy(updated);
  }

  Future<void> toggleRequireCharging(bool require) async {
    final updated = state.policy.copyWith(requireCharging: require);
    await updatePolicy(updated);
  }

  Future<void> refreshCatalog() async {
    await _manager.reevaluateAllPolicies();
    _updateState();
  }

  void _updateState() {
    state = state.copyWith(
      catalog: _manager.catalog,
      telemetry: _manager.getTelemetry(),
      isLoading: false,
    );
  }
}

final NotifierProvider<ContentSharingNotifier, ContentSharingStateContainer> contentSharingProvider =
    NotifierProvider<ContentSharingNotifier, ContentSharingStateContainer>(ContentSharingNotifier.new);
