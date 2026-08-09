import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import 'primary_button.dart';

/// Glassmorphic button with backdrop blur filter, gradient border, and soft glowing aura.
class GlassButton extends StatelessWidget {
  const GlassButton({
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

    final Widget buttonContent = ClipRRect(
      borderRadius: AppRadius.rLg,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: AnimatedContainer(
          duration: AppDurations.fast,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: size.horizontalPadding),
          decoration: BoxDecoration(
            color: isEnabled
                ? AppColors.glassFill
                : AppColors.surface.withValues(alpha: 0.3),
            borderRadius: AppRadius.rLg,
            border: Border.all(
              color: isEnabled ? AppColors.glassBorder : AppColors.divider,
              width: 1.2,
            ),
            boxShadow: isEnabled ? AppShadows.subtle : null,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: size.iconSize,
                    height: size.iconSize,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
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
                          color: isEnabled ? AppColors.secondary : AppColors.hint,
                        ),
                        AppSpacing.gapW8,
                      ],
                      Text(
                        label,
                        style: AppTypography.labelLarge.copyWith(
                          fontSize: size.fontSize,
                          color: isEnabled ? AppColors.textPrimary : AppColors.hint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
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
