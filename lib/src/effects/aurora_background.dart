import 'dart:math' as math;

import 'package:flutter/material.dart';

/// An animated aurora gradient mesh background.
///
/// Creates a beautiful shifting gradient using multiple color stops
/// that animate smoothly over time. Perfect as a backdrop for glass widgets.
class AuroraBackground extends StatefulWidget {
  /// The colors used in the aurora gradient.
  final List<Color> colors;

  /// The animation speed multiplier. 1.0 is the default speed.
  final double speed;

  /// The number of gradient blobs to render.
  final int blobCount;

  /// An optional child widget placed on top of the aurora.
  final Widget? child;

  /// Creates an [AuroraBackground].
  const AuroraBackground({
    super.key,
    this.colors = const [
      Color(0xFF6448FE),
      Color(0xFF5FC6FF),
      Color(0xFFFEC85B),
      Color(0xFFFF7EB3),
    ],
    this.speed = 1.0,
    this.blobCount = 4,
    this.child,
  });

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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
      builder: (context, child) {
        return CustomPaint(
          painter: _AuroraPainter(
            colors: widget.colors,
            progress: _controller.value,
            speed: widget.speed,
            blobCount: widget.blobCount,
          ),
          child: child,
        );
      },
      child: widget.child != null
          ? SizedBox.expand(child: widget.child)
          : const SizedBox.expand(),
    );
  }
}

class _AuroraPainter extends CustomPainter {
  final List<Color> colors;
  final double progress;
  final double speed;
  final int blobCount;

  _AuroraPainter({
    required this.colors,
    required this.progress,
    required this.speed,
    required this.blobCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.clipRect(rect);

    // Dark base layer
    canvas.drawRect(
      rect,
      Paint()..color = const Color(0xFF0A0A1A),
    );

    final adjustedProgress = progress * speed;

    for (var i = 0; i < blobCount && i < colors.length; i++) {
      final phase = adjustedProgress * 2 * math.pi + (i * math.pi / 2);

      final cx = size.width * (0.3 + 0.4 * math.sin(phase + i));
      final cy = size.height * (0.3 + 0.4 * math.cos(phase * 0.7 + i));
      final radius = size.width * (0.4 + 0.1 * math.sin(phase * 1.3));

      final gradient = RadialGradient(
        center: Alignment(
          (cx / size.width) * 2 - 1,
          (cy / size.height) * 2 - 1,
        ),
        radius: radius / size.width,
        colors: [
          colors[i].withOpacity(0.6),
          colors[i].withOpacity(0.0),
        ],
      );

      final paint = Paint()
        ..shader = gradient.createShader(rect)
        ..blendMode = BlendMode.screen;

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(_AuroraPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.speed != speed ||
        oldDelegate.blobCount != blobCount;
  }
}
