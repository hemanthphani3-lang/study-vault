import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';

/// Reusable icon button supporting circular or rounded shapes, badge counts, and glow.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.tooltip,
    this.badgeCount,
    this.size = 44.0,
    this.iconSize = 20.0,
    this.isCircle = true,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final int? badgeCount;
  final double size;
  final double iconSize;
  final bool isCircle;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;

    final Widget button = AnimatedContainer(
      duration: AppDurations.fast,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : AppRadius.rMd,
        border: Border.all(color: AppColors.glassBorderSubtle, width: 1.0),
        boxShadow: AppShadows.subtle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: isEnabled ? (iconColor ?? AppColors.textPrimary) : AppColors.hint,
        ),
      ),
    );

    final Widget content = Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            customBorder: isCircle ? const CircleBorder() : AppRadius.shapeMd,
            child: button,
          ),
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: AppSpacing.xxs,
              ),
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
                boxShadow: AppShadows.subtle,
              ),
              child: Text(
                badgeCount! > 99 ? '99+' : '$badgeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
      ],
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: content);
    }
    return content;
  }
}
