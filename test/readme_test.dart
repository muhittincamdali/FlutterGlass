// The code samples of README.md, compiled and run. When a sample changes, change its copy here.
import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_test/flutter_test.dart';

// Quick start, step 3.
class HelloGlass extends StatelessWidget {
  const HelloGlass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0A84FF), Color(0xFFFF9F0A)])),
        child: Center(
          child: GlassCard(child: Text('Hello, glass', style: Theme.of(context).textTheme.headlineSmall)),
        ),
      ),
    );
  }
}

// "Let content scroll under the bars", inside the State that owns `tab` and `rows`.
class BarsSample extends StatefulWidget {
  const BarsSample({super.key});

  @override
  State<BarsSample> createState() => _BarsSampleState();
}

class _BarsSampleState extends State<BarsSample> {
  int tab = 0;
  final rows = [for (var i = 0; i < 30; i++) ListTile(title: Text('Row $i'))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const GlassAppBar(title: Text('Library')),
      // Without its own padding, a ListView pads itself by the bars' heights.
      body: ListView(children: rows),
      bottomNavigationBar: GlassNavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) => setState(() => tab = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.photo_library_outlined), label: 'Library'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}

void main() {
  testWidgets('Quick start: a glass card over a gradient', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HelloGlass()));
    expect(find.text('Hello, glass'), findsOneWidget);
    expect(find.byType(BackdropFilter), findsOneWidget);
  });

  testWidgets('Style a surface', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: GlassSurface(
            width: 220,
            height: 120,
            alignment: Alignment.center,
            style: GlassStyle.frosted.copyWith(
              tint: const Color(0xFF0A84FF),
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),
            child: const Text('Frosted'),
          ),
        ),
      ),
    );
    expect(tester.getSize(find.byType(GlassSurface)), const Size(220, 120));
  });

  testWidgets('Let content scroll under the bars', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: BarsSample()));
    await tester.tap(find.text('Search'));
    await tester.pump();
    expect(tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex, 1);
    // The first row starts below the app bar, not under it.
    expect(tester.getTopLeft(find.text('Row 0')).dy, greaterThan(kToolbarHeight));
  });

  testWidgets('Theme light and dark mode', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    late GlassStyle style;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [GlassThemeData(style: GlassStyle.light)]),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          extensions: const [GlassThemeData(style: GlassStyle.dark)],
        ),
        home: Builder(
          builder: (context) {
            style = GlassTheme.styleOf(context);
            return const SizedBox();
          },
        ),
      ),
    );
    expect(style, GlassStyle.dark);
  });

  test('Keep text readable', () {
    final style = GlassContrast.legibleStyle(
      GlassStyle.dark,
      foreground: Colors.white,
      // The lightest and most saturated colors that can appear behind the glass.
      backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
    );
    expect(style.tintOpacity, greaterThan(GlassStyle.dark.tintOpacity));
    for (final color in const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)]) {
      final surface = Color.alphaBlend(style.effectiveTint, color);
      expect(GlassContrast.contrastRatio(Colors.white, surface), greaterThanOrEqualTo(GlassContrast.aa));
    }
  });

  testWidgets('Choose how much glass to draw', (tester) async {
    Future<void> pumpWith({required bool reduceTransparency, bool highContrast = false}) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: [GlassThemeData(fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto)],
          ),
          // Stands in for the iOS Increase Contrast setting.
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(highContrast: highContrast),
            child: child!,
          ),
          home: const Center(child: GlassSurface(width: 100, height: 100)),
        ),
      );
      // MaterialApp animates a theme change; let it finish.
      await tester.pumpAndSettle();
    }

    // auto draws full glass: the backdrop is blurred.
    await pumpWith(reduceTransparency: false);
    expect(find.byType(BackdropFilter), findsOneWidget);
    // opaque never reads the backdrop.
    await pumpWith(reduceTransparency: true);
    expect(find.byType(BackdropFilter), findsNothing);
    // auto turns opaque when the platform reports high contrast.
    await pumpWith(reduceTransparency: false, highContrast: true);
    expect(find.byType(BackdropFilter), findsNothing);
  });

  testWidgets('Show a glass sheet', (tester) async {
    String? choice;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              choice = await showGlassModalBottomSheet<String>(
                context: context,
                builder: (context) =>
                    ListTile(title: const Text('Share'), onTap: () => Navigator.pop(context, 'share')),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Share'));
    await tester.pumpAndSettle();
    expect(choice, 'share');
  });
}
