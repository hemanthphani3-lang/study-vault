import 'dart:typed_data';

enum ChunkStatus { pending, downloading, verified, corrupted, failed }

/// Immutable model representing an individual file chunk in SVTP/1.0.
class ChunkModel {
  const ChunkModel({
    required this.index,
    required this.sizeBytes,
    required this.checksumHex,
    this.status = ChunkStatus.pending,
    this.receivedBytes = 0,
    this.data,
  });

  final int index;
  final int sizeBytes;
  final String checksumHex;
  final ChunkStatus status;
  final int receivedBytes;
  final Uint8List? data;

  bool get isVerified => status == ChunkStatus.verified;
  double get progress => sizeBytes == 0 ? 0.0 : (receivedBytes / sizeBytes).clamp(0.0, 1.0);

  ChunkModel copyWith({
    int? index,
    int? sizeBytes,
    String? checksumHex,
    ChunkStatus? status,
    int? receivedBytes,
    Uint8List? data,
  }) {
    return ChunkModel(
      index: index ?? this.index,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      checksumHex: checksumHex ?? this.checksumHex,
      status: status ?? this.status,
      receivedBytes: receivedBytes ?? this.receivedBytes,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'index': index,
      'sizeBytes': sizeBytes,
      'checksumHex': checksumHex,
      'status': status.name,
      'receivedBytes': receivedBytes,
    };
  }
}
