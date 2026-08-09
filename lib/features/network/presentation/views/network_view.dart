import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/animations/network_mesh_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges/app_badge.dart';
import '../../../../core/widgets/buttons/glass_button.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/cards/network_status_card.dart';
import '../../../../core/widgets/layout/app_divider.dart';
import '../../../../core/widgets/layout/section_header.dart';
import '../../../../core/widgets/overlays/reusable_dialog.dart';
import '../providers/network_provider.dart';

/// P2P Mesh Knowledge Network telemetrics, node status, and swarm diagnostics.
class NetworkView extends ConsumerStatefulWidget {
  const NetworkView({super.key});

  @override
  ConsumerState<NetworkView> createState() => _NetworkViewState();
}

class _NetworkViewState extends ConsumerState<NetworkView> {
  static const String _nodeId = '12D3KooWStUq...84Xm9zE';
  bool _isSeedingEnabled = true;

  void _copyNodeId() {
    Clipboard.setData(const ClipboardData(text: _nodeId));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.surface,
        content: Text(
          'Node ID copied to clipboard!',
          style: AppTypography.bodySmall.copyWith(color: AppColors.secondary),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'P2P Knowledge Mesh',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          const AppBadge(variant: BadgeVariant.online, compact: true),
          AppSpacing.gapW12,
          IconButton(
            icon: const Icon(AppIcons.refresh, color: AppColors.secondary),
            onPressed: () {
              ref.invalidate(networkProvider);
            },
          ),
          AppSpacing.gapW8,
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        children: <Widget>[
          // Interactive Procedural Swarm Mesh Canvas
          ClipRRect(
            borderRadius: AppRadius.rXl,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.rXl,
                border: Border.all(color: AppColors.glassBorder, width: 1.2),
                boxShadow: AppShadows.card,
              ),
              child: const Stack(
                children: <Widget>[
                  NetworkMeshAnimation(),
                  Positioned(
                    top: AppSpacing.sm,
                    left: AppSpacing.md,
                    child: AppBadge(variant: BadgeVariant.online, compact: true),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.gapH20,

          // Node ID & Cryptographic Fingerprint Card
          GlassCard(
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xs),
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    AppIcons.shield,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                AppSpacing.gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Local Node Identity',
                        style: AppTypography.caption.copyWith(color: AppColors.hint),
                      ),
                      AppSpacing.gapH2,
                      Text(
                        _nodeId,
                        style: AppTypography.codeSnippet.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SecondaryButton(
                  label: 'Copy',
                  size: ButtonSize.small,
                  icon: AppIcons.share,
                  onPressed: _copyNodeId,
                ),
              ],
            ),
          ),
          AppSpacing.gapH20,

          // Core Telemetrics Status Card
          const NetworkStatusCard(),
          AppSpacing.gapH24,

          // Knowledge Contribution Metrics Grid
          const SectionHeader(
            title: 'Knowledge Contribution',
            subtitle: 'Bandwidth, storage, and seed ratio metrics',
          ),
          AppSpacing.gapH12,
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.45,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              _MetricCard(
                title: 'Resources Shared',
                value: '42 items',
                subtitle: '84.6 MB seeded',
                icon: AppIcons.upload,
                color: AppColors.primary,
              ),
              _MetricCard(
                title: 'Downloads Served',
                value: '1,280 chunks',
                subtitle: '3.4 GB bandwidth',
                icon: AppIcons.download,
                color: AppColors.secondary,
              ),
              _MetricCard(
                title: 'Countries Linked',
                value: '14 regions',
                subtitle: 'Global peer routing',
                icon: AppIcons.network,
                color: AppColors.success,
              ),
              _MetricCard(
                title: 'Uptime & Health',
                value: '99.98%',
                subtitle: 'DHT Relay Active',
                icon: AppIcons.shield,
                color: AppColors.warning,
              ),
            ],
          ),
          AppSpacing.gapH24,

          // Seeding Policy & Swarm Controls
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Background Seeding Policy',
                          style: AppTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppSpacing.gapH2,
                        Text(
                          'Share local vault chunks with nearby peers',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: _isSeedingEnabled,
                      activeTrackColor: AppColors.primary.withValues(alpha: 0.35),
                      onChanged: (bool val) {
                        setState(() {
                          _isSeedingEnabled = val;
                        });
                      },
                    ),
                  ],
                ),
                const AppDivider(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GlassButton(
                        label: 'Run Swarm Diagnostics',
                        icon: AppIcons.refresh,
                        onPressed: () {
                          ReusableDialog.show<void>(
                            context: context,
                            icon: AppIcons.check,
                            title: 'Swarm Diagnostics Healthy',
                            description:
                                '128 peers connected with an average round-trip latency of 42ms. Zero unverified blocks encountered.',
                            primaryActionLabel: 'Dismiss',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: AppSpacing.pMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: color, size: 16),
              AppSpacing.gapW8,
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.hint,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          AppSpacing.gapH8,
          Text(
            value,
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          AppSpacing.gapH2,
          Text(
            subtitle,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
