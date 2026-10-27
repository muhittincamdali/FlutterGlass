import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass/src/rendering/glass_painters.dart';
import 'package:flutter_test/flutter_test.dart';

Widget host(Widget child, {MediaQueryData? mediaQuery, TextDirection direction = TextDirection.ltr}) {
  Widget body = Directionality(
    textDirection: direction,
    child: Center(child: child),
  );
  if (mediaQuery != null) {
    body = MediaQuery(data: mediaQuery, child: body);
  }
  return MaterialApp(home: Scaffold(body: body));
}

GlassFillPainter fillPainter(WidgetTester tester) {
  return tester
      .widgetList<CustomPaint>(find.byType(CustomPaint))
      .map((paint) => paint.painter)
      .whereType<GlassFillPainter>()
      .single;
}

void main() {
  testWidgets('full fidelity blurs and saturates the backdrop inside a continuous clip', (tester) async {
    await tester.pumpWidget(host(const GlassSurface(width: 200, height: 100)));
    final backdrop = tester.renderObject<RenderBackdropFilter>(find.byType(BackdropFilter));
    expect(
      backdrop.filterConfig,
      ImageFilterConfig.compose(
        outer: ImageFilterConfig(ColorFilter.matrix(glassSaturationMatrix(GlassStyle.light.saturation))),
        inner: ImageFilterConfig.blur(sigmaX: GlassStyle.light.blurSigma, sigmaY: GlassStyle.light.blurSigma),
      ),
    );
    expect(backdrop.backdropKey, isNull);
    expect(find.byType(ClipRSuperellipse), findsOneWidget);
    expect(tester.getSize(find.byType(GlassSurface)), const Size(200, 100));
  });

  testWidgets('a saturation of 1 blurs without a color filter', (tester) async {
    await tester.pumpWidget(host(const GlassSurface(style: GlassStyle(saturation: 1))));
    final backdrop = tester.renderObject<RenderBackdropFilter>(find.byType(BackdropFilter));
    expect(backdrop.filterConfig, const ImageFilterConfig.blur(sigmaX: 16, sigmaY: 16));
  });

  testWidgets('circular corners clip with a rounded rectangle', (tester) async {
    await tester.pumpWidget(host(const GlassSurface(style: GlassStyle(corners: GlassCorners.circular))));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(ClipRSuperellipse), findsNothing);
  });

  testWidgets('reduced and opaque glass never read the backdrop', (tester) async {
    for (final fidelity in [GlassFidelity.reduced, GlassFidelity.opaque]) {
      await tester.pumpWidget(host(GlassSurface(fidelity: fidelity, child: const Text('x'))));
      expect(find.byType(BackdropFilter), findsNothing, reason: '$fidelity');
    }
    expect(fillPainter(tester).fill.a, 1);
  });

  testWidgets('high contrast turns auto glass opaque', (tester) async {
    await tester.pumpWidget(host(const GlassSurface(), mediaQuery: const MediaQueryData(highContrast: true)));
    expect(find.byType(BackdropFilter), findsNothing);
    expect(fillPainter(tester).fill.a, 1);
  });

  testWidgets('NaN and infinite style values render without errors', (tester) async {
    await tester.pumpWidget(
      host(
        const GlassSurface(
          width: 120,
          height: 80,
          style: GlassStyle(
            blurSigma: double.nan,
            tintOpacity: double.infinity,
            borderWidth: double.nan,
            borderRadius: BorderRadius.all(Radius.circular(double.infinity)),
            shadows: [BoxShadow(blurRadius: double.infinity, spreadRadius: double.infinity)],
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(BackdropFilter), findsNothing);
    final painter = fillPainter(tester);
    expect(painter.fill.a, 1);
    expect(painter.borderWidth, 0);
  });

  testWidgets('surfaces inside a GlassGroup share its backdrop key', (tester) async {
    await tester.pumpWidget(
      host(const GlassGroup(child: Column(children: [GlassSurface(height: 40), GlassSurface(height: 40)]))),
    );
    final keys = tester
        .renderObjectList<RenderBackdropFilter>(find.byType(BackdropFilter))
        .map((render) => render.backdropKey)
        .toList();
    expect(keys, hasLength(2));
    expect(keys.first, isNotNull);
    expect(keys.first, same(keys.last));
  });

  testWidgets('the rim follows the text direction', (tester) async {
    await tester.pumpWidget(host(const GlassSurface(), direction: TextDirection.rtl));
    expect(fillPainter(tester).textDirection, TextDirection.rtl);
  });

  testWidgets('shadows are painted only when the style has some', (tester) async {
    bool hasShadowPainter() =>
        tester.widgetList<CustomPaint>(find.byType(CustomPaint)).any((paint) => paint.painter is GlassShadowPainter);
    await tester.pumpWidget(host(const GlassSurface()));
    expect(hasShadowPainter(), isTrue);
    await tester.pumpWidget(host(const GlassSurface(style: GlassStyle(shadows: []))));
    expect(hasShadowPainter(), isFalse);
  });

  testWidgets('padding and alignment place the child', (tester) async {
    await tester.pumpWidget(
      host(
        const GlassSurface(
          width: 200,
          height: 100,
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
          child: SizedBox(key: Key('child'), width: 20, height: 20),
        ),
      ),
    );
    final surface = tester.getRect(find.byType(GlassSurface));
    final child = tester.getRect(find.byKey(const Key('child')));
    expect(child.bottomRight, surface.bottomRight - const Offset(10, 10));
  });

  group('AnimatedGlassSurface', () {
    Widget animated(double opacity, {MediaQueryData? mediaQuery}) => host(
      AnimatedGlassSurface(
        duration: const Duration(milliseconds: 200),
        style: GlassStyle(tintOpacity: opacity, tint: const Color(0xFF000000)),
      ),
      mediaQuery: mediaQuery,
    );

    testWidgets('animates the tint to the new style', (tester) async {
      await tester.pumpWidget(animated(0));
      await tester.pumpWidget(animated(1));
      await tester.pump(const Duration(milliseconds: 100));
      expect(fillPainter(tester).fill.a, closeTo(0.5, 0.01));
      await tester.pumpAndSettle();
      expect(fillPainter(tester).fill.a, 1);
    });

    testWidgets('jumps to the new style when motion is reduced', (tester) async {
      const reduceMotion = MediaQueryData(disableAnimations: true);
      await tester.pumpWidget(animated(0, mediaQuery: reduceMotion));
      await tester.pumpWidget(animated(1, mediaQuery: reduceMotion));
      await tester.pump();
      expect(fillPainter(tester).fill.a, 1);
    });
  });

  test('GlassStyleTween uses GlassStyle.lerp', () {
    final tween = GlassStyleTween(begin: GlassStyle.light, end: GlassStyle.dark);
    expect(tween.transform(0.3), GlassStyle.lerp(GlassStyle.light, GlassStyle.dark, 0.3));
  });
}
