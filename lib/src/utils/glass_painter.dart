import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// Base class for creating custom glass-effect painters.
///
/// Extend this class and override [paintGlass] to draw arbitrary
/// glass shapes on a [Canvas]. Use the helper methods to apply
/// blur, tint, and border effects to any [Path].
abstract class GlassPainter extends CustomPainter {
  /// Override this method to draw your custom glass shape.
  void paintGlass(Canvas canvas, Size size, GlassThemeData theme);

  /// The theme data used for rendering. If null, uses defaults.
  final GlassThemeData? themeData;

  /// Creates a [GlassPainter] with an optional [themeData].
  GlassPainter({this.themeData});

  @override
  void paint(Canvas canvas, Size size) {
    final theme = themeData ?? const GlassThemeData();
    paintGlass(canvas, size, theme);
  }

  @override
  bool shouldRepaint(covariant GlassPainter oldDelegate) {
    return oldDelegate.themeData != themeData;
  }

  /// Draws a glass effect along the given [path].
  ///
  /// Fills the path with the tint color, draws a border, and optionally
  /// adds a highlight edge along the top.
  void drawGlassPath(
    Canvas canvas,
    Size size,
    Path path,
    GlassThemeData theme, {
    bool drawHighlight = true,
  }) {
    // Fill with tint
    final fillPaint = Paint()
      ..color = theme.tintColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Inner highlight (top edge glow)
    if (drawHighlight) {
      final highlightPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.white.withOpacity(0.0),
          ],
          stops: const [0.0, 0.4],
        ).createShader(Offset.zero & size)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.clipPath(path);
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height * 0.4),
        highlightPaint,
      );
      canvas.restore();
    }

    // Border
    final borderPaint = Paint()
      ..color = theme.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = theme.borderWidth;
    canvas.drawPath(path, borderPaint);
  }

  /// Creates a rounded rectangle path with the given [borderRadius].
  Path createRoundedRectPath(Size size, BorderRadius borderRadius) {
    return Path()
      ..addRRect(
        borderRadius.toRRect(Offset.zero & size),
      );
  }

  /// Creates a circular path centered in the given [size].
  Path createCirclePath(Size size, {double? radius}) {
    final r = radius ?? math.min(size.width, size.height) / 2;
    return Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: r * 2,
          height: r * 2,
        ),
      );
  }

  /// Creates a hexagonal path centered in the given [size].
  Path createHexagonPath(Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(cx, cy);
    final path = Path();

    for (var i = 0; i < 6; i++) {
      final angle = (math.pi / 3) * i - math.pi / 2;
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  /// Draws a noise texture overlay within the given [path] for extra realism.
  void drawNoiseOverlay(
    Canvas canvas,
    Size size,
    Path path, {
    double opacity = 0.03,
    int density = 1000,
  }) {
    canvas.save();
    canvas.clipPath(path);

    final random = math.Random(42);
    final paint = Paint()..color = Colors.white.withOpacity(opacity);

    for (var i = 0; i < density; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 0.5, paint);
    }

    canvas.restore();
  }
}
