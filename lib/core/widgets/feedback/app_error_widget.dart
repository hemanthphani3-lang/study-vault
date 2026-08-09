import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../buttons/secondary_button.dart';
import '../cards/glass_card.dart';

/// Reusable Error component with error codes, clear messaging, and retry action.
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.message,
    super.key,
    this.title = 'Mesh Sync Exception',
    this.errorCode,
    this.onRetry,
    this.retryLabel = 'Retry Connection',
  });

  final String message;
  final String title;
  final String? errorCode;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: GlassCard(
          borderColor: AppColors.error.withValues(alpha: 0.4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  AppIcons.error,
                  color: AppColors.error,
                  size: 32,
                ),
              ),
              AppSpacing.gapH16,
              Text(
                title,
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.gapH8,
              Text(
                message,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              if (errorCode != null) ...<Widget>[
                AppSpacing.gapH12,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppRadius.rSm,
                  ),
                  child: Text(
                    'Code: $errorCode',
                    style: AppTypography.codeSnippet.copyWith(
                      color: AppColors.hint,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
              if (onRetry != null) ...<Widget>[
                AppSpacing.gapH24,
                SecondaryButton(
                  label: retryLabel,
                  icon: AppIcons.refresh,
                  onPressed: onRetry,
                  borderColor: AppColors.error.withValues(alpha: 0.5),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
