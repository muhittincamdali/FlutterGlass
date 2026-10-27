import 'package:flutter/material.dart';

/// A colorful scene for the glass to blur: a blue gradient with soft orbs.
///
/// Glass over a flat color shows nothing, so every page of the gallery sits
/// on this backdrop. It is drawn in code, so the example needs no images.
class Backdrop extends StatelessWidget {
  /// Creates the backdrop behind [child].
  const Backdrop({super.key, required this.child});

  /// The content drawn over the backdrop.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CustomPaint(
      painter: _BackdropPainter(dark: dark),
      child: child,
    );
  }
}

class _Orb {
  const _Orb(this.center, this.radius, this.color);

  /// Center as a fraction of the size.
  final Offset center;

  /// Radius as a fraction of the shortest side.
  final double radius;
  final Color color;
}

class _BackdropPainter extends CustomPainter {
  const _BackdropPainter({required this.dark});

  final bool dark;

  static const _orbs = [
    _Orb(Offset(0.15, 0.12), 0.55, Color(0xFF64D2FF)),
    _Orb(Offset(0.9, 0.3), 0.5, Color(0xFF5E5CE6)),
    _Orb(Offset(0.2, 0.62), 0.45, Color(0xFF30D158)),
    _Orb(Offset(0.85, 0.82), 0.6, Color(0xFFFF9F0A)),
    _Orb(Offset(0.5, 1.0), 0.4, Color(0xFFFF375F)),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final bounds = Offset.zero & size;
    final colors = dark ? const [Color(0xFF04111F), Color(0xFF0A2A52)] : const [Color(0xFFEAF4FF), Color(0xFF9CC9FF)];
    canvas.drawRect(
      bounds,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ).createShader(bounds),
    );
    final side = size.shortestSide;
    for (final orb in _orbs) {
      final center = Offset(orb.center.dx * size.width, orb.center.dy * size.height);
      final radius = orb.radius * side;
      final color = orb.color.withValues(alpha: dark ? 0.75 : 0.9);
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..shader = RadialGradient(
            colors: [color, color.withValues(alpha: 0)],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
      );
    }
    // Stripes give the blur fine detail to soften, so the effect is visible.
    final stripe = Paint()
      ..color = (dark ? Colors.white : const Color(0xFF0A2A52)).withValues(alpha: 0.12)
      ..strokeWidth = 6;
    for (var x = -size.height; x < size.width; x += 28) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), stripe);
    }
  }

  @override
  bool shouldRepaint(_BackdropPainter oldDelegate) => oldDelegate.dark != dark;
}
