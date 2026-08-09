import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/transfer/chunk_model.dart';
import '../../../../core/transfer/transfer_session.dart';
import '../providers/transfer_provider.dart';

/// Production-grade Transfer Dashboard Screen for StudyVault Transfer Protocol (SVTP/1.0).
class TransferScreen extends ConsumerWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferState = ref.watch(transferProvider);
    final activeSession = transferState.activeSession;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('SVTP Transfer Manager (v1.0)'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_task),
            tooltip: 'Start Sample Transfer',
            onPressed: () {
              final mockData = Uint8List.fromList(List.generate(1048576, (i) => i % 256)); // 1MB
              ref.read(transferProvider.notifier).startNewTransfer(
                    metadataId: 'res_zk_snark_paper',
                    title: 'Decentralized zkSNARK Systems for Academic Verification.pdf',
                    targetPeerId: 'node_peer_alpha_01',
                    fileSizeBytes: mockData.length,
                    mockSourceBuffer: mockData,
                  );
            },
          ),
        ],
      ),
      body: activeSession == null
          ? _buildEmptyTransferState(context, ref)
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Session Overview Header
                  _buildHeaderCard(context, activeSession),
                  const SizedBox(height: 20),

                  // Progress & Speed Indicators
                  _buildProgressCard(context, activeSession),
                  const SizedBox(height: 20),

                  // Action Controls Bar
                  _buildActionControls(context, ref, activeSession),
                  const SizedBox(height: 20),

                  // Chunk Verification Grid
                  _buildChunkGridSection(context, activeSession),
                  const SizedBox(height: 20),

                  // Peer Information Card
                  _buildPeerInfoCard(context, activeSession),
                ],
              ),
            ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, TransferSession session) {
    final Color stateColor = _getStateColor(session.status);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('SVTP SESSION ACTIVE', style: AppTypography.caption),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: stateColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: stateColor),
                ),
                child: Text(
                  session.status.name.toUpperCase(),
                  style: TextStyle(color: stateColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(session.title, style: AppTypography.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Session ID: ${session.sessionId}',
            style: const TextStyle(color: AppColors.textSecondary, fontFamily: 'monospace', fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context, TransferSession session) {
    final double pct = session.progressPercentage;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${pct.toStringAsFixed(1)}%', style: AppTypography.displaySmall.copyWith(color: AppColors.primary)),
              Text(_formatSpeed(session.speedBps), style: AppTypography.headlineSmall.copyWith(color: AppColors.secondary)),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: pct / 100.0,
            backgroundColor: AppColors.card,
            color: AppColors.primary,
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Downloaded: ${_formatBytes(session.downloadedBytes)} / ${_formatBytes(session.fileSizeBytes)}',
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
              Text(
                'ETA: ${session.etaSeconds}s',
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionControls(BuildContext context, WidgetRef ref, TransferSession session) {
    final notifier = ref.read(transferProvider.notifier);

    return Row(
      children: <Widget>[
        if (session.status == TransferState.downloading)
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.pause),
              label: const Text('Pause'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.warning),
              onPressed: () => notifier.pauseTransfer(session.sessionId),
            ),
          ),
        if (session.status == TransferState.paused)
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Resume'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
              onPressed: () => notifier.resumeTransfer(session.sessionId),
            ),
          ),
        const SizedBox(width: 12),
        if (session.status == TransferState.failed)
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.replay),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: () => notifier.retryTransfer(session.sessionId),
            ),
          ),
        if (session.status != TransferState.completed && session.status != TransferState.cancelled)
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.cancel, color: AppColors.error),
              label: const Text('Cancel', style: TextStyle(color: AppColors.error)),
              onPressed: () => notifier.cancelTransfer(session.sessionId),
            ),
          ),
      ],
    );
  }

  Widget _buildChunkGridSection(BuildContext context, TransferSession session) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('CHUNK INTEGRITY (SHA-256)', style: AppTypography.caption),
            Text('${session.completedChunkCount} / ${session.totalChunkCount} Verified',
                style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: session.chunks.length,
          itemBuilder: (BuildContext context, int index) {
            final chunk = session.chunks[index];
            final color = _getChunkStatusColor(chunk.status);
            return Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  '${chunk.index}',
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPeerInfoCard(BuildContext context, TransferSession session) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.dns, color: AppColors.secondary, size: 24),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('TARGET SEEDER PEER', style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                  Text(session.targetPeerId, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const Text('SVTP Direct P2P', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildEmptyTransferState(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.download_for_offline_outlined, size: 64, color: AppColors.hint),
          const SizedBox(height: 16),
          Text('No active SVTP transfer session.', style: AppTypography.titleMedium),
          const SizedBox(height: 8),
          const Text('Tap "+" in top bar to start sample 1 MB peer transfer.', style: TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Color _getStateColor(TransferState status) {
    switch (status) {
      case TransferState.completed:
        return AppColors.success;
      case TransferState.downloading:
      case TransferState.verifying:
        return AppColors.primary;
      case TransferState.paused:
        return AppColors.warning;
      case TransferState.failed:
      case TransferState.cancelled:
        return AppColors.error;
      default:
        return AppColors.secondary;
    }
  }

  Color _getChunkStatusColor(ChunkStatus status) {
    switch (status) {
      case ChunkStatus.verified:
        return AppColors.success;
      case ChunkStatus.downloading:
        return AppColors.primary;
      case ChunkStatus.corrupted:
      case ChunkStatus.failed:
        return AppColors.error;
      default:
        return AppColors.card;
    }
  }

  String _formatSpeed(double bps) {
    if (bps >= 1024 * 1024) return '${(bps / (1024 * 1024)).toStringAsFixed(2)} MB/s';
    if (bps >= 1024) return '${(bps / 1024).toStringAsFixed(1)} KB/s';
    return '${bps.toStringAsFixed(0)} B/s';
  }

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    if (bytes >= 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '$bytes B';
  }
}
