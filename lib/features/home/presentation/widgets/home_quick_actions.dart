import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Quick Action Buttons for fast mesh discovery and vault management.
class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({
    required this.onScanMesh,
    required this.onAddToVault,
    required this.onCheckHealth,
    required this.onViewTopology,
    super.key,
  });

  final VoidCallback onScanMesh;
  final VoidCallback onAddToVault;
  final VoidCallback onCheckHealth;
  final VoidCallback onViewTopology;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _QuickActionButton(
            label: 'Scan Mesh',
            icon: AppIcons.search,
            color: AppColors.primary,
            onTap: onScanMesh,
          ),
        ),
        AppSpacing.gapW8,
        Expanded(
          child: _QuickActionButton(
            label: 'Add to Vault',
            icon: AppIcons.upload,
            color: AppColors.secondary,
            onTap: onAddToVault,
          ),
        ),
        AppSpacing.gapW8,
        Expanded(
          child: _QuickActionButton(
            label: 'Node Health',
            icon: AppIcons.shield,
            color: AppColors.success,
            onTap: onCheckHealth,
          ),
        ),
        AppSpacing.gapW8,
        Expanded(
          child: _QuickActionButton(
            label: 'Topology',
            icon: AppIcons.network,
            color: AppColors.warning,
            onTap: onViewTopology,
          ),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.rMd,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppRadius.rMd,
            border: Border.all(
              color: AppColors.glassBorderSubtle,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 18,
                ),
              ),
              AppSpacing.gapH8,
              Text(
                label,
                style: AppTypography.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
