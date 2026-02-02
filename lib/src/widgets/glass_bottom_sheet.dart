import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// A bottom sheet with a frosted glass appearance.
///
/// Use [showGlassBottomSheet] to present this widget modally,
/// or place it directly in a widget tree.
class GlassBottomSheet extends StatelessWidget {
  /// The content of the bottom sheet.
  final Widget child;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Override border radius from the theme (applied to top corners only).
  final BorderRadius? borderRadius;

  /// Whether to show a drag handle at the top.
  final bool showDragHandle;

  /// Padding inside the sheet.
  final EdgeInsetsGeometry padding;

  /// Optional minimum height constraint.
  final double? minHeight;

  /// Optional maximum height as a fraction of the screen (0.0 to 1.0).
  final double maxHeightFraction;

  /// Creates a [GlassBottomSheet].
  const GlassBottomSheet({
    super.key,
    required this.child,
    this.blurSigma,
    this.tintColor,
    this.borderRadius,
    this.showDragHandle = true,
    this.padding = const EdgeInsets.all(20),
    this.minHeight,
    this.maxHeightFraction = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = blurSigma ?? theme.blurSigma;
    final tint = tintColor ?? theme.tintColor;
    final radius = borderRadius ??
        const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        );
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final maxHeight =
        MediaQuery.of(context).size.height * maxHeightFraction;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Container(
            padding: padding.add(EdgeInsets.only(bottom: bottomPadding)),
            decoration: BoxDecoration(
              color: tint,
              borderRadius: radius,
              border: Border.all(
                color: theme.borderColor,
                width: theme.borderWidth,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showDragHandle) ...[
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
                Flexible(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows a modal bottom sheet styled with the glass effect.
///
/// Returns a [Future] that resolves to the value passed to [Navigator.pop]
/// when the sheet is dismissed.
Future<T?> showGlassBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isDismissible = true,
  bool enableDrag = true,
  Color barrierColor = const Color(0x80000000),
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    barrierColor: barrierColor,
    isScrollControlled: true,
    builder: builder,
  );
}
