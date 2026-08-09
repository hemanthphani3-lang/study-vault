import 'dart:convert';
import 'capability_service.dart';
import 'fingerprint_service.dart';
import 'key_management_service.dart';
import 'node_profile.dart';
import 'registration_service.dart';

/// Central Node Identity Service orchestrating local cryptographic identity lifecycle.
class IdentityService {
  IdentityService({
    required KeyManagementService keyManager,
    required FingerprintService fingerprintService,
    required CapabilityService capabilityService,
    RegistrationService? registrationService,
  })  : _keyManager = keyManager,
        _fingerprintService = fingerprintService,
        _capabilityService = capabilityService,
        _registrationService = registrationService;

  final KeyManagementService _keyManager;
  final FingerprintService _fingerprintService;
  final CapabilityService _capabilityService;
  final RegistrationService? _registrationService;

  NodeProfile? _profile;

  NodeProfile? get currentProfile => _profile;

  /// Initializes or restores node identity on app startup.
  Future<NodeProfile> initializeIdentity({String? savedProfileJson, String? savedPrivKeyHex}) async {
    final keyPair = await _keyManager.getOrGenerateKeyPair(storedPrivKeyHex: savedPrivKeyHex);

    if (savedProfileJson != null && savedProfileJson.isNotEmpty) {
      try {
        final Map<String, dynamic> decoded = jsonDecode(savedProfileJson) as Map<String, dynamic>;
        _profile = NodeProfile.fromJson(decoded);
      } catch (_) {}
    }

    if (_profile == null) {
      final String shortUuid = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
      final String nodeId = 'node_$shortUuid';
      final String pubKey = keyPair.publicKeyHex;
      final String fingerprint = _fingerprintService.computeFingerprint(pubKey);
      final List<String> caps = _capabilityService.getDeviceCapabilities();
      final String platform = _capabilityService.getPlatformName();

      _profile = NodeProfile(
        nodeId: nodeId,
        publicKeyHex: pubKey,
        fingerprint: fingerprint,
        platform: platform,
        appVersion: '0.10.0-alpha',
        countryCode: 'US',
        capabilities: caps,
        createdAt: DateTime.now(),
        lastSeenAt: DateTime.now(),
        registrationStatus: 'unregistered',
      );
    } else {
      _profile = _profile!.copyWith(lastSeenAt: DateTime.now());
    }

    return _profile!;
  }

  /// Attempts registration of identity with Tracker.
  Future<NodeProfile> registerIdentity() async {
    if (_profile == null) throw StateError('Identity must be initialized before registration.');

    if (_registrationService != null) {
      final bool success = await _registrationService.registerNodeIdentity(_profile!);
      final String newStatus = success ? 'registered' : 'unregistered';
      _profile = _profile!.copyWith(registrationStatus: newStatus);
    }
    return _profile!;
  }

  /// Updates node capabilities list.
  NodeProfile updateCapabilities(List<String> newCapabilities) {
    if (_profile == null) throw StateError('Identity not initialized.');
    _profile = _profile!.copyWith(capabilities: newCapabilities);
    return _profile!;
  }

  /// Refreshes/Re-generates identity (for test recovery or key rotation).
  Future<NodeProfile> refreshIdentity() async {
    _profile = null;
    return initializeIdentity();
  }
}
