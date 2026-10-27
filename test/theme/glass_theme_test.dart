import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_test/flutter_test.dart';

/// Pumps [probe] inside a MaterialApp and returns what it captured.
Future<T> capture<T>(
  WidgetTester tester,
  T Function(BuildContext context) probe, {
  ThemeData? theme,
  MediaQueryData? mediaQuery,
  GlassThemeData? glassTheme,
}) async {
  late T value;
  Widget child = Builder(
    builder: (context) {
      value = probe(context);
      return const SizedBox();
    },
  );
  if (glassTheme != null) {
    child = GlassTheme(data: glassTheme, child: child);
  }
  if (mediaQuery != null) {
    child = MediaQuery(data: mediaQuery, child: child);
  }
  await tester.pumpWidget(MaterialApp(theme: theme, home: child));
  // MaterialApp animates between themes; let it reach the new one.
  await tester.pumpAndSettle();
  return value;
}

void main() {
  group('GlassTheme.of', () {
    testWidgets('falls back to the defaults', (tester) async {
      expect(await capture(tester, GlassTheme.of), const GlassThemeData());
    });

    testWidgets('reads the ThemeData extension', (tester) async {
      const data = GlassThemeData(fidelity: GlassFidelity.reduced);
      final theme = ThemeData(extensions: const [data]);
      expect(await capture(tester, GlassTheme.of, theme: theme), data);
    });

    testWidgets('prefers the nearest GlassTheme over the extension', (tester) async {
      const local = GlassThemeData(fidelity: GlassFidelity.opaque);
      final theme = ThemeData(extensions: const [GlassThemeData(fidelity: GlassFidelity.reduced)]);
      expect(await capture(tester, GlassTheme.of, theme: theme, glassTheme: local), local);
    });
  });

  group('GlassTheme.styleOf', () {
    testWidgets('follows the theme brightness', (tester) async {
      expect(await capture(tester, GlassTheme.styleOf), GlassStyle.light);
      expect(await capture(tester, GlassTheme.styleOf, theme: ThemeData(brightness: Brightness.dark)), GlassStyle.dark);
    });

    testWidgets('uses the theme style when one is set', (tester) async {
      expect(
        await capture(tester, GlassTheme.styleOf, glassTheme: const GlassThemeData(style: GlassStyle.frosted)),
        GlassStyle.frosted,
      );
    });
  });

  group('ResolvedGlass', () {
    testWidgets('auto draws full glass by default', (tester) async {
      final resolved = await capture(tester, ResolvedGlass.of);
      expect(resolved.fidelity, GlassFidelity.full);
      expect(resolved.blursBackdrop, isTrue);
      expect(resolved.fillColor, GlassStyle.light.effectiveTint);
    });

    testWidgets('auto turns opaque when the platform asks for more contrast', (tester) async {
      final resolved = await capture(tester, ResolvedGlass.of, mediaQuery: const MediaQueryData(highContrast: true));
      expect(resolved.fidelity, GlassFidelity.opaque);
      expect(resolved.blursBackdrop, isFalse);
      expect(resolved.fillColor.a, 1);
    });

    testWidgets('an explicit fidelity wins over high contrast and the theme', (tester) async {
      final resolved = await capture(
        tester,
        (context) => ResolvedGlass.of(context, fidelity: GlassFidelity.full),
        mediaQuery: const MediaQueryData(highContrast: true),
        glassTheme: const GlassThemeData(fidelity: GlassFidelity.reduced),
      );
      expect(resolved.fidelity, GlassFidelity.full);
    });

    testWidgets('opaque composites the tint over the fallback color', (tester) async {
      const fallback = Color(0xFF102030);
      final resolved = await capture(
        tester,
        (context) => ResolvedGlass.of(context, style: GlassStyle.light),
        glassTheme: const GlassThemeData(fidelity: GlassFidelity.opaque, fallbackColor: fallback),
      );
      expect(resolved.fillColor, Color.alphaBlend(GlassStyle.light.effectiveTint, fallback));
    });

    testWidgets('reduced raises the tint to the floor without blurring', (tester) async {
      final resolved = await capture(tester, (context) => ResolvedGlass.of(context, fidelity: GlassFidelity.reduced));
      expect(resolved.style.tintOpacity, 0.82);
      expect(resolved.blursBackdrop, isFalse);
      expect(resolved.fillColor.a, lessThan(1));
    });

    testWidgets('reduced keeps a tint that is already above the floor', (tester) async {
      final resolved = await capture(
        tester,
        (context) =>
            ResolvedGlass.of(context, style: const GlassStyle(tintOpacity: 0.95), fidelity: GlassFidelity.reduced),
      );
      expect(resolved.style.tintOpacity, 0.95);
    });

    testWidgets('a NaN reduced floor makes reduced glass opaque in tint', (tester) async {
      final resolved = await capture(
        tester,
        (context) => ResolvedGlass.of(context, fidelity: GlassFidelity.reduced),
        glassTheme: const GlassThemeData(reducedTintOpacity: double.nan),
      );
      expect(resolved.style.tintOpacity, 1);
    });

    testWidgets('a zero blur skips the backdrop read', (tester) async {
      final resolved = await capture(
        tester,
        (context) => ResolvedGlass.of(context, style: const GlassStyle(blurSigma: double.nan)),
      );
      expect(resolved.fidelity, GlassFidelity.full);
      expect(resolved.blursBackdrop, isFalse);
    });
  });

  group('GlassThemeData', () {
    test('lerp interpolates styles and switches fidelity at the midpoint', () {
      const a = GlassThemeData(style: GlassStyle.light, reducedTintOpacity: 0.6);
      const b = GlassThemeData(style: GlassStyle.dark, fidelity: GlassFidelity.reduced, reducedTintOpacity: 1);
      final mid = a.lerp(b, 0.5);
      expect(mid.style, GlassStyle.lerp(GlassStyle.light, GlassStyle.dark, 0.5));
      expect(mid.reducedTintOpacity, closeTo(0.8, 1e-9));
      expect(mid.fidelity, GlassFidelity.reduced);
      expect(a.lerp(b, 0.4).fidelity, GlassFidelity.auto);
      expect(a.lerp(null, 0.5), a);
    });

    test('copyWith replaces only the given fields', () {
      const data = GlassThemeData(style: GlassStyle.clear);
      final copy = data.copyWith(fidelity: GlassFidelity.opaque);
      expect(copy.style, GlassStyle.clear);
      expect(copy.fidelity, GlassFidelity.opaque);
      expect(copy, isNot(data));
    });

    testWidgets('animates with the Theme it belongs to', (tester) async {
      Widget app(ThemeData theme) => MaterialApp(
        theme: theme,
        home: Builder(builder: (context) => Text('${GlassTheme.of(context).reducedTintOpacity}')),
      );
      await tester.pumpWidget(app(ThemeData(extensions: const [GlassThemeData(reducedTintOpacity: 0)])));
      await tester.pumpWidget(app(ThemeData(extensions: const [GlassThemeData(reducedTintOpacity: 1)])));
      await tester.pump(const Duration(milliseconds: 100));
      final value = double.parse(tester.widget<Text>(find.byType(Text)).data!);
      expect(value, greaterThan(0));
      expect(value, lessThan(1));
      await tester.pumpAndSettle();
      expect(find.text('1.0'), findsOneWidget);
    });
  });
}
