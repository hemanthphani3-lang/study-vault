import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_radius.dart';

/// Cosmic Linear Gradient Progress Bar for downloads, sync, and storage quota.
class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    required this.progress, // 0.0 to 1.0
    super.key,
    this.height = 6.0,
    this.gradient = AppGradients.primary,
    this.backgroundColor = AppColors.surface,
    this.borderRadius = AppRadius.rFull,
  });

  final double progress;
  final double height;
  final Gradient gradient;
  final Color backgroundColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final double clamped = progress.clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: AppDurations.fast,
                width: constraints.maxWidth * clamped,
                height: height,
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: borderRadius,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
