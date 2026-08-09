import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/glass_button.dart';
import '../../../../core/widgets/cards/glass_card.dart';

/// Hero Banner for the Home Dashboard with Space Grotesk headline, search trigger, and peer metrics.
class HomeHeroCard extends StatelessWidget {
  const HomeHeroCard({
    super.key,
    this.seederCount = '0',
    this.indexedCount = '0',
    this.onExploreTap,
  });

  final String seederCount;
  final String indexedCount;
  final VoidCallback? onExploreTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderColor: AppColors.primary.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: AppRadius.rFull,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      AppIcons.sparkles,
                      color: AppColors.background,
                      size: 14,
                    ),
                    AppSpacing.gapW4,
                    Text(
                      'P2P Knowledge Mesh v0.3',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.background,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.gapH16,
          Text(
            'Knowledge Beyond Borders',
            style: AppTypography.displayMedium.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          AppSpacing.gapH8,
          Text(
            'Discover verified research papers, academic datasets, and curriculum notes distributed across a zero-trust student network.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),
          AppSpacing.gapH20,
          Row(
            children: <Widget>[
              _StatPill(
                label: 'Active Seeders',
                value: seederCount,
                icon: AppIcons.peers,
              ),
              AppSpacing.gapW12,
              _StatPill(
                label: 'Indexed Items',
                value: indexedCount,
                icon: AppIcons.document,
              ),
            ],
          ),

          if (onExploreTap != null) ...<Widget>[
            AppSpacing.gapH20,
            GlassButton(
              label: 'Search Decentralized Network',
              icon: AppIcons.search,
              onPressed: onExploreTap!,
            ),
          ],
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.rMd,
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 14, color: AppColors.secondary),
          AppSpacing.gapW8,
          Text(
            value,
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          AppSpacing.gapW4,
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.hint,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
