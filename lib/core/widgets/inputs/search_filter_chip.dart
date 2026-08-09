import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Reusable Filter Chip with glowing border, icon support, and count badge.
class SearchFilterChip extends StatelessWidget {
  const SearchFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
    this.icon,
    this.count,
    this.selectedColor = AppColors.primary,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;
  final int? count;
  final Color selectedColor;

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
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? selectedColor.withValues(alpha: 0.18)
                : AppColors.surface,
            borderRadius: AppRadius.rMd,
            border: Border.all(
              color: isSelected ? selectedColor : AppColors.glassBorderSubtle,
              width: isSelected ? 1.2 : 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(
                  icon,
                  size: 14,
                  color: isSelected ? selectedColor : AppColors.hint,
                ),
                AppSpacing.gapW4,
              ],
              Text(
                label,
                style: AppTypography.labelSmall.copyWith(
                  color: isSelected ? selectedColor : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              if (count != null) ...<Widget>[
                AppSpacing.gapW8,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: 1.0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? selectedColor.withValues(alpha: 0.3)
                        : AppColors.card,
                    borderRadius: AppRadius.rSm,
                  ),
                  child: Text(
                    '$count',
                    style: AppTypography.caption.copyWith(
                      color: isSelected ? selectedColor : AppColors.hint,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
