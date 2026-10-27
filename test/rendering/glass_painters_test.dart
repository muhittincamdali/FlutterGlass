import 'package:flutter/rendering.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass/src/rendering/glass_painters.dart';
import 'package:flutter_test/flutter_test.dart';

/// Applies a 4 × 5 color matrix to an opaque RGB color.
List<double> applyMatrix(List<double> m, List<double> rgb) {
  return [
    for (var row = 0; row < 3; row++)
      m[row * 5] * rgb[0] + m[row * 5 + 1] * rgb[1] + m[row * 5 + 2] * rgb[2] + m[row * 5 + 4],
  ];
}

void main() {
  const bounds = Rect.fromLTWH(0, 0, 100, 60);
  const radius = BorderRadius.all(Radius.circular(20));

  group('glassShapePath', () {
    test('cuts the corners for both corner styles', () {
      for (final corners in GlassCorners.values) {
        final path = glassShapePath(bounds, radius, corners);
        expect(path.contains(const Offset(50, 30)), isTrue, reason: '$corners center');
        expect(path.contains(const Offset(1, 1)), isFalse, reason: '$corners corner');
        // Flutter 3.41 approximates the superellipse a tenth of a pixel wide.
        final shapeBounds = path.getBounds();
        expect(bounds.inflate(0.5).contains(shapeBounds.topLeft), isTrue);
        expect(bounds.inflate(0.5).contains(shapeBounds.bottomRight), isTrue);
        expect(shapeBounds.width, closeTo(bounds.width, 0.5));
      }
    });
  });

  test('glassShadowClip keeps the outside and removes the shape', () {
    final shape = glassShapePath(bounds, radius, GlassCorners.continuous);
    final clip = glassShadowClip(bounds, shape);
    expect(clip.contains(const Offset(50, 30)), isFalse);
    expect(clip.contains(const Offset(50, 80)), isTrue);
    expect(clip.contains(const Offset(1, 1)), isTrue, reason: 'the cut corner may show the shadow');
  });

  group('glassSaturationMatrix', () {
    test('is the identity at 1', () {
      expect(applyMatrix(glassSaturationMatrix(1), [0.2, 0.5, 0.9]), [
        closeTo(0.2, 1e-12),
        closeTo(0.5, 1e-12),
        closeTo(0.9, 1e-12),
      ]);
    });

    test('maps colors to their luminance at 0', () {
      final gray = applyMatrix(glassSaturationMatrix(0), [1, 0, 0]);
      expect(gray, everyElement(closeTo(0.2126, 1e-12)));
    });

    test('keeps grays unchanged at any factor', () {
      expect(applyMatrix(glassSaturationMatrix(2.5), [0.4, 0.4, 0.4]), everyElement(closeTo(0.4, 1e-12)));
    });
  });

  test('painters repaint only when their inputs change', () {
    const shadow = GlassShadowPainter(shadows: [BoxShadow()], radius: radius, corners: GlassCorners.continuous);
    expect(shadow.shouldRepaint(shadow), isFalse);
    expect(
      shadow.shouldRepaint(
        const GlassShadowPainter(shadows: [BoxShadow(blurRadius: 3)], radius: radius, corners: GlassCorners.continuous),
      ),
      isTrue,
    );
    const fill = GlassFillPainter(
      fill: Color(0x33FFFFFF),
      rimColor: Color(0xFFFFFFFF),
      borderWidth: 1,
      borderOpacity: 0.5,
      radius: radius,
      corners: GlassCorners.continuous,
      textDirection: TextDirection.ltr,
    );
    expect(fill.shouldRepaint(fill), isFalse);
    expect(
      fill.shouldRepaint(
        const GlassFillPainter(
          fill: Color(0x33FFFFFF),
          rimColor: Color(0xFFFFFFFF),
          borderWidth: 1,
          borderOpacity: 0.5,
          radius: radius,
          corners: GlassCorners.continuous,
          textDirection: TextDirection.rtl,
        ),
      ),
      isTrue,
    );
  });

  group('painting', () {
    const fill = GlassFillPainter(
      fill: Color(0x33FFFFFF),
      rimColor: Color(0xFFFFFFFF),
      borderWidth: 2,
      borderOpacity: 0.5,
      radius: radius,
      corners: GlassCorners.circular,
      textDirection: TextDirection.ltr,
    );
    const shadow = GlassShadowPainter(
      shadows: [BoxShadow(blurRadius: 4)],
      radius: radius,
      corners: GlassCorners.circular,
    );

    test('the fill painter draws the tint, then a stroked rim', () {
      expect(
        (Canvas canvas) => fill.paint(canvas, bounds.size),
        paints
          ..path(color: const Color(0x33FFFFFF), style: PaintingStyle.fill)
          ..path(style: PaintingStyle.stroke, strokeWidth: 2),
      );
    });

    test('the shadow painter clips out the shape before drawing', () {
      expect(
        (Canvas canvas) => shadow.paint(canvas, bounds.size),
        paints
          ..save()
          ..clipPath(pathMatcher: isA<Path>().having((p) => p.contains(const Offset(50, 30)), 'contains center', false))
          ..path()
          ..restore(),
      );
    });

    test('nothing is drawn for an empty size', () {
      expect((Canvas canvas) => fill.paint(canvas, Size.zero), paintsNothing);
      expect((Canvas canvas) => shadow.paint(canvas, Size.zero), paintsNothing);
    });

    test('no rim is drawn without width or opacity', () {
      final noRim = GlassFillPainter(
        fill: fill.fill,
        rimColor: fill.rimColor,
        borderWidth: 0,
        borderOpacity: 0.5,
        radius: radius,
        corners: GlassCorners.circular,
        textDirection: TextDirection.ltr,
      );
      expect((Canvas canvas) => noRim.paint(canvas, bounds.size), paintsExactlyCountTimes(#drawPath, 1));
    });
  });
}
