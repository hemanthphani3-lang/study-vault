import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';

/// Premium Glassmorphic Card Container with blur, gradient stroke, and elevation.
class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    super.key,
    this.padding = AppSpacing.cardPadding,
    this.borderRadius = AppRadius.rXl,
    this.backgroundColor = AppColors.glassFill,
    this.borderColor = AppColors.glassBorder,
    this.blurSigma = 16.0,
    this.onTap,
    this.boxShadow = AppShadows.card,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double blurSigma;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final Widget cardBody = ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(color: borderColor, width: 1.0),
            boxShadow: boxShadow,
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) {
      return cardBody;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: cardBody,
      ),
    );
  }
}
