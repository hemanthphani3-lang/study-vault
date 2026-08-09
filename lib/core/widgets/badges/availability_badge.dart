import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Availability badge indicating P2P seeder availability and download readiness.
class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({
    required this.seederCount,
    super.key,
    this.isLocalCached = false,
  });

  final int seederCount;
  final bool isLocalCached;

  @override
  Widget build(BuildContext context) {
    final Color badgeColor = isLocalCached
        ? AppColors.success
        : seederCount > 0
            ? AppColors.secondary
            : AppColors.hint;

    final String label = isLocalCached
        ? 'Stored in Vault'
        : seederCount > 0
            ? '$seederCount Seeders Available'
            : 'Archived / Re-seeding';

    final IconData icon = isLocalCached
        ? AppIcons.check
        : seederCount > 0
            ? AppIcons.peers
            : AppIcons.info;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.rSm,
        border: Border.all(color: badgeColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 12, color: badgeColor),
          AppSpacing.gapW4,
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: badgeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
