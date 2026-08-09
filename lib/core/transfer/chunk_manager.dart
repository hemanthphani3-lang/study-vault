import 'dart:typed_data';
import '../crypto/sha256_helper.dart';
import 'chunk_model.dart';

/// Chunk Manager handling SVTP chunking, missing chunk bitmasks, and SHA-256 verification.
class ChunkManager {
  ChunkManager({this.chunkSizeBytes = defaultChunkSize});

  static const int defaultChunkSize = 262144; // 256 KB
  final int chunkSizeBytes;

  /// Creates a list of [ChunkModel] manifests for a file of [totalSizeBytes].
  List<ChunkModel> prepareManifest(int totalSizeBytes, {Uint8List? sourceBuffer}) {
    final int chunkCount = (totalSizeBytes / chunkSizeBytes).ceil();
    final List<ChunkModel> chunks = <ChunkModel>[];

    for (int i = 0; i < chunkCount; i++) {
      final int start = i * chunkSizeBytes;
      final int end = (start + chunkSizeBytes > totalSizeBytes) ? totalSizeBytes : start + chunkSizeBytes;
      final int len = end - start;

      String checksum = 'SHA256_PENDING_$i';
      Uint8List? chunkData;

      if (sourceBuffer != null && sourceBuffer.length >= end) {
        chunkData = sourceBuffer.sublist(start, end);
        checksum = Sha256Helper.toHex(Sha256Helper.digest(chunkData));
      }

      chunks.add(ChunkModel(
        index: i,
        sizeBytes: len,
        checksumHex: checksum,
        status: ChunkStatus.pending,
      ));
    }
    return chunks;
  }

  /// Verifies a received chunk's SHA-256 hash against expected checksum.
  ChunkModel processReceivedChunk(ChunkModel chunk, Uint8List data) {
    final String computedHash = Sha256Helper.toHex(Sha256Helper.digest(data));
    
    // If manifest had placeholder checksum, set computed checksum on first download
    final bool isChecksumMatch = chunk.checksumHex.startsWith('SHA256_PENDING')
        ? true
        : computedHash.toLowerCase() == chunk.checksumHex.toLowerCase();

    if (isChecksumMatch) {
      return chunk.copyWith(
        status: ChunkStatus.verified,
        receivedBytes: data.length,
        checksumHex: computedHash,
        data: data,
      );
    } else {
      return chunk.copyWith(
        status: ChunkStatus.corrupted,
        receivedBytes: 0,
      );
    }
  }

  /// Returns indices of chunks that are not yet verified (pending, corrupted, or failed).
  List<int> getMissingChunkIndices(List<ChunkModel> chunks) {
    final List<int> missing = <int>[];
    for (final chunk in chunks) {
      if (!chunk.isVerified) {
        missing.add(chunk.index);
      }
    }
    return missing;
  }

  /// Assembles all verified chunk data bytes into a contiguous binary payload.
  Uint8List assembleChunks(List<ChunkModel> chunks) {
    final int totalSize = chunks.fold(0, (int sum, ChunkModel c) => sum + c.sizeBytes);
    final Uint8List assembled = Uint8List(totalSize);
    int offset = 0;

    for (final chunk in chunks) {
      if (chunk.data != null) {
        assembled.setRange(offset, offset + chunk.data!.length, chunk.data!);
      }
      offset += chunk.sizeBytes;
    }
    return assembled;
  }
}
