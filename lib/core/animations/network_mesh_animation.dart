import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Interactive procedural canvas animation visualizing the P2P knowledge mesh.
class NetworkMeshAnimation extends StatefulWidget {
  const NetworkMeshAnimation({
    super.key,
    this.nodeCount = 18,
    this.primaryColor = AppColors.primary,
    this.secondaryColor = AppColors.secondary,
  });

  final int nodeCount;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  State<NetworkMeshAnimation> createState() => _NetworkMeshAnimationState();
}

class _NetworkMeshAnimationState extends State<NetworkMeshAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final math.Random _random = math.Random(42);
  late final List<_MeshNode> _nodes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    _nodes = List<_MeshNode>.generate(widget.nodeCount, (int index) {
      return _MeshNode(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: 2.0 + _random.nextDouble() * 3.5,
        speedX: (_random.nextDouble() - 0.5) * 0.08,
        speedY: (_random.nextDouble() - 0.5) * 0.08,
        isPrimary: index % 2 == 0,
      );
    });
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
        return CustomPaint(
          painter: _MeshPainter(
            nodes: _nodes,
            progress: _controller.value,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _MeshNode {
  _MeshNode({
    required this.x,
    required this.y,
    required this.radius,
    required this.speedX,
    required this.speedY,
    required this.isPrimary,
  });

  double x;
  double y;
  final double radius;
  final double speedX;
  final double speedY;
  final bool isPrimary;
}

class _MeshPainter extends CustomPainter {
  _MeshPainter({
    required this.nodes,
    required this.progress,
    required this.primaryColor,
    required this.secondaryColor,
  });

  final List<_MeshNode> nodes;
  final double progress;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    final Paint nodePaint = Paint()..style = PaintingStyle.fill;

    // Draw connection edges
    for (int i = 0; i < nodes.length; i++) {
      final double x1 = ((nodes[i].x + nodes[i].speedX * progress) % 1.0) * size.width;
      final double y1 = ((nodes[i].y + nodes[i].speedY * progress) % 1.0) * size.height;

      for (int j = i + 1; j < nodes.length; j++) {
        final double x2 = ((nodes[j].x + nodes[j].speedX * progress) % 1.0) * size.width;
        final double y2 = ((nodes[j].y + nodes[j].speedY * progress) % 1.0) * size.height;

        final double distance = math.sqrt(math.pow(x2 - x1, 2) + math.pow(y2 - y1, 2));
        if (distance < 120) {
          final double opacity = (1.0 - (distance / 120)).clamp(0.0, 0.25);
          linePaint.color = primaryColor.withValues(alpha: opacity);
          canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
        }
      }

      // Draw node point
      nodePaint.color = nodes[i].isPrimary
          ? primaryColor.withValues(alpha: 0.7)
          : secondaryColor.withValues(alpha: 0.7);
      canvas.drawCircle(Offset(x1, y1), nodes[i].radius, nodePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _MeshPainter oldDelegate) => true;
}
