import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../badges/app_badge.dart';
import '../buttons/app_icon_button.dart';

/// Reusable Top App Bar for StudyVault with logo, node status, and action triggers.
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.badgeVariant,
    this.actions,
    this.onSearchTap,
    this.showBackButton = false,
    this.onBackTap,
  });

  final String? title;
  final String? subtitle;
  final BadgeVariant? badgeVariant;
  final List<Widget>? actions;
  final VoidCallback? onSearchTap;
  final bool showBackButton;
  final VoidCallback? onBackTap;

  @override
  Size get preferredSize => const Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: <Widget>[
          if (showBackButton) ...<Widget>[
            AppIconButton(
              icon: Icons.arrow_back_rounded,
              size: 36,
              iconSize: 18,
              onPressed: onBackTap ?? () => Navigator.of(context).maybePop(),
            ),
            AppSpacing.gapW12,
          ] else ...<Widget>[
            Container(
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: AppRadius.rSm,
              ),
              child: const Icon(
                AppIcons.library,
                size: 20,
                color: AppColors.background,
              ),
            ),
            AppSpacing.gapW12,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title ?? 'StudyVault',
                      style: AppTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (badgeVariant != null) ...<Widget>[
                      AppSpacing.gapW8,
                      AppBadge(variant: badgeVariant!, compact: true),
                    ],
                  ],
                ),
                if (subtitle != null) ...<Widget>[
                  AppSpacing.gapH2,
                  Text(
                    subtitle!,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        if (onSearchTap != null)
          AppIconButton(
            icon: AppIcons.search,
            size: 38,
            iconSize: 18,
            onPressed: onSearchTap,
          ),
        if (actions != null) ...actions!,
        AppSpacing.gapW12,
      ],
    );
  }
}
