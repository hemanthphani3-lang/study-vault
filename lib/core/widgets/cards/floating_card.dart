import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';

/// Floating Card with tactile hover/press elevation and soft celestial glow.
class FloatingCard extends StatefulWidget {
  const FloatingCard({
    required this.child,
    super.key,
    this.padding = AppSpacing.cardPadding,
    this.borderRadius = AppRadius.rXl,
    this.backgroundColor = AppColors.card,
    this.borderColor = AppColors.glassBorderSubtle,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onTap;

  @override
  State<FloatingCard> createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.fast,
      transform: Matrix4.translationValues(0, _isPressed ? -2 : 0, 0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        border: Border.all(
          color: _isPressed ? AppColors.primary : widget.borderColor,
          width: _isPressed ? 1.2 : 1.0,
        ),
        boxShadow: _isPressed ? AppShadows.floating : AppShadows.card,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          onHighlightChanged: (bool value) {
            setState(() {
              _isPressed = value;
            });
          },
          borderRadius: widget.borderRadius,
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
