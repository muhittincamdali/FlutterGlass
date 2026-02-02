import 'package:flutter/material.dart';

/// Holds all configuration values for the glass design system.
class GlassThemeData {
  /// The sigma value for the gaussian blur effect.
  final double blurSigma;

  /// The tint color applied over the blurred backdrop.
  final Color tintColor;

  /// The opacity of the tint overlay.
  final double tintOpacity;

  /// The border radius applied to glass surfaces.
  final BorderRadius borderRadius;

  /// The color of the subtle border drawn on glass edges.
  final Color borderColor;

  /// The width of the glass border.
  final double borderWidth;

  /// Shadow elevation for glass surfaces.
  final double elevation;

  /// Shadow color.
  final Color shadowColor;

  /// Background saturation multiplier for the blur.
  final double saturation;

  /// Creates a [GlassThemeData] with sensible defaults.
  const GlassThemeData({
    this.blurSigma = 20.0,
    this.tintColor = const Color(0x1AFFFFFF),
    this.tintOpacity = 0.1,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.borderColor = const Color(0x33FFFFFF),
    this.borderWidth = 1.0,
    this.elevation = 0.0,
    this.shadowColor = const Color(0x40000000),
    this.saturation = 1.0,
  });

  /// Creates a copy of this theme with the given fields replaced.
  GlassThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    double? tintOpacity,
    BorderRadius? borderRadius,
    Color? borderColor,
    double? borderWidth,
    double? elevation,
    Color? shadowColor,
    double? saturation,
  }) {
    return GlassThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      tintOpacity: tintOpacity ?? this.tintOpacity,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      saturation: saturation ?? this.saturation,
    );
  }

  /// Linearly interpolates between two [GlassThemeData] instances.
  static GlassThemeData lerp(
    GlassThemeData a,
    GlassThemeData b,
    double t,
  ) {
    return GlassThemeData(
      blurSigma: _lerpDouble(a.blurSigma, b.blurSigma, t),
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      tintOpacity: _lerpDouble(a.tintOpacity, b.tintOpacity, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ??
          a.borderRadius,
      borderColor:
          Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth: _lerpDouble(a.borderWidth, b.borderWidth, t),
      elevation: _lerpDouble(a.elevation, b.elevation, t),
      shadowColor:
          Color.lerp(a.shadowColor, b.shadowColor, t) ?? a.shadowColor,
      saturation: _lerpDouble(a.saturation, b.saturation, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlassThemeData &&
        other.blurSigma == blurSigma &&
        other.tintColor == tintColor &&
        other.tintOpacity == tintOpacity &&
        other.borderRadius == borderRadius &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth &&
        other.elevation == elevation &&
        other.shadowColor == shadowColor &&
        other.saturation == saturation;
  }

  @override
  int get hashCode => Object.hash(
        blurSigma,
        tintColor,
        tintOpacity,
        borderRadius,
        borderColor,
        borderWidth,
        elevation,
        shadowColor,
        saturation,
      );
}

/// An inherited widget that provides [GlassThemeData] to its descendants.
///
/// Wrap your app or a subtree with [GlassTheme] to configure the default
/// look of all glass widgets below it.
class GlassTheme extends InheritedWidget {
  /// The theme data for glass widgets.
  final GlassThemeData data;

  /// Creates a [GlassTheme] that provides [data] to all descendants.
  const GlassTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Returns the closest [GlassThemeData] above the given [context].
  ///
  /// If no [GlassTheme] is found, returns a default [GlassThemeData].
  static GlassThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<GlassTheme>();
    return widget?.data ?? const GlassThemeData();
  }

  /// Returns the [GlassThemeData] without registering a dependency.
  static GlassThemeData? maybeOf(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<GlassTheme>()?.widget
            as GlassTheme?;
    return widget?.data;
  }

  @override
  bool updateShouldNotify(GlassTheme oldWidget) => data != oldWidget.data;
}
