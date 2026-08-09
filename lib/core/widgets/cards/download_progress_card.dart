import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../buttons/app_icon_button.dart';
import '../feedback/progress_indicator.dart';
import 'glass_card.dart';

/// Download Progress Card tracking active P2P chunk sync and swarm bandwidth.
class DownloadProgressCard extends StatelessWidget {
  const DownloadProgressCard({
    required this.title,
    required this.progress, // 0.0 to 1.0
    required this.downloadedBytesFormatted,
    required this.totalBytesFormatted,
    required this.speedFormatted,
    required this.etaFormatted,
    required this.peerSeeders,
    super.key,
    this.isPaused = false,
    this.onPauseResume,
    this.onCancel,
  });

  final String title;
  final double progress;
  final String downloadedBytesFormatted;
  final String totalBytesFormatted;
  final String speedFormatted;
  final String etaFormatted;
  final int peerSeeders;
  final bool isPaused;
  final VoidCallback? onPauseResume;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final int percent = (progress * 100).clamp(0, 100).toInt();

    return GlassCard(
      padding: AppSpacing.pLg,
      borderColor: isPaused ? AppColors.warning : AppColors.secondary.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: isPaused
                      ? AppColors.warning.withValues(alpha: 0.15)
                      : AppColors.secondary.withValues(alpha: 0.15),
                  borderRadius: AppRadius.rMd,
                  border: Border.all(
                    color: isPaused ? AppColors.warning : AppColors.secondary,
                  ),
                ),
                child: Icon(
                  isPaused ? Icons.pause_rounded : AppIcons.download,
                  color: isPaused ? AppColors.warning : AppColors.secondary,
                  size: 20,
                ),
              ),
              AppSpacing.gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.gapH4,
                    Text(
                      '$downloadedBytesFormatted / $totalBytesFormatted • $peerSeeders seeders',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (onPauseResume != null)
                AppIconButton(
                  icon: isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                  iconColor: isPaused ? AppColors.success : AppColors.hint,
                  size: 32,
                  iconSize: 18,
                  onPressed: onPauseResume,
                ),
              if (onCancel != null) ...<Widget>[
                AppSpacing.gapW8,
                AppIconButton(
                  icon: AppIcons.clear,
                  iconColor: AppColors.error,
                  size: 32,
                  iconSize: 16,
                  onPressed: onCancel,
                ),
              ],
            ],
          ),
          AppSpacing.gapH16,

          // Linear Gradient Progress Bar
          AppProgressBar(progress: progress),
          AppSpacing.gapH8,

          // Bottom Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                isPaused ? 'Sync Paused' : '$speedFormatted • $etaFormatted',
                style: AppTypography.caption.copyWith(
                  color: isPaused ? AppColors.warning : AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$percent%',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
