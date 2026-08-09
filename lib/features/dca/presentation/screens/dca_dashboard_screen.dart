import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dca/dca_models.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/dca_provider.dart';

/// Production-grade Distributed Content Addressing (DCA / IPFS) Dashboard UI for SVE-006.
class DcaDashboardScreen extends ConsumerStatefulWidget {
  const DcaDashboardScreen({super.key});

  @override
  ConsumerState<DcaDashboardScreen> createState() => _DcaDashboardScreenState();
}

class _DcaDashboardScreenState extends ConsumerState<DcaDashboardScreen> {
  late final TextEditingController _cidInputController;

  @override
  void initState() {
    super.initState();
    _cidInputController = TextEditingController();
    Future.microtask(() {
      ref.read(dcaProvider.notifier).refreshMetrics();
    });
  }

  @override
  void dispose() {
    _cidInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dcaState = ref.watch(dcaProvider);
    final metrics = dcaState.metrics;
    final records = dcaState.records;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('DCA / IPFS Content Addressing'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_to_photos),
            tooltip: 'Add Sample IPFS Content',
            onPressed: () {
              final mockBytes = Uint8List.fromList(List.generate(1048576, (i) => (i * 17) % 256));
              ref.read(dcaProvider.notifier).addContent(
                    bytes: mockBytes,
                    metadataId: 'res_dca_sample_${DateTime.now().millisecondsSinceEpoch}',
                  );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Telemetry Banner
            _buildTelemetryBanner(context),
            const SizedBox(height: 20),

            // Storage Metrics Card
            if (metrics != null) ...<Widget>[
              _buildMetricsCard(context, metrics),
              const SizedBox(height: 20),
            ],

            // CID Inspector Panel
            _buildCidInspectorCard(context, dcaState),
            const SizedBox(height: 20),

            // Pinned Content Registry List
            _buildRegistryList(context, records, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildTelemetryBanner(BuildContext context) {
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
              Row(
                children: <Widget>[
                  const Icon(Icons.hub, color: AppColors.secondary, size: 24),
                  const SizedBox(width: 8),
                  Text('IPFS DCA SUBSYSTEM', style: AppTypography.caption.copyWith(color: AppColors.secondary)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondary),
                ),
                child: const Text('SVE-006 (CIDv1)', style: TextStyle(color: AppColors.secondary, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('Distributed Content Addressing Engine', style: AppTypography.headlineSmall),
          const SizedBox(height: 6),
          const Text(
            'Resources addressed via immutable multihash CIDv1 identifiers (bafybeic...). Provider-agnostic storage abstraction.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsCard(BuildContext context, StorageMetrics metrics) {
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
              Text('STORAGE QUOTA USAGE', style: AppTypography.caption),
              Text(
                '${_formatBytes(metrics.totalSizeBytes)} / ${_formatBytes(metrics.quotaSizeBytes)}',
                style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: metrics.usageRatio,
            backgroundColor: AppColors.card,
            color: metrics.usageRatio > 0.8 ? AppColors.warning : AppColors.primary,
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildMetricTile('TOTAL CIDs', '${metrics.totalCidCount}'),
              _buildMetricTile('PINNED CIDs', '${metrics.pinnedCidCount}'),
              _buildMetricTile('INTEGRITY FAILURES', '${metrics.integrityFailuresCount}', isError: metrics.integrityFailuresCount > 0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile(String label, String value, {bool isError = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isError ? AppColors.error : AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCidInspectorCard(BuildContext context, DcaStateContainer state) {
    final validation = state.lastValidation;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('CID MULTIHASH VERIFIER', style: AppTypography.caption),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _cidInputController,
                  style: const TextStyle(color: AppColors.textPrimary, fontFamily: 'monospace', fontSize: 12),
                  decoration: const InputDecoration(
                    hintText: 'Enter CIDv1 (e.g. bafybeic...)',
                    fillColor: AppColors.card,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                icon: const Icon(Icons.verified),
                label: const Text('Verify CID'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                onPressed: () {
                  final cid = _cidInputController.text.trim();
                  if (cid.isNotEmpty) {
                    final testBytes = Uint8List.fromList(List.generate(1048576, (i) => (i * 17) % 256));
                    ref.read(dcaProvider.notifier).verifyCid(cid, testBytes);
                  }
                },
              ),
            ],
          ),
          if (validation != null) ...<Widget>[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: validation.isValid ? AppColors.success.withValues(alpha: 0.15) : AppColors.error.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Status: ${validation.isValid ? "✓ MATCH" : "✗ MISMATCH"} — ${validation.details}',
                style: TextStyle(color: validation.isValid ? AppColors.success : AppColors.error, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRegistryList(BuildContext context, List<ContentRecord> records, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('PINNED CONTENT REGISTRY (${records.length})', style: AppTypography.caption),
        const SizedBox(height: 10),
        if (records.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: Text('No DCA content records stored yet.', style: TextStyle(color: AppColors.textSecondary))),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: records.length,
            itemBuilder: (BuildContext context, int index) {
              final record = records[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
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
                        Expanded(
                          child: Text(
                            record.cid,
                            style: const TextStyle(color: AppColors.primary, fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            record.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                            color: record.isPinned ? AppColors.success : AppColors.hint,
                          ),
                          tooltip: record.isPinned ? 'Unpin Content' : 'Pin Content',
                          onPressed: () {
                            ref.read(dcaProvider.notifier).togglePin(record.cid, !record.isPinned);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('Metadata ID: ${record.metadataId}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Path: ${record.localPath}', style: const TextStyle(color: AppColors.hint, fontFamily: 'monospace', fontSize: 11)),
                        Text(_formatBytes(record.fileSizeBytes), style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    if (bytes >= 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    if (bytes >= 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '$bytes B';
  }
}
