import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/trust/trust_models.dart';
import '../providers/trust_provider.dart';

/// Production-grade SVTF Trust Framework Dashboard UI for SVE-008.
class TrustDashboardScreen extends ConsumerStatefulWidget {
  const TrustDashboardScreen({super.key});

  @override
  ConsumerState<TrustDashboardScreen> createState() => _TrustDashboardScreenState();
}

class _TrustDashboardScreenState extends ConsumerState<TrustDashboardScreen> {
  late final TextEditingController _nodeIdController;

  @override
  void initState() {
    super.initState();
    _nodeIdController = TextEditingController(text: 'node_alpha_seeder_01');
    Future.microtask(() {
      ref.read(trustProvider.notifier).selectNode('node_alpha_seeder_01');
    });
  }

  @override
  void dispose() {
    _nodeIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trustState = ref.watch(trustProvider);
    final score = trustState.selectedScore;
    final events = trustState.events;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('SVTF Peer Trust Framework'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Metrics',
            onPressed: () {
              ref.read(trustProvider.notifier).refreshMetrics();
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

            // Node Selector & Composite Score Card
            _buildScoreOverviewCard(context, trustState, score),
            const SizedBox(height: 20),

            // 5-Dimensional Radar Component Breakdown
            if (score != null) ...<Widget>[
              _buildRadarBreakdownCard(context, score),
              const SizedBox(height: 20),
            ],

            // Event Simulator Panel
            _buildEventSimulatorCard(context, ref),
            const SizedBox(height: 20),

            // Historical Trust Audit Event Trail
            _buildEventsSection(context, events),
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
                  const Icon(Icons.verified, color: AppColors.primary, size: 24),
                  const SizedBox(width: 8),
                  Text('DECENTRALIZED REPUTATION ACTIVE', style: AppTypography.caption.copyWith(color: AppColors.primary)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: const Text('SVTF v1.0', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('5-Dimensional Peer Trust Engine', style: AppTypography.headlineSmall),
          const SizedBox(height: 6),
          const Text(
            'Passive reputation telemetry over availability, integrity, reliability, security, and freshness. Zero permanent blacklists.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreOverviewCard(BuildContext context, TrustStateContainer trustState, TrustScore? score) {
    final double overall = score?.overallScore ?? 50.0;
    final TrustState state = score?.trustState ?? TrustState.newNode;
    final Color stateColor = _getStateColor(state);

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
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _nodeIdController,
                  style: const TextStyle(color: AppColors.textPrimary, fontFamily: 'monospace'),
                  decoration: const InputDecoration(
                    labelText: 'Inspected Node ID',
                    fillColor: AppColors.card,
                    filled: true,
                  ),
                  onSubmitted: (String val) {
                    if (val.trim().isNotEmpty) {
                      ref.read(trustProvider.notifier).selectNode(val.trim());
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text('Inspect'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                onPressed: () {
                  final val = _nodeIdController.text.trim();
                  if (val.isNotEmpty) {
                    ref.read(trustProvider.notifier).selectNode(val);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('COMPOSITE TRUST SCORE', style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text('$overall', style: AppTypography.displayMedium.copyWith(color: stateColor)),
                      Text(' / 100', style: AppTypography.titleMedium.copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: stateColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: stateColor),
                ),
                child: Text(
                  state.name.toUpperCase(),
                  style: TextStyle(color: stateColor, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadarBreakdownCard(BuildContext context, TrustScore score) {
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
          Text('5-DIMENSIONAL TRUST BREAKDOWN', style: AppTypography.caption),
          const SizedBox(height: 16),
          _buildScoreBar('Availability (25%)', score.availabilityScore),
          const SizedBox(height: 10),
          _buildScoreBar('Integrity (25%)', score.integrityScore),
          const SizedBox(height: 10),
          _buildScoreBar('Reliability (25%)', score.reliabilityScore),
          const SizedBox(height: 10),
          _buildScoreBar('Security (15%)', score.securityScore),
          const SizedBox(height: 10),
          _buildScoreBar('Freshness (10%)', score.freshnessScore),
        ],
      ),
    );
  }

  Widget _buildScoreBar(String label, double scoreValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(label, style: const TextStyle(color: AppColors.textPrimary, fontSize: 13)),
            Text('${scoreValue.toStringAsFixed(1)} pts', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: (scoreValue / 100.0).clamp(0.0, 1.0),
          backgroundColor: AppColors.card,
          color: scoreValue >= 70 ? AppColors.success : scoreValue >= 30 ? AppColors.warning : AppColors.error,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildEventSimulatorCard(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(trustProvider.notifier);

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
          Text('SIMULATE NETWORK EVENT TELEMETRY', style: AppTypography.caption),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.add_task),
                label: const Text('Transfer Success (+2.0)'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                onPressed: () => notifier.simulateEvent('TRANSFER_SUCCESS'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.error_outline),
                label: const Text('Transfer Fail (-3.0)'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.warning),
                onPressed: () => notifier.simulateEvent('TRANSFER_FAILURE'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.gpp_bad),
                label: const Text('Security Violation (-15.0)'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                onPressed: () => notifier.simulateEvent('SECURITY_VIOLATION'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.find_replace),
                label: const Text('CID Mismatch (-5.0)'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
                onPressed: () => notifier.simulateEvent('CID_MISMATCH'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventsSection(BuildContext context, List<TrustEvent> events) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('TRUST EVENT AUDIT TRAIL (${events.length})', style: AppTypography.caption),
        const SizedBox(height: 10),
        if (events.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: Text('No network trust events recorded yet.', style: TextStyle(color: AppColors.textSecondary))),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: events.length > 10 ? 10 : events.length,
            itemBuilder: (BuildContext context, int index) {
              final item = events[index];
              final bool isPos = item.scoreDelta >= 0;

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorderSubtle),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      isPos ? Icons.trending_up : Icons.trending_down,
                      color: isPos ? AppColors.success : AppColors.error,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(item.eventType, style: TextStyle(color: isPos ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold, fontSize: 12)),
                              Text('${isPos ? "+" : ""}${item.scoreDelta} pts', style: TextStyle(color: isPos ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold, fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(item.details, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                          const SizedBox(height: 2),
                          Text('Node: ${item.nodeId} | ${item.timestamp.toIso8601String().substring(11, 19)}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 10, fontFamily: 'monospace')),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }

  Color _getStateColor(TrustState state) {
    switch (state) {
      case TrustState.highlyTrusted:
      case TrustState.trusted:
        return AppColors.success;
      case TrustState.recovery:
      case TrustState.newNode:
        return AppColors.primary;
      case TrustState.warning:
        return AppColors.warning;
      case TrustState.restricted:
        return AppColors.error;
      default:
        return AppColors.secondary;
    }
  }
}
