import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../identity/capability_service.dart';
import '../identity/fingerprint_service.dart';
import '../identity/identity_service.dart';
import '../identity/key_management_service.dart';
import '../identity/registration_service.dart';
import '../network/api_client.dart';
import 'data_providers.dart';

// ─── Cryptographic & Identity Core Services ──────────────────────────────────

final Provider<KeyManagementService> keyManagementServiceProvider =
    Provider<KeyManagementService>((Ref ref) {
  return KeyManagementService();
});

final Provider<FingerprintService> fingerprintServiceProvider =
    Provider<FingerprintService>((Ref ref) {
  return const FingerprintService();
});

final Provider<CapabilityService> capabilityServiceProvider =
    Provider<CapabilityService>((Ref ref) {
  return const CapabilityService();
});

final Provider<RegistrationService> registrationServiceProvider =
    Provider<RegistrationService>((Ref ref) {
  final ApiClient client = ref.watch(apiClientProvider);
  final KeyManagementService keyManager = ref.watch(keyManagementServiceProvider);
  return RegistrationService(apiClient: client, keyManager: keyManager);
});

final Provider<IdentityService> identityServiceProvider =
    Provider<IdentityService>((Ref ref) {
  final KeyManagementService keyManager = ref.watch(keyManagementServiceProvider);
  final FingerprintService fingerprintService = ref.watch(fingerprintServiceProvider);
  final CapabilityService capabilityService = ref.watch(capabilityServiceProvider);
  final RegistrationService registrationService = ref.watch(registrationServiceProvider);

  return IdentityService(
    keyManager: keyManager,
    fingerprintService: fingerprintService,
    capabilityService: capabilityService,
    registrationService: registrationService,
  );
});
