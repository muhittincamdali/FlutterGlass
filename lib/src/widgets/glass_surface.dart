import 'package:flutter/material.dart';

import '../rendering/glass_painters.dart';
import '../style/glass_style.dart';
import '../theme/glass_theme.dart';

/// A piece of glass: it blurs and saturates whatever is painted behind it,
/// lays a tint over it, draws a rim light and a shadow, and clips [child] to
/// its shape.
///
/// Place it over colorful content — an image, a gradient, a scrolling list —
/// with a [Stack], `Scaffold.extendBody` or `Scaffold.extendBodyBehindAppBar`;
/// over a flat color the blur has nothing to show.
///
/// ```dart
/// GlassSurface(
///   padding: const EdgeInsets.all(16),
///   child: const Text('Hello, glass'),
/// )
/// ```
///
/// [style] and [fidelity] fall back to the nearest [GlassTheme]. With
/// [GlassFidelity.auto] the surface turns opaque when the platform asks for
/// more contrast. Inside a [GlassGroup] the surfaces share one backdrop read.
class GlassSurface extends StatelessWidget {
  /// Creates a glass surface.
  const GlassSurface({
    super.key,
    this.style,
    this.fidelity,
    this.padding,
    this.alignment,
    this.width,
    this.height,
    this.child,
  });

  /// The look of the glass. Null uses [GlassTheme.styleOf].
  final GlassStyle? style;

  /// How much of the effect to draw. Null uses [GlassThemeData.fidelity].
  final GlassFidelity? fidelity;

  /// Space between the edge of the glass and [child].
  final EdgeInsetsGeometry? padding;

  /// Aligns [child] inside the surface, which then expands to its constraints.
  final AlignmentGeometry? alignment;

  /// A fixed width, if any.
  final double? width;

  /// A fixed height, if any.
  final double? height;

  /// The content, clipped to the shape of the glass.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final resolved = ResolvedGlass.of(context, style: style, fidelity: fidelity);
    final glass = resolved.style;
    final direction = Directionality.maybeOf(context) ?? TextDirection.ltr;
    final radius = glass.resolveRadius(direction);

    Widget content = child ?? const SizedBox.shrink();
    if (alignment != null) {
      content = Align(alignment: alignment!, child: content);
    }
    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }
    content = CustomPaint(
      painter: GlassFillPainter(
        fill: resolved.fillColor,
        rimColor: glass.rimColor,
        borderWidth: glass.borderWidth,
        borderOpacity: glass.borderOpacity,
        radius: radius,
        corners: glass.corners,
        textDirection: direction,
      ),
      child: content,
    );
    if (resolved.blursBackdrop) {
      content = _backdrop(context, glass, content);
    }
    content = switch (glass.corners) {
      GlassCorners.circular => ClipRRect(borderRadius: radius, child: content),
      GlassCorners.continuous => ClipRSuperellipse(borderRadius: radius, child: content),
    };
    if (glass.shadows.isNotEmpty) {
      content = CustomPaint(
        painter: GlassShadowPainter(shadows: glass.shadows, radius: radius, corners: glass.corners),
        child: content,
      );
    }
    if (width != null || height != null) {
      content = SizedBox(width: width, height: height, child: content);
    }
    return content;
  }

  static Widget _backdrop(BuildContext context, GlassStyle glass, Widget child) {
    // Unbounded on purpose: with `bounded: true`, Flutter 3.47 on the iOS 27
    // simulator (Impeller) left the backdrop of a surface inside a scrolling
    // list unblurred and drew a seam near its top edge.
    final blur = ImageFilterConfig.blur(sigmaX: glass.blurSigma, sigmaY: glass.blurSigma);
    final filter = glass.saturation == 1
        ? blur
        : ImageFilterConfig.compose(
            outer: ImageFilterConfig(ColorFilter.matrix(glassSaturationMatrix(glass.saturation))),
            inner: blur,
          );
    if (BackdropGroup.of(context) != null) {
      return BackdropFilter.grouped(filterConfig: filter, child: child);
    }
    return BackdropFilter(filterConfig: filter, child: child);
  }
}

/// Lets every [GlassSurface] below it share one read of the backdrop.
///
/// With Impeller, each [BackdropFilter] normally copies the screen behind it;
/// surfaces in one group are drawn from a single copy. Wrap a screen that
/// shows several glass surfaces at once — a toolbar, cards and a navigation
/// bar — in one group. Surfaces in the same group should not overlap each
/// other, since they do not see one another.
class GlassGroup extends StatelessWidget {
  /// Creates a group for the glass surfaces in [child].
  const GlassGroup({super.key, required this.child});

  /// The subtree whose glass surfaces share a backdrop.
  final Widget child;

  @override
  Widget build(BuildContext context) => BackdropGroup(child: child);
}

/// A [GlassSurface] that animates to a new [style] whenever it changes.
///
/// Changes are instant when the platform asks to reduce motion
/// ([MediaQuery.disableAnimationsOf]).
class AnimatedGlassSurface extends ImplicitlyAnimatedWidget {
  /// Creates an animated glass surface.
  const AnimatedGlassSurface({
    super.key,
    required this.style,
    this.fidelity,
    this.padding,
    this.alignment,
    this.width,
    this.height,
    this.child,
    super.curve,
    super.duration = const Duration(milliseconds: 240),
    super.onEnd,
  });

  /// The style to animate to.
  final GlassStyle style;

  /// See [GlassSurface.fidelity].
  final GlassFidelity? fidelity;

  /// See [GlassSurface.padding].
  final EdgeInsetsGeometry? padding;

  /// See [GlassSurface.alignment].
  final AlignmentGeometry? alignment;

  /// See [GlassSurface.width].
  final double? width;

  /// See [GlassSurface.height].
  final double? height;

  /// See [GlassSurface.child].
  final Widget? child;

  @override
  AnimatedWidgetBaseState<AnimatedGlassSurface> createState() => _AnimatedGlassSurfaceState();
}

class _AnimatedGlassSurfaceState extends AnimatedWidgetBaseState<AnimatedGlassSurface> {
  GlassStyleTween? _style;

  @override
  void didUpdateWidget(AnimatedGlassSurface oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The base class has just started the controller with widget.duration;
    // with reduced motion the new style is shown at once instead.
    if (MediaQuery.disableAnimationsOf(context) && controller.isAnimating) {
      controller.value = controller.upperBound;
    }
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _style =
        visitor(_style, widget.style, (dynamic value) => GlassStyleTween(begin: value as GlassStyle))
            as GlassStyleTween?;
  }

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      style: _style?.evaluate(animation) ?? widget.style,
      fidelity: widget.fidelity,
      padding: widget.padding,
      alignment: widget.alignment,
      width: widget.width,
      height: widget.height,
      child: widget.child,
    );
  }
}

/// Interpolates between two [GlassStyle]s with [GlassStyle.lerp].
class GlassStyleTween extends Tween<GlassStyle?> {
  /// Creates a style tween.
  GlassStyleTween({super.begin, super.end});

  @override
  GlassStyle? lerp(double t) => GlassStyle.lerp(begin, end, t);
}
