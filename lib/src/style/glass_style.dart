import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'sanitize.dart';

/// How the corners of a glass surface are drawn.
enum GlassCorners {
  /// Circular arcs, as drawn by [RRect] and [ClipRRect].
  circular,

  /// Continuous corners (a rounded superellipse), the shape iOS uses for
  /// sheets, buttons and app icons. Drawn with [ClipRSuperellipse].
  continuous,
}

/// The look of a piece of glass: blur, tint, rim, corners and shadow.
///
/// A [GlassStyle] is an immutable value. Any number is accepted, and
/// [sanitized] maps it into the supported range before anything is painted:
/// NaN, infinite and negative values cannot reach the engine. The ranges are
/// the `max…` constants below.
@immutable
class GlassStyle with Diagnosticable {
  /// Creates a glass style. The defaults are the light preset, [light].
  const GlassStyle({
    this.blurSigma = 16,
    this.tint = const Color(0xFFFFFFFF),
    this.tintOpacity = 0.2,
    this.saturation = 1.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(22)),
    this.corners = GlassCorners.continuous,
    this.borderWidth = 1,
    this.rimColor = const Color(0xFFFFFFFF),
    this.borderOpacity = 0.55,
    this.shadows = const [BoxShadow(color: Color(0x1F000000), blurRadius: 24, offset: Offset(0, 8))],
  });

  /// Light glass for content over bright or colorful backgrounds.
  static const GlassStyle light = GlassStyle();

  /// Dark glass for dark themes: a near-black tint and a softer rim.
  static const GlassStyle dark = GlassStyle(
    tint: Color(0xFF0E1621),
    tintOpacity: 0.38,
    saturation: 1.6,
    borderOpacity: 0.2,
    shadows: [BoxShadow(color: Color(0x40000000), blurRadius: 28, offset: Offset(0, 10))],
  );

  /// Barely tinted glass with a light blur, for overlays that should keep the
  /// background readable.
  static const GlassStyle clear = GlassStyle(blurSigma: 6, tintOpacity: 0.06, saturation: 1.2, borderOpacity: 0.4);

  /// Heavily frosted glass for text-heavy panels.
  static const GlassStyle frosted = GlassStyle(blurSigma: 30, tintOpacity: 0.34, saturation: 1.8, borderOpacity: 0.65);

  /// The largest blur sigma painted. Larger kernels cost GPU time for no
  /// visible difference.
  static const double maxBlurSigma = 64;

  /// The largest saturation factor painted (1 leaves colors unchanged).
  static const double maxSaturation = 3;

  /// The widest rim painted, in logical pixels.
  static const double maxBorderWidth = 8;

  /// The largest corner radius painted, in logical pixels.
  static const double maxCornerRadius = 1000;

  /// The number of [shadows] painted; later entries are ignored.
  static const int maxShadows = 4;

  /// Standard deviation of the Gaussian blur applied to the backdrop, in
  /// logical pixels. 0 turns the blur off.
  final double blurSigma;

  /// The color laid over the blurred backdrop.
  final Color tint;

  /// Opacity of [tint], from 0 (no tint) to 1 (opaque). It multiplies the
  /// alpha of [tint] itself.
  final double tintOpacity;

  /// Saturation applied to the blurred backdrop: 0 is grayscale, 1 leaves it
  /// unchanged, values above 1 make colors behind the glass more vivid.
  final double saturation;

  /// The radius of each corner.
  final BorderRadiusGeometry borderRadius;

  /// Whether corners are circular or continuous.
  final GlassCorners corners;

  /// Width of the rim drawn inside the edge. 0 draws no rim.
  final double borderWidth;

  /// Color of the rim light.
  final Color rimColor;

  /// Opacity of the rim at its brightest point, the top-leading corner. The
  /// rim fades to a quarter of it at the opposite corner.
  final double borderOpacity;

  /// Shadows painted outside the shape only, so they never darken the glass.
  final List<BoxShadow> shadows;

  /// The tint with [tintOpacity] applied, as painted over the backdrop. The
  /// tint and the opacity are mapped into range here too, so a NaN never
  /// reaches a color.
  Color get effectiveTint {
    final cleanTint = finiteColor(tint);
    return cleanTint.withValues(alpha: cleanTint.a * finiteClamp(tintOpacity, min: 0, max: 1, fallback: 0));
  }

  /// A copy of this style with every value mapped into its supported range.
  ///
  /// NaN maps to the default for the field, infinity to the nearest bound,
  /// and only the first [maxShadows] shadows are kept. The channels of
  /// [tint], [rimColor] and the shadow colors are cleaned the same way: a
  /// NaN alpha becomes 0.
  GlassStyle sanitized() {
    return GlassStyle(
      blurSigma: finiteClamp(blurSigma, min: 0, max: maxBlurSigma, fallback: 0),
      tint: finiteColor(tint),
      tintOpacity: finiteClamp(tintOpacity, min: 0, max: 1, fallback: 0),
      saturation: finiteClamp(saturation, min: 0, max: maxSaturation, fallback: 1),
      borderRadius: borderRadius,
      corners: corners,
      borderWidth: finiteClamp(borderWidth, min: 0, max: maxBorderWidth, fallback: 0),
      rimColor: finiteColor(rimColor),
      borderOpacity: finiteClamp(borderOpacity, min: 0, max: 1, fallback: 0),
      shadows: [for (final shadow in shadows.take(maxShadows)) _sanitizeShadow(shadow)],
    );
  }

  /// Resolves [borderRadius] for [direction] with every radius finite and
  /// between 0 and [maxCornerRadius].
  BorderRadius resolveRadius(TextDirection direction) {
    final radius = borderRadius.resolve(direction);
    Radius clean(Radius r) => Radius.elliptical(
      finiteClamp(r.x, min: 0, max: maxCornerRadius, fallback: 0),
      finiteClamp(r.y, min: 0, max: maxCornerRadius, fallback: 0),
    );
    return BorderRadius.only(
      topLeft: clean(radius.topLeft),
      topRight: clean(radius.topRight),
      bottomLeft: clean(radius.bottomLeft),
      bottomRight: clean(radius.bottomRight),
    );
  }

  /// Returns a copy of this style with the given fields replaced.
  GlassStyle copyWith({
    double? blurSigma,
    Color? tint,
    double? tintOpacity,
    double? saturation,
    BorderRadiusGeometry? borderRadius,
    GlassCorners? corners,
    double? borderWidth,
    Color? rimColor,
    double? borderOpacity,
    List<BoxShadow>? shadows,
  }) {
    return GlassStyle(
      blurSigma: blurSigma ?? this.blurSigma,
      tint: tint ?? this.tint,
      tintOpacity: tintOpacity ?? this.tintOpacity,
      saturation: saturation ?? this.saturation,
      borderRadius: borderRadius ?? this.borderRadius,
      corners: corners ?? this.corners,
      borderWidth: borderWidth ?? this.borderWidth,
      rimColor: rimColor ?? this.rimColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      shadows: shadows ?? this.shadows,
    );
  }

  /// Interpolates between two styles. A non-finite [t] (NaN or infinity) is
  /// treated as 0.
  ///
  /// Values outside 0–1 extrapolate, as curves such as `Curves.elasticOut`
  /// require; [sanitized] brings the result back into range when painted.
  /// Shadows are the exception: they are interpolated with [t] clamped to
  /// 0–1, because [BoxShadow] rejects the negative blur radius an
  /// extrapolated shadow would get.
  static GlassStyle? lerp(GlassStyle? a, GlassStyle? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    final safeT = t.isFinite ? t : 0.0;
    final shadowT = safeT.clamp(0.0, 1.0);
    final from = a ?? b!.copyWith(tintOpacity: 0, borderOpacity: 0, blurSigma: 0, shadows: const []);
    final to = b ?? a!.copyWith(tintOpacity: 0, borderOpacity: 0, blurSigma: 0, shadows: const []);
    double mix(double x, double y) => lerpDouble(x, y, safeT)!;
    return GlassStyle(
      blurSigma: mix(from.blurSigma, to.blurSigma),
      tint: Color.lerp(from.tint, to.tint, safeT)!,
      tintOpacity: mix(from.tintOpacity, to.tintOpacity),
      saturation: mix(from.saturation, to.saturation),
      borderRadius: BorderRadiusGeometry.lerp(from.borderRadius, to.borderRadius, safeT)!,
      corners: safeT < 0.5 ? from.corners : to.corners,
      borderWidth: mix(from.borderWidth, to.borderWidth),
      rimColor: Color.lerp(from.rimColor, to.rimColor, safeT)!,
      borderOpacity: mix(from.borderOpacity, to.borderOpacity),
      shadows: BoxShadow.lerpList(from.shadows, to.shadows, shadowT) ?? const [],
    );
  }

  static BoxShadow _sanitizeShadow(BoxShadow shadow) {
    double offset(double v) => finiteClamp(v, min: -200, max: 200, fallback: 0);
    return BoxShadow(
      color: finiteColor(shadow.color),
      offset: Offset(offset(shadow.offset.dx), offset(shadow.offset.dy)),
      blurRadius: finiteClamp(shadow.blurRadius, min: 0, max: 100, fallback: 0),
      spreadRadius: finiteClamp(shadow.spreadRadius, min: -100, max: 100, fallback: 0),
      blurStyle: shadow.blurStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GlassStyle &&
        other.blurSigma == blurSigma &&
        other.tint == tint &&
        other.tintOpacity == tintOpacity &&
        other.saturation == saturation &&
        other.borderRadius == borderRadius &&
        other.corners == corners &&
        other.borderWidth == borderWidth &&
        other.rimColor == rimColor &&
        other.borderOpacity == borderOpacity &&
        listEquals(other.shadows, shadows);
  }

  @override
  int get hashCode => Object.hash(
    blurSigma,
    tint,
    tintOpacity,
    saturation,
    borderRadius,
    corners,
    borderWidth,
    rimColor,
    borderOpacity,
    Object.hashAll(shadows),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('blurSigma', blurSigma))
      ..add(ColorProperty('tint', tint))
      ..add(DoubleProperty('tintOpacity', tintOpacity))
      ..add(DoubleProperty('saturation', saturation))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>('borderRadius', borderRadius))
      ..add(EnumProperty<GlassCorners>('corners', corners))
      ..add(DoubleProperty('borderWidth', borderWidth))
      ..add(ColorProperty('rimColor', rimColor))
      ..add(DoubleProperty('borderOpacity', borderOpacity))
      ..add(IterableProperty<BoxShadow>('shadows', shadows));
  }
}
