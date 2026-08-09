import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Variant enumeration for the unified badge system.
enum BadgeVariant {
  verified(
    label: 'Verified Source',
    icon: AppIcons.verified,
    color: AppColors.success,
  ),
  warning(
    label: 'Consensus Warning',
    icon: AppIcons.warning,
    color: AppColors.warning,
  ),
  offline(
    label: 'Offline Vault',
    icon: AppIcons.nodeOffline,
    color: AppColors.hint,
  ),
  online(
    label: 'Mesh Synced',
    icon: AppIcons.nodeOnline,
    color: AppColors.success,
  ),
  downloaded(
    label: 'In Local Vault',
    icon: AppIcons.check,
    color: AppColors.secondary,
  ),
  trending(
    label: 'Trending Topic',
    icon: Icons.trending_up_rounded,
    color: Color(0xFFFFB347),
  ),
  featured(
    label: 'Institutional',
    icon: AppIcons.shield,
    color: AppColors.primary,
  ),
  premium(
    label: 'Peer-Reviewed',
    icon: AppIcons.peerReviewed,
    color: AppColors.primary,
  ),
  custom(
    label: '',
    icon: Icons.info_outline_rounded,
    color: AppColors.secondary,
  );

  const BadgeVariant({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;
}

/// Unified Badge component supporting all semantic states, tags, and peer status.
class AppBadge extends StatelessWidget {
  const AppBadge({
    required this.variant,
    super.key,
    this.customLabel,
    this.customIcon,
    this.customColor,
    this.compact = false,
    this.isGlowing = false,
  });

  final BadgeVariant variant;
  final String? customLabel;
  final IconData? customIcon;
  final Color? customColor;
  final bool compact;
  final bool isGlowing;

  @override
  Widget build(BuildContext context) {
    final Color badgeColor = customColor ?? variant.color;
    final IconData badgeIcon = customIcon ?? variant.icon;
    final String label = customLabel ?? variant.label;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? AppSpacing.sm : AppSpacing.md,
        vertical: compact ? AppSpacing.xxs : AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.12),
        borderRadius: AppRadius.rSm,
        border: Border.all(
          color: badgeColor.withValues(alpha: isGlowing ? 0.6 : 0.35),
          width: 1.0,
        ),
        boxShadow: isGlowing
            ? <BoxShadow>[
                BoxShadow(
                  color: badgeColor.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            badgeIcon,
            size: compact ? 11 : 13,
            color: badgeColor,
          ),
          if (!compact && label.isNotEmpty) ...<Widget>[
            AppSpacing.gapW4,
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: badgeColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                fontSize: 10.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
