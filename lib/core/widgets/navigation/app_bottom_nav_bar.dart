import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Flagship Glassmorphic Bottom Navigation Bar with elevated Center Search action.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.lg,
      ),
      child: ClipRRect(
        borderRadius: AppRadius.rXxl,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 72,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.85),
              borderRadius: AppRadius.rXxl,
              border: Border.all(color: AppColors.glassBorder, width: 1.2),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // 0: Home
                _NavItem(
                  icon: AppIcons.home,
                  label: 'Home',
                  isSelected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),

                // 1: Library
                _NavItem(
                  icon: AppIcons.library,
                  label: 'Library',
                  isSelected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),

                // 2: Center Search Action (Elevated & Glowing)
                _CenterSearchAction(
                  isSelected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),

                // 3: Network
                _NavItem(
                  icon: AppIcons.network,
                  label: 'Network',
                  isSelected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),

                // 4: Settings
                _NavItem(
                  icon: AppIcons.settings,
                  label: 'Settings',
                  isSelected: currentIndex == 4,
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color itemColor = isSelected ? AppColors.secondary : AppColors.hint;

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.rMd,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 22,
              color: itemColor,
            ),
            AppSpacing.gapH4,
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: itemColor,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontSize: 10.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterSearchAction extends StatelessWidget {
  const _CenterSearchAction({
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
          boxShadow: isSelected ? AppShadows.primaryGlow : AppShadows.subtle,
          border: Border.all(
            color: isSelected ? AppColors.textPrimary : AppColors.glassBorder,
            width: 2.0,
          ),
        ),
        child: const Center(
          child: Icon(
            AppIcons.search,
            color: AppColors.background,
            size: 24,
          ),
        ),
      ),
    );
  }
}
