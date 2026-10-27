import 'dart:ui' show Color;

/// Clamps [value] into `[min, max]` and maps the values a clamp cannot order.
///
/// `double.clamp` returns NaN for NaN, and a NaN blur sigma or opacity reaches
/// the engine as an undefined filter. Infinity maps to the nearest bound and
/// NaN maps to [fallback], so whatever a slider, a lerp or a division produces,
/// the result is a finite number inside the range.
double finiteClamp(double value, {required double min, required double max, required double fallback}) {
  assert(min <= max, 'min must not be greater than max');
  if (value.isNaN) {
    return fallback.clamp(min, max);
  }
  return value.clamp(min, max);
}

/// [color] with every channel a finite number that a paint can use.
///
/// The alpha is clamped to 0–1, and a NaN alpha maps to 0, so a broken color
/// paints nothing. A NaN red, green or blue maps to 0 and an infinite one to
/// the nearest end of 0–1; finite channels are kept as they are, so extended sRGB
/// colors outside 0–1 survive.
Color finiteColor(Color color) {
  double channel(double value) => value.isFinite ? value : finiteClamp(value, min: 0, max: 1, fallback: 0);
  return Color.from(
    alpha: finiteClamp(color.a, min: 0, max: 1, fallback: 0),
    red: channel(color.r),
    green: channel(color.g),
    blue: channel(color.b),
    colorSpace: color.colorSpace,
  );
}
