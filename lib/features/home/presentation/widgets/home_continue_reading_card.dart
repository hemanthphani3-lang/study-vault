import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/feedback/progress_indicator.dart';

/// Interactive card showcasing the user's active reading progress in the Vault.
class HomeContinueReadingCard extends StatelessWidget {
  const HomeContinueReadingCard({
    required this.title,
    required this.authors,
    required this.progress,
    required this.currentPage,
    required this.totalPages,
    required this.onContinue,
    super.key,
  });

  final String title;
  final List<String> authors;
  final double progress; // 0.0 to 1.0
  final int currentPage;
  final int totalPages;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final int percent = (progress * 100).toInt();

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 48,
                height: 64,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: AppRadius.rSm,
                ),
                child: const Center(
                  child: Icon(
                    AppIcons.book,
                    color: AppColors.background,
                    size: 24,
                  ),
                ),
              ),
              AppSpacing.gapW16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.gapH4,
                    Text(
                      authors.join(', '),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.gapH8,
                    Text(
                      'Page $currentPage of $totalPages • $percent% completed',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.gapH16,
          AppProgressBar(
            progress: progress,
            height: 6,
          ),
          AppSpacing.gapH16,
          Row(
            children: <Widget>[
              Expanded(
                child: PrimaryButton(
                  label: 'Continue Reading',
                  icon: AppIcons.document,
                  size: ButtonSize.small,
                  onPressed: onContinue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
