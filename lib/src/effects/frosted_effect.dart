import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Configuration for frosted glass effect.
class FrostedEffectConfig {
  /// The blur intensity on the X axis.
  final double blurSigmaX;

  /// The blur intensity on the Y axis.
  final double blurSigmaY;

  /// The tint color overlay.
  final Color tintColor;

  /// The tint opacity.
  final double tintOpacity;

  /// Noise intensity (0.0 to 1.0).
  final double noiseIntensity;

  /// Noise opacity.
  final double noiseOpacity;

  /// Whether to apply saturation adjustment.
  final bool adjustSaturation;

  /// Saturation adjustment factor.
  final double saturationFactor;

  /// Border radius for the frosted area.
  final BorderRadius borderRadius;

  /// Border color.
  final Color borderColor;

  /// Border width.
  final double borderWidth;

  /// Inner glow color.
  final Color? innerGlowColor;

  /// Inner glow blur radius.
  final double innerGlowBlur;

  /// Outer shadow.
  final BoxShadow? shadow;

  /// Creates a [FrostedEffectConfig].
  const FrostedEffectConfig({
    this.blurSigmaX = 10.0,
    this.blurSigmaY = 10.0,
    this.tintColor = Colors.white,
    this.tintOpacity = 0.2,
    this.noiseIntensity = 0.0,
    this.noiseOpacity = 0.05,
    this.adjustSaturation = false,
    this.saturationFactor = 1.2,
    this.borderRadius = BorderRadius.zero,
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.0,
    this.innerGlowColor,
    this.innerGlowBlur = 0.0,
    this.shadow,
  });

  /// Creates a light frosted effect.
  factory FrostedEffectConfig.light() {
    return const FrostedEffectConfig(
      blurSigmaX: 15.0,
      blurSigmaY: 15.0,
      tintColor: Colors.white,
      tintOpacity: 0.3,
      borderColor: Color(0x33FFFFFF),
      borderWidth: 1.0,
    );
  }

  /// Creates a dark frosted effect.
  factory FrostedEffectConfig.dark() {
    return const FrostedEffectConfig(
      blurSigmaX: 20.0,
      blurSigmaY: 20.0,
      tintColor: Colors.black,
      tintOpacity: 0.3,
      borderColor: Color(0x22FFFFFF),
      borderWidth: 0.5,
    );
  }

  /// Creates a heavy frosted effect.
  factory FrostedEffectConfig.heavy() {
    return const FrostedEffectConfig(
      blurSigmaX: 30.0,
      blurSigmaY: 30.0,
      tintColor: Colors.white,
      tintOpacity: 0.4,
      noiseIntensity: 0.5,
      noiseOpacity: 0.03,
      borderColor: Color(0x55FFFFFF),
      borderWidth: 1.5,
    );
  }

  /// Creates a subtle frosted effect.
  factory FrostedEffectConfig.subtle() {
    return const FrostedEffectConfig(
      blurSigmaX: 5.0,
      blurSigmaY: 5.0,
      tintColor: Colors.white,
      tintOpacity: 0.1,
      borderColor: Color(0x22FFFFFF),
      borderWidth: 0.5,
    );
  }

  /// Creates a copy with modified properties.
  FrostedEffectConfig copyWith({
    double? blurSigmaX,
    double? blurSigmaY,
    Color? tintColor,
    double? tintOpacity,
    double? noiseIntensity,
    double? noiseOpacity,
    bool? adjustSaturation,
    double? saturationFactor,
    BorderRadius? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Color? innerGlowColor,
    double? innerGlowBlur,
    BoxShadow? shadow,
  }) {
    return FrostedEffectConfig(
      blurSigmaX: blurSigmaX ?? this.blurSigmaX,
      blurSigmaY: blurSigmaY ?? this.blurSigmaY,
      tintColor: tintColor ?? this.tintColor,
      tintOpacity: tintOpacity ?? this.tintOpacity,
      noiseIntensity: noiseIntensity ?? this.noiseIntensity,
      noiseOpacity: noiseOpacity ?? this.noiseOpacity,
      adjustSaturation: adjustSaturation ?? this.adjustSaturation,
      saturationFactor: saturationFactor ?? this.saturationFactor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      innerGlowColor: innerGlowColor ?? this.innerGlowColor,
      innerGlowBlur: innerGlowBlur ?? this.innerGlowBlur,
      shadow: shadow ?? this.shadow,
    );
  }

  /// Linear interpolation between two configs.
  static FrostedEffectConfig lerp(
    FrostedEffectConfig? a,
    FrostedEffectConfig? b,
    double t,
  ) {
    if (a == null && b == null) return const FrostedEffectConfig();
    if (a == null) return b!;
    if (b == null) return a;

    return FrostedEffectConfig(
      blurSigmaX: lerpDouble(a.blurSigmaX, b.blurSigmaX, t) ?? a.blurSigmaX,
      blurSigmaY: lerpDouble(a.blurSigmaY, b.blurSigmaY, t) ?? a.blurSigmaY,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      tintOpacity: lerpDouble(a.tintOpacity, b.tintOpacity, t) ?? a.tintOpacity,
      noiseIntensity:
          lerpDouble(a.noiseIntensity, b.noiseIntensity, t) ?? a.noiseIntensity,
      noiseOpacity:
          lerpDouble(a.noiseOpacity, b.noiseOpacity, t) ?? a.noiseOpacity,
      saturationFactor:
          lerpDouble(a.saturationFactor, b.saturationFactor, t) ??
              a.saturationFactor,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      innerGlowBlur:
          lerpDouble(a.innerGlowBlur, b.innerGlowBlur, t) ?? a.innerGlowBlur,
    );
  }
}

/// A frosted glass effect widget.
///
/// This widget applies a blur effect to whatever is behind it,
/// creating a realistic frosted glass appearance.
///
/// Example:
/// ```dart
/// FrostedEffect(
///   config: FrostedEffectConfig.light(),
///   child: Container(
///     padding: EdgeInsets.all(16),
///     child: Text('Frosted Content'),
///   ),
/// )
/// ```
class FrostedEffect extends StatelessWidget {
  /// The child widget to display on top of the frosted effect.
  final Widget? child;

  /// The configuration for the frosted effect.
  final FrostedEffectConfig config;

  /// Width of the frosted area.
  final double? width;

  /// Height of the frosted area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Margin around the widget.
  final EdgeInsets? margin;

  /// Alignment of the child.
  final Alignment alignment;

  /// Creates a [FrostedEffect].
  const FrostedEffect({
    super.key,
    this.child,
    this.config = const FrostedEffectConfig(),
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment = Alignment.center,
  });

  /// Creates a circular frosted effect.
  factory FrostedEffect.circular({
    Key? key,
    Widget? child,
    FrostedEffectConfig? config,
    double? diameter,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    final effectiveConfig =
        (config ?? const FrostedEffectConfig()).copyWith(
      borderRadius: BorderRadius.circular(diameter ?? 100 / 2),
    );

    return FrostedEffect(
      key: key,
      config: effectiveConfig,
      width: diameter,
      height: diameter,
      padding: padding,
      margin: margin,
      child: child,
    );
  }

  /// Creates a rounded frosted effect.
  factory FrostedEffect.rounded({
    Key? key,
    Widget? child,
    FrostedEffectConfig? config,
    double radius = 16.0,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    final effectiveConfig =
        (config ?? const FrostedEffectConfig()).copyWith(
      borderRadius: BorderRadius.circular(radius),
    );

    return FrostedEffect(
      key: key,
      config: effectiveConfig,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ClipRRect(
      borderRadius: config.borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: config.blurSigmaX,
          sigmaY: config.blurSigmaY,
        ),
        child: Container(
          width: width,
          height: height,
          alignment: alignment,
          padding: padding,
          decoration: BoxDecoration(
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

    if (config.noiseIntensity > 0) {
      content = Stack(
        children: [
          content,
          Positioned.fill(
            child: ClipRRect(
              borderRadius: config.borderRadius,
              child: CustomPaint(
                painter: _NoisePainter(
                  intensity: config.noiseIntensity,
                  opacity: config.noiseOpacity,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (config.innerGlowColor != null && config.innerGlowBlur > 0) {
      content = Container(
        decoration: BoxDecoration(
          borderRadius: config.borderRadius,
          boxShadow: [
            BoxShadow(
              color: config.innerGlowColor!,
              blurRadius: config.innerGlowBlur,
              spreadRadius: -config.innerGlowBlur / 2,
            ),
          ],
        ),
        child: content,
      );
    }

    if (margin != null) {
      content = Padding(
        padding: margin!,
        child: content,
      );
    }

    return content;
  }
}

/// Custom painter for noise texture.
class _NoisePainter extends CustomPainter {
  final double intensity;
  final double opacity;
  final math.Random _random = math.Random();

  _NoisePainter({
    required this.intensity,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final step = (4 / intensity).clamp(1, 10).toInt();

    for (var x = 0; x < size.width; x += step) {
      for (var y = 0; y < size.height; y += step) {
        final value = _random.nextDouble();
        paint.color = value > 0.5
            ? Colors.white.withValues(alpha: opacity * (value - 0.5) * 2)
            : Colors.black.withValues(alpha: opacity * (0.5 - value) * 2);
        canvas.drawRect(
          Rect.fromLTWH(x.toDouble(), y.toDouble(), step.toDouble(), step.toDouble()),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_NoisePainter oldDelegate) {
    return oldDelegate.intensity != intensity ||
        oldDelegate.opacity != opacity;
  }
}

/// An animated frosted effect that can transition between configs.
class AnimatedFrostedEffect extends StatefulWidget {
  /// The child widget.
  final Widget? child;

  /// The configuration.
  final FrostedEffectConfig config;

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Width of the frosted area.
  final double? width;

  /// Height of the frosted area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Creates an [AnimatedFrostedEffect].
  const AnimatedFrostedEffect({
    super.key,
    this.child,
    required this.config,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.width,
    this.height,
    this.padding,
  });

  @override
  State<AnimatedFrostedEffect> createState() => _AnimatedFrostedEffectState();
}

class _AnimatedFrostedEffectState extends State<AnimatedFrostedEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  FrostedEffectConfig? _oldConfig;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void didUpdateWidget(AnimatedFrostedEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config != widget.config) {
      _oldConfig = oldWidget.config;
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final config = FrostedEffectConfig.lerp(
          _oldConfig ?? widget.config,
          widget.config,
          _animation.value,
        );

        return FrostedEffect(
          config: config,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          child: widget.child,
        );
      },
    );
  }
}

/// A frosted effect that responds to hover.
class HoverFrostedEffect extends StatefulWidget {
  /// The child widget.
  final Widget? child;

  /// Normal configuration.
  final FrostedEffectConfig normalConfig;

  /// Hovered configuration.
  final FrostedEffectConfig hoverConfig;

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Width of the frosted area.
  final double? width;

  /// Height of the frosted area.
  final double? height;

  /// Padding around the child.
  final EdgeInsets? padding;

  /// Called when hover state changes.
  final ValueChanged<bool>? onHoverChanged;

  /// Creates a [HoverFrostedEffect].
  const HoverFrostedEffect({
    super.key,
    this.child,
    required this.normalConfig,
    required this.hoverConfig,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.width,
    this.height,
    this.padding,
    this.onHoverChanged,
  });

  @override
  State<HoverFrostedEffect> createState() => _HoverFrostedEffectState();
}

class _HoverFrostedEffectState extends State<HoverFrostedEffect> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    widget.onHoverChanged?.call(isHovered);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedFrostedEffect(
        config: _isHovered ? widget.hoverConfig : widget.normalConfig,
        duration: widget.duration,
        curve: widget.curve,
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }
}

/// A frosted overlay that covers the entire screen.
class FrostedOverlay extends StatelessWidget {
  /// The child widget to display behind the overlay.
  final Widget child;

  /// Whether the overlay is visible.
  final bool visible;

  /// The configuration for the frosted effect.
  final FrostedEffectConfig config;

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Content to display on top of the overlay.
  final Widget? overlayContent;

  /// Called when the overlay is tapped.
  final VoidCallback? onTap;

  /// Whether tapping the overlay dismisses it.
  final bool dismissOnTap;

  /// Creates a [FrostedOverlay].
  const FrostedOverlay({
    super.key,
    required this.child,
    this.visible = false,
    this.config = const FrostedEffectConfig(),
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.overlayContent,
    this.onTap,
    this.dismissOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        AnimatedSwitcher(
          duration: duration,
          switchInCurve: curve,
          switchOutCurve: curve,
          child: visible
              ? GestureDetector(
                  onTap: dismissOnTap ? onTap : null,
                  behavior: HitTestBehavior.opaque,
                  child: FrostedEffect(
                    config: config,
                    child: SizedBox.expand(
                      child: overlayContent != null
                          ? Center(child: overlayContent)
                          : null,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/// A frosted divider line.
class FrostedDivider extends StatelessWidget {
  /// Height of the divider.
  final double height;

  /// Thickness of the line.
  final double thickness;

  /// Indent from the start.
  final double indent;

  /// Indent from the end.
  final double endIndent;

  /// Color of the divider.
  final Color color;

  /// Blur intensity.
  final double blurSigma;

  /// Creates a [FrostedDivider].
  const FrostedDivider({
    super.key,
    this.height = 16.0,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color = const Color(0x44FFFFFF),
    this.blurSigma = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              height: thickness,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

/// A vertical frosted divider.
class FrostedVerticalDivider extends StatelessWidget {
  /// Width of the divider.
  final double width;

  /// Thickness of the line.
  final double thickness;

  /// Indent from the top.
  final double indent;

  /// Indent from the bottom.
  final double endIndent;

  /// Color of the divider.
  final Color color;

  /// Blur intensity.
  final double blurSigma;

  /// Creates a [FrostedVerticalDivider].
  const FrostedVerticalDivider({
    super.key,
    this.width = 16.0,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color = const Color(0x44FFFFFF),
    this.blurSigma = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(top: indent, bottom: endIndent),
      child: Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              width: thickness,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

/// A frosted badge widget.
class FrostedBadge extends StatelessWidget {
  /// The content of the badge.
  final Widget child;

  /// Configuration.
  final FrostedEffectConfig? config;

  /// Padding inside the badge.
  final EdgeInsets padding;

  /// Creates a [FrostedBadge].
  const FrostedBadge({
    super.key,
    required this.child,
    this.config,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = config ??
        const FrostedEffectConfig(
          blurSigmaX: 10.0,
          blurSigmaY: 10.0,
          tintColor: Colors.white,
          tintOpacity: 0.2,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderColor: Color(0x33FFFFFF),
          borderWidth: 0.5,
        );

    return FrostedEffect(
      config: effectiveConfig,
      padding: padding,
      child: child,
    );
  }
}
