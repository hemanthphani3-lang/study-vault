import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_durations.dart';
import '../theme/app_radius.dart';

/// Smooth cosmic skeleton shimmer effect for loading placeholders.
class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    required this.width,
    required this.height,
    super.key,
    this.borderRadius = AppRadius.rMd,
  });

  final double width;
  final double height;
  final BorderRadius borderRadius;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.pulseCycle,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: <double>[
                (_controller.value - 0.3).clamp(0.0, 1.0),
                _controller.value,
                (_controller.value + 0.3).clamp(0.0, 1.0),
              ],
              colors: const <Color>[
                AppColors.surface,
                AppColors.card,
                AppColors.surface,
              ],
            ),
          ),
        );
      },
    );
  }
}
