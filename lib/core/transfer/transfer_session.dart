import 'dart:typed_data';
import 'chunk_model.dart';

enum TransferState {
  idle,
  connecting,
  handshaking,
  negotiating,
  downloading,
  paused,
  resuming,
  verifying,
  completed,
  cancelled,
  failed,
}

/// Immutable model representing an active SVTP/1.0 Transfer Session.
class TransferSession {
  const TransferSession({
    required this.sessionId,
    required this.metadataId,
    required this.title,
    required this.targetPeerId,
    required this.fileSizeBytes,
    required this.chunks,
    this.status = TransferState.idle,
    this.speedBps = 0.0,
    this.etaSeconds = 0,
    this.errorMessage,
    this.assembledData,
  });

  final String sessionId;
  final String metadataId;
  final String title;
  final String targetPeerId;
  final int fileSizeBytes;
  final List<ChunkModel> chunks;
  final TransferState status;
  final double speedBps;
  final int etaSeconds;
  final String? errorMessage;
  final Uint8List? assembledData;

  int get completedChunkCount => chunks.where((ChunkModel c) => c.isVerified).length;
  int get totalChunkCount => chunks.length;
  
  int get downloadedBytes => chunks.fold(
        0,
        (int sum, ChunkModel c) => sum + (c.isVerified ? c.sizeBytes : c.receivedBytes),
      );

  double get progressPercentage {
    if (fileSizeBytes == 0) return 0.0;
    return ((downloadedBytes / fileSizeBytes) * 100.0).clamp(0.0, 100.0);
  }

  bool get isActive =>
      status == TransferState.downloading ||
      status == TransferState.connecting ||
      status == TransferState.handshaking ||
      status == TransferState.negotiating ||
      status == TransferState.verifying;

  TransferSession copyWith({
    String? sessionId,
    String? metadataId,
    String? title,
    String? targetPeerId,
    int? fileSizeBytes,
    List<ChunkModel>? chunks,
    TransferState? status,
    double? speedBps,
    int? etaSeconds,
    String? errorMessage,
    Uint8List? assembledData,
  }) {
    return TransferSession(
      sessionId: sessionId ?? this.sessionId,
      metadataId: metadataId ?? this.metadataId,
      title: title ?? this.title,
      targetPeerId: targetPeerId ?? this.targetPeerId,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      chunks: chunks ?? this.chunks,
      status: status ?? this.status,
      speedBps: speedBps ?? this.speedBps,
      etaSeconds: etaSeconds ?? this.etaSeconds,
      errorMessage: errorMessage,
      assembledData: assembledData ?? this.assembledData,
    );
  }
}
