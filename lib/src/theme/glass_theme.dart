import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../style/glass_style.dart';
import '../style/sanitize.dart';

/// How much of the glass effect a surface draws.
enum GlassFidelity {
  /// [full], or [opaque] when the platform asks for more contrast
  /// ([MediaQueryData.highContrast], the iOS "Increase Contrast" setting).
  auto,

  /// Blurred, saturated backdrop under a translucent tint.
  full,

  /// No blur: a translucent tint of at least
  /// [GlassThemeData.reducedTintOpacity]. Costs no backdrop read, so it suits
  /// long lists and low-end devices.
  reduced,

  /// No blur and no transparency: the tint composited over
  /// [GlassThemeData.fallbackColor]. Text keeps the contrast it would have on
  /// a solid surface.
  opaque,
}

/// Glass settings for a subtree: the style, the fidelity and the colors used
/// when transparency is turned off.
///
/// Set it app-wide as a [ThemeExtension] in `ThemeData.extensions`, or for a
/// subtree with a [GlassTheme].
@immutable
class GlassThemeData extends ThemeExtension<GlassThemeData> with Diagnosticable {
  /// Creates glass theme data.
  const GlassThemeData({
    this.style,
    this.fidelity = GlassFidelity.auto,
    this.fallbackColor,
    this.reducedTintOpacity = 0.82,
  });

  /// The style of glass surfaces that do not set their own. Null picks
  /// [GlassStyle.light] or [GlassStyle.dark] from the theme's brightness.
  final GlassStyle? style;

  /// The fidelity of glass surfaces that do not set their own.
  final GlassFidelity fidelity;

  /// The solid color behind [GlassFidelity.opaque] surfaces. Null uses
  /// `ColorScheme.surface` of the ambient [Theme].
  final Color? fallbackColor;

  /// The lowest tint opacity of a [GlassFidelity.reduced] surface, between 0
  /// and 1, so text stays readable without the blur.
  final double reducedTintOpacity;

  @override
  GlassThemeData copyWith({
    GlassStyle? style,
    GlassFidelity? fidelity,
    Color? fallbackColor,
    double? reducedTintOpacity,
  }) {
    return GlassThemeData(
      style: style ?? this.style,
      fidelity: fidelity ?? this.fidelity,
      fallbackColor: fallbackColor ?? this.fallbackColor,
      reducedTintOpacity: reducedTintOpacity ?? this.reducedTintOpacity,
    );
  }

  @override
  GlassThemeData lerp(covariant ThemeExtension<GlassThemeData>? other, double t) {
    if (other is! GlassThemeData) {
      return this;
    }
    return GlassThemeData(
      style: GlassStyle.lerp(style, other.style, t),
      fidelity: t < 0.5 ? fidelity : other.fidelity,
      fallbackColor: Color.lerp(fallbackColor, other.fallbackColor, t),
      reducedTintOpacity: lerpDouble(reducedTintOpacity, other.reducedTintOpacity, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GlassThemeData &&
        other.style == style &&
        other.fidelity == fidelity &&
        other.fallbackColor == fallbackColor &&
        other.reducedTintOpacity == reducedTintOpacity;
  }

  @override
  int get hashCode => Object.hash(style, fidelity, fallbackColor, reducedTintOpacity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<GlassStyle>('style', style, defaultValue: null))
      ..add(EnumProperty<GlassFidelity>('fidelity', fidelity))
      ..add(ColorProperty('fallbackColor', fallbackColor, defaultValue: null))
      ..add(DoubleProperty('reducedTintOpacity', reducedTintOpacity));
  }
}

/// Applies [GlassThemeData] to the glass widgets below it.
///
/// It is an [InheritedTheme], so routes pushed from inside it (menus, sheets,
/// dialogs) can capture it with [InheritedTheme.capture].
class GlassTheme extends InheritedTheme {
  /// Creates a glass theme for [child].
  const GlassTheme({super.key, required this.data, required super.child});

  /// The settings for glass widgets in [child].
  final GlassThemeData data;

  /// The nearest [GlassTheme]'s data, else the [GlassThemeData] extension of
  /// the ambient [Theme], else the defaults.
  static GlassThemeData of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<GlassTheme>();
    return inherited?.data ?? Theme.of(context).extension<GlassThemeData>() ?? const GlassThemeData();
  }

  /// The style a glass surface without its own style uses in [context].
  static GlassStyle styleOf(BuildContext context) {
    return of(context).style ?? (Theme.of(context).brightness == Brightness.dark ? GlassStyle.dark : GlassStyle.light);
  }

  @override
  Widget wrap(BuildContext context, Widget child) => GlassTheme(data: data, child: child);

  @override
  bool updateShouldNotify(GlassTheme oldWidget) => data != oldWidget.data;
}

/// The settings a glass surface paints with, after the theme, the platform
/// accessibility flags and the surface's own overrides are combined.
@immutable
class ResolvedGlass {
  /// Creates resolved settings. [style] should already be sanitized.
  const ResolvedGlass({required this.style, required this.fidelity, required this.fallbackColor});

  /// Resolves the settings for a surface in [context].
  ///
  /// [style] and [fidelity] override the theme. With [GlassFidelity.auto] the
  /// result is [GlassFidelity.opaque] when [MediaQuery.highContrastOf] is
  /// true and [GlassFidelity.full] otherwise; [GlassFidelity.reduced] raises
  /// the tint opacity to [GlassThemeData.reducedTintOpacity].
  factory ResolvedGlass.of(BuildContext context, {GlassStyle? style, GlassFidelity? fidelity}) {
    final theme = GlassTheme.of(context);
    var effectiveStyle = (style ?? GlassTheme.styleOf(context)).sanitized();
    var effectiveFidelity = fidelity ?? theme.fidelity;
    if (effectiveFidelity == GlassFidelity.auto) {
      effectiveFidelity = MediaQuery.maybeHighContrastOf(context) ?? false ? GlassFidelity.opaque : GlassFidelity.full;
    }
    if (effectiveFidelity == GlassFidelity.reduced) {
      final floor = finiteClamp(theme.reducedTintOpacity, min: 0, max: 1, fallback: 1);
      if (effectiveStyle.tintOpacity < floor) {
        effectiveStyle = effectiveStyle.copyWith(tintOpacity: floor);
      }
    }
    return ResolvedGlass(
      style: effectiveStyle,
      fidelity: effectiveFidelity,
      fallbackColor: theme.fallbackColor ?? Theme.of(context).colorScheme.surface,
    );
  }

  /// The sanitized style to paint.
  final GlassStyle style;

  /// [GlassFidelity.full], [GlassFidelity.reduced] or [GlassFidelity.opaque];
  /// never [GlassFidelity.auto].
  final GlassFidelity fidelity;

  /// The solid color behind an opaque surface.
  final Color fallbackColor;

  /// Whether the backdrop is read and blurred.
  bool get blursBackdrop => fidelity == GlassFidelity.full && style.blurSigma > 0;

  /// The color painted over the backdrop: the tint for translucent surfaces,
  /// or the tint composited over [fallbackColor] for opaque ones.
  Color get fillColor {
    final tint = style.effectiveTint;
    if (fidelity != GlassFidelity.opaque) {
      return tint;
    }
    return Color.alphaBlend(tint, fallbackColor.withValues(alpha: 1));
  }
}
