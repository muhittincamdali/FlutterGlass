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
