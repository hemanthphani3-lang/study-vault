import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/di/identity_providers.dart';
import 'package:study_vault/core/identity/capability_service.dart';
import 'package:study_vault/core/identity/fingerprint_service.dart';
import 'package:study_vault/core/identity/identity_service.dart';
import 'package:study_vault/core/identity/key_management_service.dart';
import 'package:study_vault/features/identity/presentation/providers/identity_provider.dart';

void main() {
  group('NodeIdentityNotifier Riverpod State Machine', () {
    late ProviderContainer container;

    setUp(() {
      final keyManager = KeyManagementService();
      const fingerprintService = FingerprintService();
      const capabilityService = CapabilityService();
      final identityService = IdentityService(
        keyManager: keyManager,
        fingerprintService: fingerprintService,
        capabilityService: capabilityService,
      );

      container = ProviderContainer(
        overrides: <Override>[
          identityServiceProvider.overrideWithValue(identityService),
        ],
      );
    });

    tearDown(() => container.dispose());

    test('initial state has loading or auto-initialized profile', () async {
      final state = container.read(nodeIdentityProvider);
      expect(state.isLoading, isTrue);

      await container.read(nodeIdentityProvider.notifier).initialize();
      final updatedState = container.read(nodeIdentityProvider);
      expect(updatedState.isLoading, isFalse);
      expect(updatedState.profile, isNotNull);
      expect(updatedState.profile!.nodeId, startsWith('node_'));
    });

    test('derived selectors extract profile fields correctly', () async {
      await container.read(nodeIdentityProvider.notifier).initialize();

      final nodeId = container.read(nodeIdProvider);
      final fingerprint = container.read(fingerprintProvider);

      expect(nodeId, startsWith('node_'));
      expect(fingerprint, startsWith('SHA256:'));
    });
  });
}
