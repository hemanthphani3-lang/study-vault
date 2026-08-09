import 'package:flutter/material.dart';
import '../../../shared/enums/network_status.dart';
import '../../animations/pulse_animation.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import 'glass_card.dart';

/// Interactive Network Status Card showing P2P mesh state, latency, and peers.
class NetworkStatusCard extends StatelessWidget {
  const NetworkStatusCard({
    super.key,
    this.status = NetworkStatus.online,
    this.connectedPeers = 38,
    this.latencyMs = 28,
    this.bandwidthFormatted = '1.8 MB/s',
    this.onTap,
  });

  final NetworkStatus status;
  final int connectedPeers;
  final int latencyMs;
  final String bandwidthFormatted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: AppSpacing.pLg,
      borderColor: status.color.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              PulseAnimation(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: status.color,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: status.color.withValues(alpha: 0.6),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.gapW12,
              Text(
                status.label,
                style: AppTypography.titleMedium.copyWith(
                  color: status.color,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.rSm,
                  border: Border.all(color: AppColors.glassBorderSubtle),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(AppIcons.peers, size: 14, color: AppColors.secondary),
                    AppSpacing.gapW4,
                    Text(
                      '$connectedPeers peers',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.gapH12,
          Text(
            status.description,
            style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          AppSpacing.gapH12,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: AppColors.background.withValues(alpha: 0.6),
              borderRadius: AppRadius.rMd,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(AppIcons.latency, size: 14, color: AppColors.hint),
                    AppSpacing.gapW4,
                    Text(
                      '${latencyMs}ms Latency',
                      style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(AppIcons.bandwidth, size: 14, color: AppColors.hint),
                    AppSpacing.gapW4,
                    Text(
                      bandwidthFormatted,
                      style: AppTypography.caption.copyWith(color: AppColors.secondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
