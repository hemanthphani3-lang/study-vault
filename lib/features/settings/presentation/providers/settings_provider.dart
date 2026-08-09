import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Settings state for decentralized node parameters, storage limits, and theme.
class SettingsState {
  const SettingsState({
    required this.maxStorageQuotaBytes,
    required this.isP2PRelayingEnabled,
    required this.isAutoSyncOnWifiOnly,
    required this.enablePeerDiscovery,
    required this.enableBackgroundSync,
    required this.bootstrapGateways,
  });

  final int maxStorageQuotaBytes;
  final bool isP2PRelayingEnabled;
  final bool isAutoSyncOnWifiOnly;
  final bool enablePeerDiscovery;
  final bool enableBackgroundSync;
  final List<String> bootstrapGateways;

  static const SettingsState initial = SettingsState(
    maxStorageQuotaBytes: 10737418240, // 10 GB
    isP2PRelayingEnabled: true,
    isAutoSyncOnWifiOnly: false,
    enablePeerDiscovery: true,
    enableBackgroundSync: true,
    bootstrapGateways: <String>[
      'https://gateway.ipfs.io',
      'https://dweb.link',
      'https://cloudflare-ipfs.com',
    ],
  );

  SettingsState copyWith({
    int? maxStorageQuotaBytes,
    bool? isP2PRelayingEnabled,
    bool? isAutoSyncOnWifiOnly,
    bool? enablePeerDiscovery,
    bool? enableBackgroundSync,
    List<String>? bootstrapGateways,
  }) {
    return SettingsState(
      maxStorageQuotaBytes: maxStorageQuotaBytes ?? this.maxStorageQuotaBytes,
      isP2PRelayingEnabled: isP2PRelayingEnabled ?? this.isP2PRelayingEnabled,
      isAutoSyncOnWifiOnly: isAutoSyncOnWifiOnly ?? this.isAutoSyncOnWifiOnly,
      enablePeerDiscovery: enablePeerDiscovery ?? this.enablePeerDiscovery,
      enableBackgroundSync: enableBackgroundSync ?? this.enableBackgroundSync,
      bootstrapGateways: bootstrapGateways ?? this.bootstrapGateways,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(SettingsState.initial);

  void toggleP2PRelaying(bool value) {
    state = state.copyWith(isP2PRelayingEnabled: value);
  }

  void toggleWifiOnly(bool value) {
    state = state.copyWith(isAutoSyncOnWifiOnly: value);
  }

  void togglePeerDiscovery(bool value) {
    state = state.copyWith(enablePeerDiscovery: value);
  }

  void toggleBackgroundSync(bool value) {
    state = state.copyWith(enableBackgroundSync: value);
  }
}

final StateNotifierProvider<SettingsNotifier, SettingsState> settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>(
  (Ref ref) => SettingsNotifier(),
);
