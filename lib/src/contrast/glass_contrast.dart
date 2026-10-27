import 'dart:math' as math;

import 'package:flutter/painting.dart';

import '../style/glass_style.dart';

/// Contrast checks for text on glass, following the WCAG 2.2 definitions of
/// relative luminance and contrast ratio.
///
/// Glass is translucent, so the color behind a label depends on whatever
/// scrolls under it. These functions take a sample of backdrop colors and
/// find the tint opacity that keeps the label readable over all of them.
abstract final class GlassContrast {
  /// WCAG level AA for body text.
  static const double aa = 4.5;

  /// WCAG level AA for large text (18 pt, or 14 pt bold) and level AA for
  /// user interface components.
  static const double aaLarge = 3;

  /// WCAG level AAA for body text.
  static const double aaa = 7;

  /// The most backdrop colors one call accepts. Sample a gradient or an image
  /// down to a palette first; the limit keeps a call bounded in time.
  static const int maxBackdropSamples = 4096;

  /// The relative luminance of [color] (0 for black, 1 for white). Alpha is
  /// ignored.
  static double relativeLuminance(Color color) {
    double channel(double c) => c <= 0.04045 ? c / 12.92 : math.pow((c + 0.055) / 1.055, 2.4).toDouble();
    return 0.2126 * channel(color.r) + 0.7152 * channel(color.g) + 0.0722 * channel(color.b);
  }

  /// The contrast ratio of [foreground] drawn on [background], from 1 to 21.
  ///
  /// [background] is treated as opaque. A translucent [foreground] is
  /// composited over it first, as it would be on screen.
  static double contrastRatio(Color foreground, Color background) {
    final opaqueBackground = background.withValues(alpha: 1);
    final shown = Color.alphaBlend(foreground, opaqueBackground);
    return _ratio(relativeLuminance(shown), relativeLuminance(opaqueBackground));
  }

  /// The smallest opacity of [tint] that gives [foreground] a contrast ratio
  /// of at least [targetRatio] over every color in [backdrop], in steps of
  /// 1/255 (the precision of an 8-bit alpha channel). The alpha of [tint]
  /// itself is ignored.
  ///
  /// Returns null when even an opaque tint does not reach the target, for
  /// example white text on a white tint.
  ///
  /// Throws an [ArgumentError] when [backdrop] is empty or holds more than
  /// [maxBackdropSamples] colors, or when [targetRatio] is not between 1 and
  /// 21.
  static double? minimumTintOpacity({
    required Color foreground,
    required Color tint,
    required List<Color> backdrop,
    double targetRatio = aa,
  }) {
    _checkArguments(backdrop, targetRatio);
    final opaqueTint = tint.withValues(alpha: 1);
    final backgrounds = [for (final color in backdrop) color.withValues(alpha: 1)];
    for (var step = 0; step <= 255; step++) {
      final alpha = step / 255;
      final layer = opaqueTint.withValues(alpha: alpha);
      final passes = backgrounds.every(
        (background) => contrastRatio(foreground, Color.alphaBlend(layer, background)) >= targetRatio,
      );
      if (passes) {
        return alpha;
      }
    }
    return null;
  }

  /// [style] with its tint opacity raised, if needed, so [foreground] meets
  /// [targetRatio] over every color in [backdrop].
  ///
  /// The tint opacity is never lowered. When no opacity reaches the target the
  /// tint becomes opaque, the closest the style can get. Throws like
  /// [minimumTintOpacity].
  static GlassStyle legibleStyle(
    GlassStyle style, {
    required Color foreground,
    required List<Color> backdrop,
    double targetRatio = aa,
  }) {
    // The painted style: its tint has finite channels, so the search and the
    // division below never see a NaN.
    final painted = style.sanitized();
    final opacity = minimumTintOpacity(
      foreground: foreground,
      tint: painted.tint,
      backdrop: backdrop,
      targetRatio: targetRatio,
    );
    // The painted alpha is tint.a × tintOpacity, so a tint that is itself
    // translucent needs a proportionally higher tintOpacity.
    final tintAlpha = painted.tint.a;
    final needed = opacity == null || tintAlpha == 0 ? 1.0 : math.min(1.0, opacity / tintAlpha);
    final current = painted.tintOpacity;
    return needed > current ? style.copyWith(tintOpacity: needed) : style;
  }

  static double _ratio(double a, double b) {
    final lighter = math.max(a, b);
    final darker = math.min(a, b);
    return (lighter + 0.05) / (darker + 0.05);
  }

  static void _checkArguments(List<Color> backdrop, double targetRatio) {
    if (backdrop.isEmpty) {
      throw ArgumentError.value(backdrop, 'backdrop', 'must hold at least one color');
    }
    if (backdrop.length > maxBackdropSamples) {
      throw ArgumentError.value(
        backdrop.length,
        'backdrop',
        'must hold at most $maxBackdropSamples colors; sample it down first',
      );
    }
    if (targetRatio.isNaN || targetRatio < 1 || targetRatio > 21) {
      throw ArgumentError.value(targetRatio, 'targetRatio', 'must be between 1 and 21');
    }
  }
}
