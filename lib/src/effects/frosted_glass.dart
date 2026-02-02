import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// A widget that applies a frosted glass effect to its child.
///
/// The effect is achieved using a [BackdropFilter] with a gaussian blur,
/// layered with a tinted overlay and an optional border.
class FrostedGlass extends StatelessWidget {
  /// The widget to display on top of the frosted surface.
  final Widget child;

  /// Override the blur sigma from the theme.
  final double? blurSigma;

  /// Override the tint color from the theme.
  final Color? tintColor;

  /// Override the border radius from the theme.
  final BorderRadius? borderRadius;

  /// Override the border color from the theme.
  final Color? borderColor;

  /// Override the border width from the theme.
  final double? borderWidth;

  /// Optional padding inside the glass surface.
  final EdgeInsetsGeometry? padding;

  /// Optional margin around the glass surface.
  final EdgeInsetsGeometry? margin;

  /// Optional width constraint.
  final double? width;

  /// Optional height constraint.
  final double? height;

  /// Creates a [FrostedGlass] widget.
  const FrostedGlass({
    super.key,
    required this.child,
    this.blurSigma,
    this.tintColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.margin,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = blurSigma ?? theme.blurSigma;
    final tint = tintColor ?? theme.tintColor;
    final radius = borderRadius ?? theme.borderRadius;
    final border = borderColor ?? theme.borderColor;
    final bWidth = borderWidth ?? theme.borderWidth;

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigma,
            sigmaY: sigma,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: tint,
              borderRadius: radius,
              border: Border.all(
                color: border,
                width: bWidth,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A convenience wrapper that creates a frosted glass overlay
/// that fills its parent, useful for placing behind content in a Stack.
class FrostedOverlay extends StatelessWidget {
  /// The sigma for the blur.
  final double sigma;

  /// The tint applied on top of the blur.
  final Color tintColor;

  /// Creates a [FrostedOverlay].
  const FrostedOverlay({
    super.key,
    this.sigma = 15.0,
    this.tintColor = const Color(0x1AFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: ColoredBox(color: tintColor),
        ),
      ),
    );
  }
}
