import 'package:flutter/material.dart';
import '../theme/app_durations.dart';

/// Reusable entrance animation widget for smooth scale and fade in.
class ScaleEntranceTransition extends StatefulWidget {
  const ScaleEntranceTransition({
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.duration = AppDurations.medium,
    this.initialScale = 0.88,
    this.curve = AppDurations.bounceEasing,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double initialScale;
  final Curve curve;

  @override
  State<ScaleEntranceTransition> createState() => _ScaleEntranceTransitionState();
}

class _ScaleEntranceTransitionState extends State<ScaleEntranceTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final CurvedAnimation curved = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _scaleAnimation = Tween<double>(
      begin: widget.initialScale,
      end: 1.0,
    ).animate(curved);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future<void>.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
