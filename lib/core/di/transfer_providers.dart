import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../transfer/bandwidth_limiter.dart';
import '../transfer/chunk_manager.dart';
import '../transfer/transfer_manager.dart';

final Provider<ChunkManager> chunkManagerProvider = Provider<ChunkManager>((Ref ref) {
  return ChunkManager();
});

final Provider<BandwidthLimiter> bandwidthLimiterProvider = Provider<BandwidthLimiter>((Ref ref) {
  return BandwidthLimiter();
});

final Provider<TransferManager> transferManagerProvider = Provider<TransferManager>((Ref ref) {
  final chunkManager = ref.watch(chunkManagerProvider);
  final bandwidthLimiter = ref.watch(bandwidthLimiterProvider);
  return TransferManager(chunkManager: chunkManager, bandwidthLimiter: bandwidthLimiter);
});
