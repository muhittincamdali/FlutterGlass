import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// A button with a frosted glass appearance.
///
/// Supports an icon, label, and responds to taps with a subtle
/// scale animation and ink splash effect.
class GlassButton extends StatefulWidget {
  /// The text label displayed on the button.
  final String? label;

  /// An optional icon displayed before the label.
  final IconData? icon;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Override border radius from the theme.
  final BorderRadius? borderRadius;

  /// The text style for the label.
  final TextStyle? labelStyle;

  /// Padding inside the button.
  final EdgeInsetsGeometry padding;

  /// Whether the button is in a loading state.
  final bool isLoading;

  /// Creates a [GlassButton].
  const GlassButton({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.blurSigma,
    this.tintColor,
    this.borderRadius,
    this.labelStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.isLoading = false,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) => _scaleController.forward();
  void _onTapUp(TapUpDetails details) => _scaleController.reverse();
  void _onTapCancel() => _scaleController.reverse();

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = widget.blurSigma ?? theme.blurSigma * 0.6;
    final tint = widget.tintColor ?? theme.tintColor;
    final radius = widget.borderRadius ?? theme.borderRadius;

    final defaultStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: widget.onPressed != null ? _onTapDown : null,
        onTapUp: widget.onPressed != null ? _onTapUp : null,
        onTapCancel: widget.onPressed != null ? _onTapCancel : null,
        onTap: widget.onPressed,
        child: ClipRRect(
          borderRadius: radius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                color: tint,
                borderRadius: radius,
                border: Border.all(
                  color: theme.borderColor,
                  width: theme.borderWidth,
                ),
              ),
              child: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.icon != null) ...[
                          Icon(widget.icon, color: Colors.white, size: 20),
                          if (widget.label != null) const SizedBox(width: 8),
                        ],
                        if (widget.label != null)
                          Text(
                            widget.label!,
                            style: widget.labelStyle ?? defaultStyle,
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
