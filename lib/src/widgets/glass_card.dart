import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// A container widget styled with a frosted glass effect.
///
/// [GlassCard] is the primary building block for glass UIs. It renders
/// a blurred backdrop with a tinted overlay, subtle border, and optional
/// shadow to create a realistic glassmorphism appearance.
class GlassCard extends StatelessWidget {
  /// The child widget displayed inside the card.
  final Widget child;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Override border radius from the theme.
  final BorderRadius? borderRadius;

  /// Override border color from the theme.
  final Color? borderColor;

  /// Override border width from the theme.
  final double? borderWidth;

  /// Override shadow elevation from the theme.
  final double? elevation;

  /// Padding inside the card.
  final EdgeInsetsGeometry? padding;

  /// Margin outside the card.
  final EdgeInsetsGeometry? margin;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// Callback when the card is tapped.
  final VoidCallback? onTap;

  /// Callback when the card is long-pressed.
  final VoidCallback? onLongPress;

  /// Creates a [GlassCard].
  const GlassCard({
    super.key,
    required this.child,
    this.blurSigma,
    this.tintColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = blurSigma ?? theme.blurSigma;
    final tint = tintColor ?? theme.tintColor;
    final radius = borderRadius ?? theme.borderRadius;
    final border = borderColor ?? theme.borderColor;
    final bWidth = borderWidth ?? theme.borderWidth;
    final elev = elevation ?? theme.elevation;

    Widget card = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: elev > 0
            ? [
                BoxShadow(
                  color: theme.shadowColor,
                  blurRadius: elev * 2,
                  offset: Offset(0, elev),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
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
