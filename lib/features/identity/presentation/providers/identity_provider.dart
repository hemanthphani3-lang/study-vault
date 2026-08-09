import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/identity_providers.dart';
import '../../../../core/identity/identity_service.dart';
import '../../../../core/identity/node_profile.dart';

// ─── Identity State ──────────────────────────────────────────────────────────

class NodeIdentityState {
  const NodeIdentityState({
    this.profile,
    this.isLoading = false,
    this.errorMessage,
  });

  final NodeProfile? profile;
  final bool isLoading;
  final String? errorMessage;

  NodeIdentityState copyWith({
    NodeProfile? profile,
    bool? isLoading,
    String? errorMessage,
  }) {
    return NodeIdentityState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isRegistered => profile?.registrationStatus == 'registered';
}

// ─── Notifier ────────────────────────────────────────────────────────────────

class NodeIdentityNotifier extends Notifier<NodeIdentityState> {
  @override
  NodeIdentityState build() {
    // Auto-initialize identity on build
    Future.microtask(() => initialize());
    return const NodeIdentityState(isLoading: true);
  }

  IdentityService get _service => ref.read(identityServiceProvider);

  Future<void> initialize() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final NodeProfile profile = await _service.initializeIdentity();
      state = NodeIdentityState(profile: profile, isLoading: false);
      // Auto-register with tracker
      await registerWithTracker();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to initialize node identity: $e',
      );
    }
  }

  Future<void> registerWithTracker() async {
    if (state.profile == null) return;
    try {
      final NodeProfile updated = await _service.registerIdentity();
      state = state.copyWith(profile: updated);
    } catch (_) {
      // Degrade gracefully if offline
    }
  }

  Future<void> refreshIdentity() async {
    state = state.copyWith(isLoading: true);
    try {
      final NodeProfile profile = await _service.refreshIdentity();
      state = NodeIdentityState(profile: profile, isLoading: false);
      await registerWithTracker();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

// ─── Providers ───────────────────────────────────────────────────────────────

final NotifierProvider<NodeIdentityNotifier, NodeIdentityState> nodeIdentityProvider =
    NotifierProvider<NodeIdentityNotifier, NodeIdentityState>(NodeIdentityNotifier.new);

final Provider<NodeProfile?> currentProfileProvider = Provider<NodeProfile?>((Ref ref) {
  return ref.watch(nodeIdentityProvider.select((NodeIdentityState s) => s.profile));
});

final Provider<String> nodeIdProvider = Provider<String>((Ref ref) {
  return ref.watch(nodeIdentityProvider.select((NodeIdentityState s) => s.profile?.nodeId ?? 'node_initializing'));
});

final Provider<String> fingerprintProvider = Provider<String>((Ref ref) {
  return ref.watch(nodeIdentityProvider.select((NodeIdentityState s) => s.profile?.fingerprint ?? 'SHA256:INITIALIZING'));
});

final Provider<bool> isIdentityRegisteredProvider = Provider<bool>((Ref ref) {
  return ref.watch(nodeIdentityProvider.select((NodeIdentityState s) => s.isRegistered));
});
