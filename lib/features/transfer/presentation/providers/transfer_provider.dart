import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/security_providers.dart';
import '../../../../core/di/transfer_providers.dart';
import '../../../../core/security/security_models.dart';
import '../../../../core/transfer/transfer_manager.dart';
import '../../../../core/transfer/transfer_session.dart';

class TransferStateContainer {
  const TransferStateContainer({
    this.sessions = const <TransferSession>[],
    this.activeSessionId,
  });

  final List<TransferSession> sessions;
  final String? activeSessionId;

  TransferSession? get activeSession {
    if (activeSessionId == null) return sessions.isNotEmpty ? sessions.first : null;
    try {
      return sessions.firstWhere((TransferSession s) => s.sessionId == activeSessionId);
    } catch (_) {
      return sessions.isNotEmpty ? sessions.first : null;
    }
  }

  int get activeDownloadsCount => sessions.where((TransferSession s) => s.isActive).length;
}

class TransferNotifier extends Notifier<TransferStateContainer> {
  @override
  TransferStateContainer build() {
    return const TransferStateContainer();
  }

  TransferManager get _manager => ref.read(transferManagerProvider);

  Future<void> startNewTransfer({
    required String metadataId,
    required String title,
    required String targetPeerId,
    required int fileSizeBytes,
    Uint8List? mockSourceBuffer,
  }) async {
    final securityService = ref.read(securityGatewayServiceProvider);

    // Step 1: Execute SVSG Zero Trust Authorization Pipeline
    final String nonce = 'nonce_${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}';
    const String pubKeyHex = '0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9';
    const String fingerprint = 'SHA256:AA:BB:CC:DD:EE:FF:11:22';
    const String signature = '11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff';

    final authReq = SecurityAuthRequest(
      nodeId: 'node_local_client_01',
      publicKeyHex: pubKeyHex,
      fingerprint: fingerprint,
      signatureHex: signature,
      timestamp: DateTime.now().toUtc(),
      nonce: nonce,
      metadataId: metadataId,
      targetPeerId: targetPeerId,
      fileSizeBytes: fileSizeBytes,
    );

    final SecurityAuthResponse authResp = await securityService.authorizeTransfer(authReq);

    // Step 2: Hand-off to Transfer Manager with SVSG Authorization Token
    final session = await _manager.startTransfer(
      metadataId: metadataId,
      title: title,
      targetPeerId: targetPeerId,
      fileSizeBytes: fileSizeBytes,
      authToken: authResp.authToken,
      mockSourceBuffer: mockSourceBuffer,
    );

    _updateState(selectedSessionId: session.sessionId);
  }

  void pauseTransfer(String sessionId) {
    _manager.pauseTransfer(sessionId);
    _updateState();
  }

  void resumeTransfer(String sessionId) {
    _manager.resumeTransfer(sessionId);
    _updateState();
  }

  void cancelTransfer(String sessionId) {
    _manager.cancelTransfer(sessionId);
    _updateState();
  }

  void retryTransfer(String sessionId) {
    _manager.retryTransfer(sessionId);
    _updateState();
  }

  void selectSession(String sessionId) {
    state = TransferStateContainer(sessions: state.sessions, activeSessionId: sessionId);
  }

  void _updateState({String? selectedSessionId}) {
    state = TransferStateContainer(
      sessions: _manager.activeSessions,
      activeSessionId: selectedSessionId ?? state.activeSessionId,
    );
  }
}

final NotifierProvider<TransferNotifier, TransferStateContainer> transferProvider =
    NotifierProvider<TransferNotifier, TransferStateContainer>(TransferNotifier.new);
