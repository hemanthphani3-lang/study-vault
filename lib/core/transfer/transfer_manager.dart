import 'dart:async';
import 'dart:typed_data';
import 'bandwidth_limiter.dart';
import 'chunk_manager.dart';
import 'chunk_model.dart';
import 'transfer_session.dart';

/// Central Transfer Manager Engine for SVTP/1.0.
/// Manages parallel/sequential chunk downloading, SHA-256 verification,
/// session controls (pause/resume/cancel/retry), and bandwidth estimation.
class TransferManager {
  TransferManager({
    ChunkManager? chunkManager,
    BandwidthLimiter? bandwidthLimiter,
  })  : _chunkManager = chunkManager ?? ChunkManager(),
        _bandwidthLimiter = bandwidthLimiter ?? BandwidthLimiter();

  final ChunkManager _chunkManager;
  final BandwidthLimiter _bandwidthLimiter;

  final Map<String, TransferSession> _sessions = <String, TransferSession>{};
  final Map<String, Timer> _transferTimers = <String, Timer>{};

  List<TransferSession> get activeSessions => _sessions.values.toList();

  TransferSession? getSession(String sessionId) => _sessions[sessionId];

  /// Starts a new SVTP/1.0 transfer session for a resource.
  /// Requires valid SVSG authorization token (`svsg_auth_<hash>`).
  Future<TransferSession> startTransfer({
    required String metadataId,
    required String title,
    required String targetPeerId,
    required int fileSizeBytes,
    String? authToken,
    Uint8List? mockSourceBuffer,
  }) async {
    final String sessionId = 'sess_${metadataId}_${DateTime.now().millisecondsSinceEpoch.toRadixString(36)}';
    final List<ChunkModel> manifest = _chunkManager.prepareManifest(fileSizeBytes, sourceBuffer: mockSourceBuffer);

    final bool isAuthorized = authToken != null && authToken.startsWith('svsg_auth_');

    var session = TransferSession(
      sessionId: sessionId,
      metadataId: metadataId,
      title: title,
      targetPeerId: targetPeerId,
      fileSizeBytes: fileSizeBytes,
      chunks: manifest,
      status: isAuthorized ? TransferState.idle : TransferState.failed,
      errorMessage: isAuthorized ? null : 'SVSG Security Gateway Authorization Required: Invalid or missing token.',
    );

    _sessions[sessionId] = session;
    if (isAuthorized) {
      _runSessionLifecycle(sessionId, mockSourceBuffer: mockSourceBuffer);
    }
    return _sessions[sessionId]!;
  }

  /// Pauses an active transfer session.
  TransferSession pauseTransfer(String sessionId) {
    var session = _sessions[sessionId];
    if (session == null) throw ArgumentError('Session not found: $sessionId');

    _transferTimers[sessionId]?.cancel();
    _transferTimers.remove(sessionId);

    session = session.copyWith(
      status: TransferState.paused,
      speedBps: 0.0,
      etaSeconds: 0,
    );
    _sessions[sessionId] = session;
    return session;
  }

  /// Resumes a paused or interrupted transfer session.
  TransferSession resumeTransfer(String sessionId, {Uint8List? mockSourceBuffer}) {
    var session = _sessions[sessionId];
    if (session == null) throw ArgumentError('Session not found: $sessionId');

    if (session.status == TransferState.paused || session.status == TransferState.failed) {
      session = session.copyWith(status: TransferState.resuming);
      _sessions[sessionId] = session;
      _runSessionLifecycle(sessionId, mockSourceBuffer: mockSourceBuffer);
    }
    return _sessions[sessionId]!;
  }

  /// Cancels an active or paused transfer session.
  TransferSession cancelTransfer(String sessionId) {
    var session = _sessions[sessionId];
    if (session == null) throw ArgumentError('Session not found: $sessionId');

    _transferTimers[sessionId]?.cancel();
    _transferTimers.remove(sessionId);

    session = session.copyWith(
      status: TransferState.cancelled,
      speedBps: 0.0,
      etaSeconds: 0,
    );
    _sessions[sessionId] = session;
    return session;
  }

  /// Retries a failed transfer session.
  TransferSession retryTransfer(String sessionId, {Uint8List? mockSourceBuffer}) {
    var session = _sessions[sessionId];
    if (session == null) throw ArgumentError('Session not found: $sessionId');

    session = session.copyWith(status: TransferState.idle);
    _sessions[sessionId] = session;
    _runSessionLifecycle(sessionId, mockSourceBuffer: mockSourceBuffer);
    return _sessions[sessionId]!;
  }

  /// Simulates SVTP state machine lifecycle transitions and chunk streaming.
  void _runSessionLifecycle(String sessionId, {Uint8List? mockSourceBuffer}) {
    _transferTimers[sessionId]?.cancel();

    // Step 1: Connecting -> Handshaking -> Negotiating -> Downloading
    Timer(const Duration(milliseconds: 50), () {
      _updateSessionStatus(sessionId, TransferState.connecting);
    });

    Timer(const Duration(milliseconds: 150), () {
      _updateSessionStatus(sessionId, TransferState.handshaking);
    });

    Timer(const Duration(milliseconds: 250), () {
      _updateSessionStatus(sessionId, TransferState.negotiating);
    });

    Timer(const Duration(milliseconds: 350), () {
      _updateSessionStatus(sessionId, TransferState.downloading);
      _startChunkDownloadingLoop(sessionId, mockSourceBuffer: mockSourceBuffer);
    });
  }

  void _startChunkDownloadingLoop(String sessionId, {Uint8List? mockSourceBuffer}) {
    _bandwidthLimiter.reset();

    final timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      var session = _sessions[sessionId];
      if (session == null || session.status != TransferState.downloading) {
        t.cancel();
        return;
      }

      final missingIndices = _chunkManager.getMissingChunkIndices(session.chunks);
      if (missingIndices.isEmpty) {
        t.cancel();
        _verifyAndCompleteSession(sessionId);
        return;
      }

      final int targetChunkIndex = missingIndices.first;
      final ChunkModel currentChunk = session.chunks[targetChunkIndex];

      // Simulate chunk payload download
      final Uint8List chunkData = (currentChunk.data != null)
          ? currentChunk.data!
          : (mockSourceBuffer != null && mockSourceBuffer.length >= (targetChunkIndex + 1) * currentChunk.sizeBytes)
              ? mockSourceBuffer.sublist(targetChunkIndex * currentChunk.sizeBytes, (targetChunkIndex + 1) * currentChunk.sizeBytes)
              : Uint8List.fromList(List.generate(currentChunk.sizeBytes, (i) => (targetChunkIndex + i) % 256));

      final ChunkModel verifiedChunk = _chunkManager.processReceivedChunk(currentChunk, chunkData);

      final List<ChunkModel> updatedChunks = List<ChunkModel>.from(session.chunks);
      updatedChunks[targetChunkIndex] = verifiedChunk;

      _bandwidthLimiter.updateProgress(session.downloadedBytes + verifiedChunk.sizeBytes);
      final int remainingBytes = session.fileSizeBytes - (session.downloadedBytes + verifiedChunk.sizeBytes);
      final int eta = _bandwidthLimiter.estimateEtaSeconds(remainingBytes);

      _sessions[sessionId] = session.copyWith(
        chunks: updatedChunks,
        speedBps: _bandwidthLimiter.currentSpeedBps,
        etaSeconds: eta,
      );
    });

    _transferTimers[sessionId] = timer;
  }

  void _verifyAndCompleteSession(String sessionId) {
    var session = _sessions[sessionId];
    if (session == null) return;

    _updateSessionStatus(sessionId, TransferState.verifying);

    // Full assembly verification
    final Uint8List assembled = _chunkManager.assembleChunks(session.chunks);
    _sessions[sessionId] = session.copyWith(
      status: TransferState.completed,
      speedBps: 0.0,
      etaSeconds: 0,
      assembledData: assembled,
    );
  }

  void _updateSessionStatus(String sessionId, TransferState status) {
    var session = _sessions[sessionId];
    if (session != null) {
      _sessions[sessionId] = session.copyWith(status: status);
    }
  }
}
