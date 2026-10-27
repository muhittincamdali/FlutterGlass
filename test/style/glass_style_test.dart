import 'package:flutter/painting.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass/src/style/sanitize.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('finiteClamp', () {
    test('maps NaN to the fallback and infinities to the bounds', () {
      expect(finiteClamp(double.nan, min: 0, max: 10, fallback: 3), 3);
      expect(finiteClamp(double.infinity, min: 0, max: 10, fallback: 3), 10);
      expect(finiteClamp(double.negativeInfinity, min: 0, max: 10, fallback: 3), 0);
    });

    test('keeps a fallback that lies outside the range inside it', () {
      expect(finiteClamp(double.nan, min: 0, max: 1, fallback: 5), 1);
    });
  });

  group('GlassStyle.sanitized', () {
    test('turns NaN, infinite and negative numbers into painted values', () {
      const style = GlassStyle(
        blurSigma: double.nan,
        tintOpacity: double.infinity,
        saturation: double.nan,
        borderWidth: double.infinity,
        borderOpacity: -3,
      );
      final clean = style.sanitized();
      expect(clean.blurSigma, 0);
      expect(clean.tintOpacity, 1);
      expect(clean.saturation, 1);
      expect(clean.borderWidth, GlassStyle.maxBorderWidth);
      expect(clean.borderOpacity, 0);
    });

    test('caps the blur so a huge sigma cannot reach the GPU', () {
      expect(const GlassStyle(blurSigma: 1e9).sanitized().blurSigma, GlassStyle.maxBlurSigma);
      expect(const GlassStyle(blurSigma: -1).sanitized().blurSigma, 0);
    });

    test('keeps the first shadows only and cleans their numbers', () {
      final shadows = List.generate(
        10,
        (i) => BoxShadow(blurRadius: i == 0 ? 1e9 : 4, offset: Offset(double.infinity, i.toDouble())),
      );
      final clean = GlassStyle(shadows: shadows).sanitized();
      expect(clean.shadows, hasLength(GlassStyle.maxShadows));
      expect(clean.shadows.first.blurRadius, 100);
      expect(clean.shadows.first.offset, const Offset(200, 0));
      expect(clean.shadows[3].offset.dy, 3);
    });

    test('leaves a valid style unchanged', () {
      expect(GlassStyle.light.sanitized(), GlassStyle.light);
      expect(GlassStyle.dark.sanitized(), GlassStyle.dark);
    });
  });

  group('GlassStyle.resolveRadius', () {
    test('cleans NaN and infinite radii', () {
      const style = GlassStyle(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(double.nan),
          bottomRight: Radius.circular(double.infinity),
        ),
      );
      final radius = style.resolveRadius(TextDirection.ltr);
      expect(radius.topLeft, Radius.zero);
      expect(radius.bottomRight, const Radius.circular(GlassStyle.maxCornerRadius));
    });

    test('resolves directional radii for right-to-left text', () {
      const style = GlassStyle(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(12)));
      expect(style.resolveRadius(TextDirection.rtl).topRight, const Radius.circular(12));
      expect(style.resolveRadius(TextDirection.rtl).topLeft, Radius.zero);
    });
  });

  test('effectiveTint multiplies the tint alpha by tintOpacity', () {
    const style = GlassStyle(tint: Color(0x80FF0000), tintOpacity: 0.5);
    expect(style.effectiveTint.a, closeTo(0.251, 0.002));
    expect(style.effectiveTint.r, 1);
  });

  group('GlassStyle.lerp', () {
    const a = GlassStyle(blurSigma: 0, tintOpacity: 0, borderRadius: BorderRadius.zero);
    const b = GlassStyle(
      blurSigma: 20,
      tintOpacity: 1,
      borderRadius: BorderRadius.all(Radius.circular(40)),
      corners: GlassCorners.circular,
    );

    test('returns the ends at 0 and 1', () {
      expect(GlassStyle.lerp(a, b, 0), a);
      expect(GlassStyle.lerp(a, b, 1), b);
    });

    test('interpolates numbers and switches enums at the midpoint', () {
      final mid = GlassStyle.lerp(a, b, 0.5)!;
      expect(mid.blurSigma, 10);
      expect(mid.tintOpacity, 0.5);
      expect(mid.borderRadius, const BorderRadius.all(Radius.circular(20)));
      expect(GlassStyle.lerp(a, b, 0.49)!.corners, GlassCorners.continuous);
      expect(mid.corners, GlassCorners.circular);
    });

    test('treats a NaN t as 0 instead of producing NaN values', () {
      final result = GlassStyle.lerp(a, b, double.nan)!;
      expect(result.blurSigma, 0);
      expect(result.tintOpacity, 0);
    });

    test('fades in from null', () {
      final half = GlassStyle.lerp(null, b, 0.5)!;
      expect(half.tintOpacity, 0.5);
      expect(half.blurSigma, 10);
      expect(GlassStyle.lerp(null, null, 0.5), isNull);
    });
  });

  test('equality and hashCode cover every field', () {
    expect(const GlassStyle(), GlassStyle.light);
    expect(const GlassStyle().hashCode, GlassStyle.light.hashCode);
    expect(GlassStyle.light.copyWith(boundedBlur: false), isNot(GlassStyle.light));
    expect(GlassStyle.light.copyWith(shadows: const []), isNot(GlassStyle.light));
    expect(GlassStyle.light.copyWith(rimColor: const Color(0xFF000000)), isNot(GlassStyle.light));
  });

  test('copyWith replaces only the given fields', () {
    final copy = GlassStyle.dark.copyWith(blurSigma: 3);
    expect(copy.blurSigma, 3);
    expect(copy.tint, GlassStyle.dark.tint);
    expect(copy.shadows, GlassStyle.dark.shadows);
  });
}
