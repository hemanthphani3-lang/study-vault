import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Button sizing tokens.
enum ButtonSize {
  small(height: 36.0, horizontalPadding: AppSpacing.md, iconSize: 14.0, fontSize: 12.0),
  medium(height: 48.0, horizontalPadding: AppSpacing.xl, iconSize: 18.0, fontSize: 14.0),
  large(height: 56.0, horizontalPadding: AppSpacing.xxl, iconSize: 22.0, fontSize: 16.0);

  const ButtonSize({
    required this.height,
    required this.horizontalPadding,
    required this.iconSize,
    required this.fontSize,
  });

  final double height;
  final double horizontalPadding;
  final double iconSize;
  final double fontSize;
}

/// Flagship Primary Action Button with gradient support, loading state, and glow.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;

    final Widget buttonContent = AnimatedContainer(
      duration: AppDurations.fast,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: size.horizontalPadding),
      decoration: BoxDecoration(
        gradient: isEnabled ? AppGradients.primary : null,
        color: isEnabled ? null : AppColors.card,
        borderRadius: AppRadius.rLg,
        boxShadow: isEnabled ? AppShadows.primaryGlow : null,
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
                width: size.iconSize + 2,
                height: size.iconSize + 2,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.background),
                ),
              )
            : Row(
                mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (icon != null) ...<Widget>[
                    Icon(
                      icon,
                      size: size.iconSize,
                      color: isEnabled ? AppColors.background : AppColors.hint,
                    ),
                    AppSpacing.gapW8,
                  ],
                  Text(
                    label,
                    style: AppTypography.labelLarge.copyWith(
                      fontSize: size.fontSize,
                      color: isEnabled ? AppColors.background : AppColors.hint,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: AppRadius.rLg,
        child: isFullWidth
            ? SizedBox(width: double.infinity, child: buttonContent)
            : buttonContent,
      ),
    );
  }
}
