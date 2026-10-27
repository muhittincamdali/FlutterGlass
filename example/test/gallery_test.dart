import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/gallery.dart';
import 'package:flutter_glass_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('routes map to tabs, unknown paths to the first one', () {
    expect(GalleryRoute.parse('/'), GalleryRoute.surfaces);
    expect(GalleryRoute.parse('/controls').tab, 1);
    expect(GalleryRoute.parse('/sheet').tab, 1);
    expect(GalleryRoute.parse('/contrast').tab, 2);
    expect(GalleryRoute.parse('/missing'), GalleryRoute.surfaces);
  });

  testWidgets('opens on the surfaces tab with glass bars', (tester) async {
    await tester.pumpWidget(const GlassGalleryApp());
    expect(find.text('GlassStyle.frosted'), findsOneWidget);
    expect(find.byType(GlassAppBar), findsOneWidget);
    expect(find.byType(GlassNavigationBar), findsOneWidget);
    final list = find.descendant(of: find.byType(ListView), matching: find.byType(Scrollable)).first;
    await tester.scrollUntilVisible(find.text('opaque'), 200, scrollable: list);
    expect(find.text('opaque'), findsOneWidget);
  });

  testWidgets('switches tabs from the navigation bar', (tester) async {
    await tester.pumpWidget(const GlassGalleryApp());
    await tester.tap(find.text('Controls'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('press-button')));
    await tester.pump();
    expect(find.text('Pressed 1×'), findsOneWidget);

    await tester.tap(find.byKey(const Key('animated-surface')));
    await tester.pumpAndSettle();
    expect(find.text('Selected: tap to clear'), findsOneWidget);
  });

  testWidgets('the contrast tab raises the tint until the text passes AA', (tester) async {
    await tester.pumpWidget(const GlassGalleryApp(initialRoute: '/contrast'));
    expect(find.textContaining('fails WCAG AA'), findsOneWidget);
    await tester.tap(find.byKey(const Key('fix')));
    await tester.pump();
    expect(find.textContaining('passes WCAG AA'), findsOneWidget);
    final text = tester.widget<Text>(find.byKey(const Key('ratio'))).data!;
    final ratio = double.parse(RegExp(r'contrast ([0-9.]+):1').firstMatch(text)!.group(1)!);
    expect(ratio, greaterThanOrEqualTo(GlassContrast.aa));
  });

  testWidgets('the sheet route opens the glass bottom sheet', (tester) async {
    await tester.pumpWidget(const GlassGalleryApp(initialRoute: '/sheet'));
    await tester.pumpAndSettle();
    expect(find.text('Share photo'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Share photo'), findsNothing);
  });

  testWidgets('the dark theme uses the dark glass preset', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await tester.pumpWidget(const GlassGalleryApp());
    final context = tester.element(find.text('Surfaces').first);
    expect(GlassTheme.styleOf(context), GlassStyle.dark);
  });
}
