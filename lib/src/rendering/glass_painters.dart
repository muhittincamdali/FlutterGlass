import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import '../style/glass_style.dart';

/// The outline of a glass surface of [rect] with [radius] and [corners].
Path glassShapePath(Rect rect, BorderRadius radius, GlassCorners corners) {
  final path = Path();
  switch (corners) {
    case GlassCorners.circular:
      path.addRRect(radius.toRRect(rect));
    case GlassCorners.continuous:
      path.addRSuperellipse(radius.toRSuperellipse(rect));
  }
  return path;
}

/// A clip that keeps everything around [shape] and nothing inside it, so a
/// shadow drawn through it never shows through translucent glass.
///
/// [reach] is how far beyond [bounds] the shadow may extend.
Path glassShadowClip(Rect bounds, Path shape, {double reach = 300}) {
  return Path()
    ..fillType = PathFillType.evenOdd
    ..addRect(bounds.inflate(reach))
    ..addPath(shape, Offset.zero);
}

/// A color matrix that scales saturation by [factor] around the Rec. 709
/// luminance, so brightness stays the same: 0 is grayscale, 1 is identity.
List<double> glassSaturationMatrix(double factor) {
  const r = 0.2126;
  const g = 0.7152;
  const b = 0.0722;
  final inverse = 1 - factor;
  return [
    r * inverse + factor, g * inverse, b * inverse, 0, 0, //
    r * inverse, g * inverse + factor, b * inverse, 0, 0, //
    r * inverse, g * inverse, b * inverse + factor, 0, 0, //
    0, 0, 0, 1, 0, //
  ];
}

/// Paints the shadows of a glass surface outside its shape.
class GlassShadowPainter extends CustomPainter {
  /// Creates a shadow painter.
  const GlassShadowPainter({required this.shadows, required this.radius, required this.corners});

  /// The shadows, already sanitized.
  final List<BoxShadow> shadows;

  /// The resolved corner radii.
  final BorderRadius radius;

  /// The corner style.
  final GlassCorners corners;

  @override
  void paint(Canvas canvas, Size size) {
    if (shadows.isEmpty || size.isEmpty) {
      return;
    }
    final bounds = Offset.zero & size;
    final shape = glassShapePath(bounds, radius, corners);
    canvas
      ..save()
      ..clipPath(glassShadowClip(bounds, shape));
    for (final shadow in shadows.take(GlassStyle.maxShadows)) {
      final rect = bounds.shift(shadow.offset).inflate(shadow.spreadRadius);
      if (rect.isEmpty) {
        continue;
      }
      canvas.drawPath(glassShapePath(rect, radius, corners), shadow.toPaint());
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(GlassShadowPainter oldDelegate) {
    return !listEquals(oldDelegate.shadows, shadows) || oldDelegate.radius != radius || oldDelegate.corners != corners;
  }
}

/// Paints the tint and the rim light of a glass surface.
class GlassFillPainter extends CustomPainter {
  /// Creates a fill painter.
  const GlassFillPainter({
    required this.fill,
    required this.rimColor,
    required this.borderWidth,
    required this.borderOpacity,
    required this.radius,
    required this.corners,
    required this.textDirection,
  });

  /// The color laid over the backdrop.
  final Color fill;

  /// The rim light color.
  final Color rimColor;

  /// The rim width.
  final double borderWidth;

  /// The rim opacity at the top-leading corner.
  final double borderOpacity;

  /// The resolved corner radii.
  final BorderRadius radius;

  /// The corner style.
  final GlassCorners corners;

  /// Decides which top corner is the leading one.
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    final bounds = Offset.zero & size;
    if (fill.a > 0) {
      canvas.drawPath(glassShapePath(bounds, radius, corners), Paint()..color = fill);
    }
    if (borderWidth <= 0 || borderOpacity <= 0 || rimColor.a == 0) {
      return;
    }
    final rimRect = bounds.deflate(borderWidth / 2);
    if (rimRect.isEmpty) {
      return;
    }
    final ltr = textDirection == TextDirection.ltr;
    final gradient = LinearGradient(
      begin: ltr ? Alignment.topLeft : Alignment.topRight,
      end: ltr ? Alignment.bottomRight : Alignment.bottomLeft,
      colors: [
        rimColor.withValues(alpha: rimColor.a * borderOpacity),
        rimColor.withValues(alpha: rimColor.a * borderOpacity * 0.25),
      ],
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = gradient.createShader(bounds);
    canvas.drawPath(glassShapePath(rimRect, radius, corners), paint);
  }

  @override
  bool shouldRepaint(GlassFillPainter oldDelegate) {
    return oldDelegate.fill != fill ||
        oldDelegate.rimColor != rimColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderOpacity != borderOpacity ||
        oldDelegate.radius != radius ||
        oldDelegate.corners != corners ||
        oldDelegate.textDirection != textDirection;
  }
}
