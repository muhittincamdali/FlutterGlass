import 'package:flutter/material.dart';

/// A widget that adds a moving shimmer highlight effect over its child.
///
/// The shimmer sweeps from left to right in a continuous loop,
/// creating a subtle loading or attention-drawing effect on glass surfaces.
class ShimmerGlass extends StatefulWidget {
  /// The child widget to apply the shimmer over.
  final Widget child;

  /// The base color of the shimmer (usually transparent or very subtle).
  final Color baseColor;

  /// The highlight color at the peak of the shimmer band.
  final Color highlightColor;

  /// The duration of one full shimmer cycle.
  final Duration duration;

  /// The width of the shimmer band as a fraction of the widget width.
  final double bandWidthFraction;

  /// Whether the shimmer animation is active.
  final bool enabled;

  /// Creates a [ShimmerGlass].
  const ShimmerGlass({
    super.key,
    required this.child,
    this.baseColor = const Color(0x0DFFFFFF),
    this.highlightColor = const Color(0x26FFFFFF),
    this.duration = const Duration(milliseconds: 1800),
    this.bandWidthFraction = 0.3,
    this.enabled = true,
  });

  @override
  State<ShimmerGlass> createState() => _ShimmerGlassState();
}

class _ShimmerGlassState extends State<ShimmerGlass>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(ShimmerGlass oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.enabled && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        final bandWidth = widget.bandWidthFraction;
        final start = -bandWidth + t * (1.0 + bandWidth);
        final end = start + bandWidth;

        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment(start * 2 - 1, 0),
              end: Alignment(end * 2 - 1, 0),
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
