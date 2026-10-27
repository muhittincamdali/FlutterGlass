import 'package:flutter/painting.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_test/flutter_test.dart';

const white = Color(0xFFFFFFFF);
const black = Color(0xFF000000);

void main() {
  test('relativeLuminance uses the linear segment for very dark channels', () {
    expect(GlassContrast.relativeLuminance(black), 0);
    expect(GlassContrast.relativeLuminance(white), closeTo(1, 1e-12));
    // 10/255 lies below the 0.04045 knee of the sRGB curve.
    expect(GlassContrast.relativeLuminance(const Color(0xFF0A0A0A)), closeTo(10 / 255 / 12.92, 1e-12));
    expect(GlassContrast.relativeLuminance(const Color(0xFF00FF00)), closeTo(0.7152, 1e-12));
  });

  group('contrastRatio', () {
    test('matches the WCAG reference values', () {
      expect(GlassContrast.contrastRatio(black, white), closeTo(21, 1e-9));
      expect(GlassContrast.contrastRatio(white, white), 1);
      // #767676 is the lightest gray that passes AA on white: 4.54:1.
      expect(GlassContrast.contrastRatio(const Color(0xFF767676), white), closeTo(4.54, 0.01));
    });

    test('composites a translucent foreground over the background', () {
      final halfBlack = black.withValues(alpha: 0.5);
      final ratio = GlassContrast.contrastRatio(halfBlack, white);
      expect(ratio, GlassContrast.contrastRatio(Color.alphaBlend(halfBlack, white), white));
      expect(ratio, lessThan(21));
    });
  });

  group('minimumTintOpacity', () {
    test('finds the first 8-bit alpha that reaches the target', () {
      final alpha = GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [white])!;
      double ratioAt(double a) =>
          GlassContrast.contrastRatio(white, Color.alphaBlend(black.withValues(alpha: a), white));
      expect(ratioAt(alpha), greaterThanOrEqualTo(GlassContrast.aa));
      expect(ratioAt(alpha - 1 / 255), lessThan(GlassContrast.aa));
      expect(alpha, closeTo(0.53, 0.01));
    });

    test('takes the worst color of the backdrop', () {
      final light = GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [white])!;
      final mixed = GlassContrast.minimumTintOpacity(
        foreground: white,
        tint: black,
        backdrop: [const Color(0xFF1E3A8A), white, const Color(0xFF64D2FF)],
      )!;
      expect(mixed, light);
    });

    test('returns 0 when the backdrop alone is readable', () {
      expect(GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [black]), 0);
      expect(GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [white], targetRatio: 1), 0);
    });

    test('returns null when no opacity is enough', () {
      expect(GlassContrast.minimumTintOpacity(foreground: white, tint: white, backdrop: [white]), isNull);
    });

    test('ignores the alpha of the tint', () {
      expect(
        GlassContrast.minimumTintOpacity(foreground: white, tint: black.withValues(alpha: 0.1), backdrop: [white]),
        GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [white]),
      );
    });

    test('rejects an empty or oversized backdrop and impossible targets', () {
      expect(
        () => GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: const []),
        throwsArgumentError,
      );
      expect(
        () => GlassContrast.minimumTintOpacity(
          foreground: white,
          tint: black,
          backdrop: List.filled(GlassContrast.maxBackdropSamples + 1, white),
        ),
        throwsArgumentError,
      );
      for (final target in [double.nan, 0.5, 21.5, double.infinity]) {
        expect(
          () =>
              GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [white], targetRatio: target),
          throwsArgumentError,
          reason: 'target $target',
        );
      }
    });

    test('accepts the largest allowed backdrop', () {
      final backdrop = List.filled(GlassContrast.maxBackdropSamples, white);
      expect(GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: backdrop), isNotNull);
    });
  });

  group('legibleStyle', () {
    final needed = GlassContrast.minimumTintOpacity(foreground: white, tint: black, backdrop: [white])!;

    test('raises a weak tint to the minimum', () {
      const style = GlassStyle(tint: black, tintOpacity: 0.1);
      final legible = GlassContrast.legibleStyle(style, foreground: white, backdrop: [white]);
      expect(legible.tintOpacity, needed);
      expect(legible.copyWith(tintOpacity: 0.1), style);
    });

    test('never lowers a tint that is already strong enough', () {
      const style = GlassStyle(tint: black, tintOpacity: 0.9);
      expect(GlassContrast.legibleStyle(style, foreground: white, backdrop: [white]), same(style));
    });

    test('scales up for a tint that is itself translucent', () {
      final style = GlassStyle(tint: black.withValues(alpha: 0.8), tintOpacity: 0);
      final legible = GlassContrast.legibleStyle(style, foreground: white, backdrop: [white]);
      expect(legible.tintOpacity, closeTo(needed / 0.8, 1e-9));
      expect(legible.effectiveTint.a, closeTo(needed, 1e-6));
    });

    test('makes the tint opaque when the target is out of reach', () {
      const style = GlassStyle(tintOpacity: 0.3);
      expect(GlassContrast.legibleStyle(style, foreground: white, backdrop: [white]).tintOpacity, 1);
    });
  });
}
