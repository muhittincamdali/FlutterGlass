import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

/// Configuration for gradient glass effect.
class GradientGlassConfig {
  /// The blur intensity.
  final double blurSigma;

  /// Primary gradient colors.
  final List<Color> colors;

  /// Gradient stops.
  final List<double>? stops;

  /// Gradient begin alignment.
  final Alignment begin;

  /// Gradient end alignment.
  final Alignment end;

  /// Tint overlay color.
  final Color tintColor;

  /// Tint opacity.
  final double tintOpacity;

  /// Border radius.
  final BorderRadius borderRadius;

  /// Border color.
  final Color borderColor;

  /// Border width.
  final double borderWidth;

  /// Whether to animate the gradient.
  final bool animated;

  /// Animation duration for animated gradients.
  final Duration animationDuration;

  /// Gradient type.
  final GradientType type;

  /// Center for radial gradients.
  final Alignment center;

  /// Radius for radial gradients.
  final double radius;

  /// Focal point for radial gradients.
  final Alignment? focal;

  /// Focal radius for radial gradients.
  final double focalRadius;

  /// Start angle for sweep gradients.
  final double startAngle;

  /// End angle for sweep gradients.
  final double endAngle;

  /// Shadow configuration.
  final BoxShadow? shadow;

  /// Creates a [GradientGlassConfig].
  const GradientGlassConfig({
    this.blurSigma = 15.0,
    this.colors = const [Color(0x33FFFFFF), Color(0x11FFFFFF)],
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.tintColor = Colors.white,
    this.tintOpacity = 0.1,
    this.borderRadius = BorderRadius.zero,
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.5,
    this.animated = false,
    this.animationDuration = const Duration(seconds: 3),
    this.type = GradientType.linear,
    this.center = Alignment.center,
    this.radius = 0.5,
    this.focal,
    this.focalRadius = 0.0,
    this.startAngle = 0.0,
    this.endAngle = math.pi * 2,
    this.shadow,
  });

  /// Creates a linear gradient configuration.
  factory GradientGlassConfig.linear({
    double blurSigma = 15.0,
    required List<Color> colors,
    List<double>? stops,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return GradientGlassConfig(
      blurSigma: blurSigma,
      colors: colors,
      stops: stops,
      begin: begin,
      end: end,
      borderRadius: borderRadius,
      type: GradientType.linear,
    );
  }

  /// Creates a radial gradient configuration.
  factory GradientGlassConfig.radial({
    double blurSigma = 15.0,
    required List<Color> colors,
    List<double>? stops,
    Alignment center = Alignment.center,
    double radius = 0.5,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return GradientGlassConfig(
      blurSigma: blurSigma,
      colors: colors,
      stops: stops,
      center: center,
      radius: radius,
      borderRadius: borderRadius,
      type: GradientType.radial,
    );
  }

  /// Creates a sweep gradient configuration.
  factory GradientGlassConfig.sweep({
    double blurSigma = 15.0,
    required List<Color> colors,
    List<double>? stops,
    Alignment center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = math.pi * 2,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return GradientGlassConfig(
      blurSigma: blurSigma,
      colors: colors,
      stops: stops,
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      borderRadius: borderRadius,
      type: GradientType.sweep,
    );
  }

  /// Creates a sunset-themed configuration.
  factory GradientGlassConfig.sunset() {
    return GradientGlassConfig(
      blurSigma: 20.0,
      colors: const [
        Color(0x44FF6B6B),
        Color(0x44FFA07A),
        Color(0x44FFD93D),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      borderColor: const Color(0x55FF6B6B),
    );
  }

  /// Creates an ocean-themed configuration.
  factory GradientGlassConfig.ocean() {
    return GradientGlassConfig(
      blurSigma: 20.0,
      colors: const [
        Color(0x440093E9),
        Color(0x4480D0C7),
        Color(0x4400B4D8),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      borderColor: const Color(0x550093E9),
    );
  }

  /// Creates a forest-themed configuration.
  factory GradientGlassConfig.forest() {
    return GradientGlassConfig(
      blurSigma: 18.0,
      colors: const [
        Color(0x4411998E),
        Color(0x4438EF7D),
        Color(0x442AF598),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      borderColor: const Color(0x5511998E),
    );
  }

  /// Creates a purple haze configuration.
  factory GradientGlassConfig.purpleHaze() {
    return GradientGlassConfig(
      blurSigma: 22.0,
      colors: const [
        Color(0x44A855F7),
        Color(0x44EC4899),
        Color(0x446366F1),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      borderColor: const Color(0x55A855F7),
    );
  }

  /// Creates a neon-themed configuration.
  factory GradientGlassConfig.neon() {
    return GradientGlassConfig(
      blurSigma: 25.0,
      colors: const [
        Color(0x4400FF87),
        Color(0x4460EFFF),
        Color(0x44FF00FF),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      borderColor: const Color(0x6600FF87),
      borderWidth: 1.0,
    );
  }

  /// Creates a copy with modified properties.
  GradientGlassConfig copyWith({
    double? blurSigma,
    List<Color>? colors,
    List<double>? stops,
    Alignment? begin,
    Alignment? end,
    Color? tintColor,
    double? tintOpacity,
    BorderRadius? borderRadius,
    Color? borderColor,
    double? borderWidth,
    bool? animated,
    Duration? animationDuration,
    GradientType? type,
    Alignment? center,
    double? radius,
    Alignment? focal,
    double? focalRadius,
    double? startAngle,
    double? endAngle,
    BoxShadow? shadow,
  }) {
    return GradientGlassConfig(
      blurSigma: blurSigma ?? this.blurSigma,
      colors: colors ?? this.colors,
      stops: stops ?? this.stops,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      tintColor: tintColor ?? this.tintColor,
      tintOpacity: tintOpacity ?? this.tintOpacity,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      animated: animated ?? this.animated,
      animationDuration: animationDuration ?? this.animationDuration,
      type: type ?? this.type,
      center: center ?? this.center,
      radius: radius ?? this.radius,
      focal: focal ?? this.focal,
      focalRadius: focalRadius ?? this.focalRadius,
      startAngle: startAngle ?? this.startAngle,
      endAngle: endAngle ?? this.endAngle,
      shadow: shadow ?? this.shadow,
    );
  }
}

/// Gradient types supported by gradient glass.
enum GradientType {
  /// Linear gradient.
  linear,

  /// Radial gradient.
  radial,

  /// Sweep gradient.
  sweep,
}

/// A glass effect with gradient overlay.
///
/// Example:
/// ```dart
/// GradientGlass(
///   config: GradientGlassConfig.sunset(),
///   child: Container(
///     padding: EdgeInsets.all(16),
///     child: Text('Gradient Glass'),
///   ),
/// )
/// ```
class GradientGlass extends StatelessWidget {
  /// The child widget.
  final Widget? child;

  /// Configuration.
  final GradientGlassConfig config;

  /// Width of the glass area.
  final double? width;

  /// Height of the glass area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Margin around the widget.
  final EdgeInsets? margin;

  /// Alignment of the child.
  final Alignment alignment;

  /// Creates a [GradientGlass].
  const GradientGlass({
    super.key,
    this.child,
    this.config = const GradientGlassConfig(),
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment = Alignment.center,
  });

  Gradient _buildGradient() {
    switch (config.type) {
      case GradientType.linear:
        return LinearGradient(
          colors: config.colors,
          stops: config.stops,
          begin: config.begin,
          end: config.end,
        );
      case GradientType.radial:
        return RadialGradient(
          colors: config.colors,
          stops: config.stops,
          center: config.center,
          radius: config.radius,
          focal: config.focal,
          focalRadius: config.focalRadius,
        );
      case GradientType.sweep:
        return SweepGradient(
          colors: config.colors,
          stops: config.stops,
          center: config.center,
          startAngle: config.startAngle,
          endAngle: config.endAngle,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ClipRRect(
      borderRadius: config.borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: config.blurSigma,
          sigmaY: config.blurSigma,
        ),
        child: Container(
          width: width,
          height: height,
          alignment: alignment,
          padding: padding,
          decoration: BoxDecoration(
            gradient: _buildGradient(),
            color: config.tintColor.withValues(alpha: config.tintOpacity),
            borderRadius: config.borderRadius,
            border: config.borderWidth > 0
                ? Border.all(
                    color: config.borderColor,
                    width: config.borderWidth,
                  )
                : null,
            boxShadow: config.shadow != null ? [config.shadow!] : null,
          ),
          child: child,
        ),
      ),
    );

    if (margin != null) {
      content = Padding(
        padding: margin!,
        child: content,
      );
    }

    return content;
  }
}

/// An animated gradient glass effect.
class AnimatedGradientGlass extends StatefulWidget {
  /// The child widget.
  final Widget? child;

  /// Configuration.
  final GradientGlassConfig config;

  /// Width of the glass area.
  final double? width;

  /// Height of the glass area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Margin around the widget.
  final EdgeInsets? margin;

  /// Alignment of the child.
  final Alignment alignment;

  /// Creates an [AnimatedGradientGlass].
  const AnimatedGradientGlass({
    super.key,
    this.child,
    required this.config,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment = Alignment.center,
  });

  @override
  State<AnimatedGradientGlass> createState() => _AnimatedGradientGlassState();
}

class _AnimatedGradientGlassState extends State<AnimatedGradientGlass>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Color> _getAnimatedColors(double value) {
    final colors = widget.config.colors;
    final shift = (value * colors.length).floor();
    final result = <Color>[];

    for (var i = 0; i < colors.length; i++) {
      result.add(colors[(i + shift) % colors.length]);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final animatedConfig = widget.config.copyWith(
          colors: _getAnimatedColors(_controller.value),
          begin: _rotateAlignment(widget.config.begin, _controller.value),
          end: _rotateAlignment(widget.config.end, _controller.value),
        );

        return GradientGlass(
          config: animatedConfig,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          alignment: widget.alignment,
          child: widget.child,
        );
      },
    );
  }

  Alignment _rotateAlignment(Alignment alignment, double rotation) {
    final angle = rotation * math.pi * 2;
    final cos = math.cos(angle);
    final sin = math.sin(angle);

    return Alignment(
      alignment.x * cos - alignment.y * sin,
      alignment.x * sin + alignment.y * cos,
    );
  }
}

/// A gradient glass card with preset styling.
class GradientGlassCard extends StatelessWidget {
  /// The child widget.
  final Widget? child;

  /// Configuration.
  final GradientGlassConfig? config;

  /// Padding inside the card.
  final EdgeInsets padding;

  /// Margin around the card.
  final EdgeInsets? margin;

  /// Border radius.
  final double borderRadius;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Called when the card is long pressed.
  final VoidCallback? onLongPress;

  /// Creates a [GradientGlassCard].
  const GradientGlassCard({
    super.key,
    this.child,
    this.config,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.borderRadius = 16.0,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = (config ?? const GradientGlassConfig()).copyWith(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    Widget card = GradientGlass(
      config: effectiveConfig,
      padding: padding,
      margin: margin,
      child: child,
    );

    if (onTap != null || onLongPress != null) {
      card = GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: card,
      );
    }

    return card;
  }
}

/// A gradient glass button.
class GradientGlassButton extends StatefulWidget {
  /// The child widget.
  final Widget child;

  /// Configuration.
  final GradientGlassConfig? config;

  /// Hover configuration.
  final GradientGlassConfig? hoverConfig;

  /// Pressed configuration.
  final GradientGlassConfig? pressedConfig;

  /// Padding inside the button.
  final EdgeInsets padding;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is enabled.
  final bool enabled;

  /// Creates a [GradientGlassButton].
  const GradientGlassButton({
    super.key,
    required this.child,
    this.config,
    this.hoverConfig,
    this.pressedConfig,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.onPressed,
    this.enabled = true,
  });

  @override
  State<GradientGlassButton> createState() => _GradientGlassButtonState();
}

class _GradientGlassButtonState extends State<GradientGlassButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  GradientGlassConfig get _currentConfig {
    final baseConfig = widget.config ??
        const GradientGlassConfig(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        );

    if (_isPressed && widget.pressedConfig != null) {
      return widget.pressedConfig!;
    }

    if (_isHovered && widget.hoverConfig != null) {
      return widget.hoverConfig!;
    }

    return baseConfig;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          if (widget.enabled) widget.onPressed?.call();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          child: Opacity(
            opacity: widget.enabled ? 1.0 : 0.5,
            child: GradientGlass(
              config: _currentConfig,
              padding: widget.padding,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

/// A mesh gradient glass effect.
class MeshGradientGlass extends StatefulWidget {
  /// The child widget.
  final Widget? child;

  /// Mesh colors.
  final List<Color> colors;

  /// Blur intensity.
  final double blurSigma;

  /// Border radius.
  final BorderRadius borderRadius;

  /// Animation duration.
  final Duration animationDuration;

  /// Whether to animate.
  final bool animated;

  /// Width of the glass area.
  final double? width;

  /// Height of the glass area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Creates a [MeshGradientGlass].
  const MeshGradientGlass({
    super.key,
    this.child,
    required this.colors,
    this.blurSigma = 80.0,
    this.borderRadius = BorderRadius.zero,
    this.animationDuration = const Duration(seconds: 5),
    this.animated = true,
    this.width,
    this.height,
    this.padding,
  });

  @override
  State<MeshGradientGlass> createState() => _MeshGradientGlassState();
}

class _MeshGradientGlassState extends State<MeshGradientGlass>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    if (widget.animated) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _MeshGradientPainter(
              colors: widget.colors,
              animation: _controller.value,
              blurSigma: widget.blurSigma,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.blurSigma / 4,
                sigmaY: widget.blurSigma / 4,
              ),
              child: Container(
                width: widget.width,
                height: widget.height,
                padding: widget.padding,
                color: Colors.white.withValues(alpha: 0.05),
                child: widget.child,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Custom painter for mesh gradient.
class _MeshGradientPainter extends CustomPainter {
  final List<Color> colors;
  final double animation;
  final double blurSigma;

  _MeshGradientPainter({
    required this.colors,
    required this.animation,
    required this.blurSigma,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

    final positions = _calculatePositions(size, animation);

    for (var i = 0; i < colors.length && i < positions.length; i++) {
      paint.color = colors[i];
      canvas.drawCircle(
        positions[i],
        size.shortestSide * 0.4,
        paint,
      );
    }
  }

  List<Offset> _calculatePositions(Size size, double t) {
    final positions = <Offset>[];
    final count = colors.length;

    for (var i = 0; i < count; i++) {
      final angle = (i / count + t) * math.pi * 2;
      final radius = size.shortestSide * 0.3;

      positions.add(Offset(
        size.width / 2 + math.cos(angle) * radius,
        size.height / 2 + math.sin(angle) * radius,
      ));
    }

    return positions;
  }

  @override
  bool shouldRepaint(_MeshGradientPainter oldDelegate) {
    return oldDelegate.animation != animation ||
        oldDelegate.colors != colors ||
        oldDelegate.blurSigma != blurSigma;
  }
}

/// A conic gradient glass effect.
class ConicGradientGlass extends StatelessWidget {
  /// The child widget.
  final Widget? child;

  /// Gradient colors.
  final List<Color> colors;

  /// Gradient stops.
  final List<double>? stops;

  /// Center of the gradient.
  final Alignment center;

  /// Starting angle in radians.
  final double startAngle;

  /// Blur intensity.
  final double blurSigma;

  /// Border radius.
  final BorderRadius borderRadius;

  /// Width of the glass area.
  final double? width;

  /// Height of the glass area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Creates a [ConicGradientGlass].
  const ConicGradientGlass({
    super.key,
    this.child,
    required this.colors,
    this.stops,
    this.center = Alignment.center,
    this.startAngle = 0.0,
    this.blurSigma = 15.0,
    this.borderRadius = BorderRadius.zero,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            gradient: SweepGradient(
              colors: colors,
              stops: stops,
              center: center,
              startAngle: startAngle,
            ),
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
