import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_spacing.dart';

/// Reusable Divider supporting hairline separators and celestial glowing gradients.
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.isGlowing = false,
    this.thickness = 1.0,
    this.margin = const EdgeInsets.symmetric(vertical: AppSpacing.md),
  });

  final bool isGlowing;
  final double thickness;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    if (isGlowing) {
      return Padding(
        padding: margin,
        child: Container(
          height: thickness,
          decoration: const BoxDecoration(
            gradient: AppGradients.glassBorder,
          ),
        ),
      );
    }

    return Padding(
      padding: margin,
      child: Divider(
        color: AppColors.divider,
        thickness: thickness,
        height: thickness,
      ),
    );
  }
}
