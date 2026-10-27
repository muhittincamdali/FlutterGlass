import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_test/flutter_test.dart';

const destinations = [
  NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
  NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
];

void main() {
  group('GlassAppBar', () {
    test('reports the toolbar height plus its bottom', () {
      expect(const GlassAppBar().preferredSize.height, kToolbarHeight);
      const tabs = TabBar(
        tabs: [
          Tab(text: 'A'),
          Tab(text: 'B'),
        ],
      );
      expect(const GlassAppBar(bottom: tabs).preferredSize.height, kToolbarHeight + tabs.preferredSize.height);
    });

    testWidgets('shows a transparent AppBar over glass in a Scaffold', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: GlassAppBar(title: Text('Inbox'), actions: [Icon(Icons.edit)]),
          ),
        ),
      );
      expect(find.text('Inbox'), findsOneWidget);
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, Colors.transparent);
      expect(appBar.elevation, 0);
      expect(find.descendant(of: find.byType(GlassAppBar), matching: find.byType(BackdropFilter)), findsOneWidget);
      expect(tester.getSize(find.byType(GlassAppBar)).height, kToolbarHeight);
    });
  });

  group('GlassNavigationBar', () {
    Widget app(int selected, ValueChanged<int> onSelected, {bool floating = true}) => MaterialApp(
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: GlassNavigationBar(
          destinations: destinations,
          selectedIndex: selected,
          onDestinationSelected: onSelected,
          floating: floating,
        ),
      ),
    );

    testWidgets('reports the tapped destination', (tester) async {
      int? selected;
      await tester.pumpWidget(app(0, (index) => selected = index));
      await tester.tap(find.text('Search'));
      expect(selected, 1);
    });

    testWidgets('clamps an out-of-range index instead of failing', (tester) async {
      await tester.pumpWidget(app(9, (_) {}));
      expect(tester.takeException(), isNull);
      expect(tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex, 1);
      await tester.pumpWidget(app(-3, (_) {}));
      expect(tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex, 0);
    });

    testWidgets('floats as a pill with side margins, or spans the edge', (tester) async {
      await tester.pumpWidget(app(0, (_) {}));
      final screen = tester.getSize(find.byType(Scaffold));
      final pill = tester.getRect(find.byType(GlassSurface));
      expect(pill.left, 16);
      expect(pill.right, screen.width - 16);
      expect(pill.height, GlassNavigationBar.barHeight);

      await tester.pumpWidget(app(0, (_) {}, floating: false));
      final strip = tester.getRect(find.byType(GlassSurface));
      expect(strip.left, 0);
      expect(strip.width, screen.width);
    });

    test('asserts that there are at least two destinations', () {
      expect(
        () => GlassNavigationBar(
          destinations: const [NavigationDestination(icon: Icon(Icons.home), label: 'Home')],
          selectedIndex: 0,
        ),
        throwsAssertionError,
      );
    });
  });

  group('showGlassModalBottomSheet', () {
    testWidgets('shows glass content, carries the GlassTheme and returns the popped value', (tester) async {
      const data = GlassThemeData(style: GlassStyle.frosted);
      Future<String?>? result;
      GlassThemeData? themeInSheet;
      await tester.pumpWidget(
        MaterialApp(
          home: GlassTheme(
            data: data,
            child: Builder(
              builder: (context) => TextButton(
                onPressed: () => result = showGlassModalBottomSheet<String>(
                  context: context,
                  builder: (sheetContext) {
                    themeInSheet = GlassTheme.of(sheetContext);
                    return TextButton(onPressed: () => Navigator.pop(sheetContext, 'done'), child: const Text('Done'));
                  },
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Done'), findsOneWidget);
      expect(themeInSheet, data);
      final sheet = find.ancestor(of: find.text('Done'), matching: find.byType(GlassSurface));
      expect(
        tester.widget<GlassSurface>(sheet).style!.borderRadius,
        const BorderRadius.vertical(top: Radius.circular(28)),
      );
      expect(tester.widget<GlassSurface>(sheet).style!.blurSigma, GlassStyle.frosted.blurSigma);

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();
      expect(await result, 'done');
      expect(find.text('Done'), findsNothing);
    });

    testWidgets('can hide the drag handle', (tester) async {
      Future<void> open({required bool handle}) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) => TextButton(
                onPressed: () => showGlassModalBottomSheet<void>(
                  context: context,
                  showDragHandle: handle,
                  builder: (_) => const SizedBox(height: 40),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
      }

      Finder handleFinder() => find.byWidgetPredicate(
        (widget) => widget is Container && widget.constraints == const BoxConstraints.tightFor(width: 36, height: 5),
      );
      await open(handle: true);
      expect(handleFinder(), findsOneWidget);
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      await open(handle: false);
      expect(handleFinder(), findsNothing);
    });
  });
}
