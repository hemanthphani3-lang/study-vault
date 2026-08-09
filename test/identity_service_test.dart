import 'package:flutter_test/flutter_test.dart';
import 'package:study_vault/core/identity/capability_service.dart';
import 'package:study_vault/core/identity/fingerprint_service.dart';
import 'package:study_vault/core/identity/identity_service.dart';
import 'package:study_vault/core/identity/key_management_service.dart';
import 'package:study_vault/core/identity/node_profile.dart';

void main() {
  group('IdentityService & Domain Services', () {
    late KeyManagementService keyManager;
    late FingerprintService fingerprintService;
    late CapabilityService capabilityService;
    late IdentityService identityService;

    setUp(() {
      keyManager = KeyManagementService();
      fingerprintService = const FingerprintService();
      capabilityService = const CapabilityService();
      identityService = IdentityService(
        keyManager: keyManager,
        fingerprintService: fingerprintService,
        capabilityService: capabilityService,
      );
    });

    test('initializeIdentity generates new NodeProfile on first launch', () async {
      final NodeProfile profile = await identityService.initializeIdentity();
      expect(profile.nodeId, startsWith('node_'));
      expect(profile.publicKeyHex.length, 64);
      expect(profile.fingerprint, startsWith('SHA256:'));
      expect(profile.capabilities, contains('metadata_relay'));
      expect(profile.registrationStatus, 'unregistered');
    });

    test('initializeIdentity restores profile when saved JSON is provided', () async {
      final NodeProfile original = NodeProfile(
        nodeId: 'node_restored_123',
        publicKeyHex: '1' * 64,
        fingerprint: 'SHA256:AA:BB:CC',
        platform: 'windows',
        appVersion: '0.10.0-alpha',
        countryCode: 'CH',
        capabilities: const <String>['metadata_relay', 'peer_seeder'],
        createdAt: DateTime(2026, 8, 8),
        lastSeenAt: DateTime(2026, 8, 8),
      );

      final NodeProfile restored = await identityService.initializeIdentity(
        savedProfileJson: jsonEncodeString(original.toJson()),
        savedPrivKeyHex: '2' * 64,
      );

      expect(restored.nodeId, 'node_restored_123');
      expect(restored.countryCode, 'CH');
      expect(restored.capabilities, contains('peer_seeder'));
    });

    test('updateCapabilities updates profile capabilities list', () async {
      await identityService.initializeIdentity();
      final updated = identityService.updateCapabilities(<String>['metadata_relay', 'custom_cap']);
      expect(updated.capabilities, contains('custom_cap'));
    });

    test('refreshIdentity rotates profile and generates new nodeId', () async {
      final p1 = await identityService.initializeIdentity();
      final p2 = await identityService.refreshIdentity();
      expect(p1.nodeId, isNot(equals(p2.nodeId)));
    });
  });
}

String jsonEncodeString(Map<String, dynamic> json) {
  return '{"nodeId":"${json['nodeId']}","publicKeyHex":"${json['publicKeyHex']}","fingerprint":"${json['fingerprint']}","platform":"${json['platform']}","appVersion":"${json['appVersion']}","countryCode":"${json['countryCode']}","capabilities":["metadata_relay","peer_seeder"],"createdAt":"${json['createdAt']}","lastSeenAt":"${json['lastSeenAt']}","trustScore":1.0,"reputationTier":"standard","registrationStatus":"unregistered","metadataCount":0}';
}
