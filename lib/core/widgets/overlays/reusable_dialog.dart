import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

/// Reusable Glassmorphic Modal Dialog for confirmations and academic actions.
class ReusableDialog extends StatelessWidget {
  const ReusableDialog({
    required this.title,
    required this.description,
    super.key,
    this.icon,
    this.primaryActionLabel,
    this.onPrimaryAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.customContent,
  });

  final String title;
  final String description;
  final IconData? icon;
  final String? primaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;
  final Widget? customContent;

  /// Helper to display the dialog with smooth animation and backdrop filter.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String description,
    IconData? icon,
    String? primaryActionLabel,
    VoidCallback? onPrimaryAction,
    String? secondaryActionLabel,
    VoidCallback? onSecondaryAction,
    Widget? customContent,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.overlay,
      builder: (BuildContext ctx) => ReusableDialog(
        title: title,
        description: description,
        icon: icon,
        primaryActionLabel: primaryActionLabel,
        onPrimaryAction: onPrimaryAction,
        secondaryActionLabel: secondaryActionLabel,
        onSecondaryAction: onSecondaryAction,
        customContent: customContent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: AppSpacing.modalPadding,
      child: ClipRRect(
        borderRadius: AppRadius.rXxl,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: AppSpacing.cardPadding,
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.88),
              borderRadius: AppRadius.rXxl,
              border: Border.all(color: AppColors.glassBorder, width: 1.2),
              boxShadow: AppShadows.floating,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (icon != null) ...<Widget>[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.glassBorderSubtle),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.secondary,
                      size: 24,
                    ),
                  ),
                  AppSpacing.gapH16,
                ],
                Text(
                  title,
                  style: AppTypography.headlineSmall.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AppSpacing.gapH8,
                Text(
                  description,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (customContent != null) ...<Widget>[
                  AppSpacing.gapH16,
                  customContent!,
                ],
                AppSpacing.gapH24,
                Row(
                  children: <Widget>[
                    if (secondaryActionLabel != null) ...<Widget>[
                      Expanded(
                        child: SecondaryButton(
                          label: secondaryActionLabel!,
                          onPressed: onSecondaryAction ?? () => Navigator.of(context).pop(),
                        ),
                      ),
                      AppSpacing.gapW12,
                    ],
                    if (primaryActionLabel != null)
                      Expanded(
                        child: PrimaryButton(
                          label: primaryActionLabel!,
                          onPressed: onPrimaryAction ?? () => Navigator.of(context).pop(),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
