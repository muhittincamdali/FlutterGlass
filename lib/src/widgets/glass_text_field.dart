import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// A text input field with a frosted glass appearance.
///
/// Supports prefix/suffix icons, hint text, and all the usual
/// [TextField] features wrapped in a glass container.
class GlassTextField extends StatelessWidget {
  /// The text editing controller.
  final TextEditingController? controller;

  /// Placeholder text shown when the field is empty.
  final String? hintText;

  /// An icon displayed before the input area.
  final IconData? prefixIcon;

  /// An icon displayed after the input area.
  final IconData? suffixIcon;

  /// Called when the user submits the text (e.g. presses done).
  final ValueChanged<String>? onSubmitted;

  /// Called on every text change.
  final ValueChanged<String>? onChanged;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Override border radius from the theme.
  final BorderRadius? borderRadius;

  /// The text style for the input.
  final TextStyle? style;

  /// Whether this field obscures the text (for passwords).
  final bool obscureText;

  /// The keyboard type.
  final TextInputType? keyboardType;

  /// Maximum number of lines.
  final int maxLines;

  /// The focus node for this field.
  final FocusNode? focusNode;

  /// Whether the field is enabled.
  final bool enabled;

  /// Creates a [GlassTextField].
  const GlassTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
    this.onChanged,
    this.blurSigma,
    this.tintColor,
    this.borderRadius,
    this.style,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.focusNode,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = blurSigma ?? theme.blurSigma * 0.5;
    final tint = tintColor ?? theme.tintColor;
    final radius = borderRadius ?? theme.borderRadius;

    final hintStyle = TextStyle(
      color: Colors.white.withOpacity(0.4),
      fontSize: 16,
    );

    final inputStyle = style ??
        const TextStyle(
          color: Colors.white,
          fontSize: 16,
        );

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          decoration: BoxDecoration(
            color: tint,
            borderRadius: radius,
            border: Border.all(
              color: theme.borderColor,
              width: theme.borderWidth,
            ),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            enabled: enabled,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            style: inputStyle,
            cursorColor: Colors.white70,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.white54, size: 20)
                  : null,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: Colors.white54, size: 20)
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
