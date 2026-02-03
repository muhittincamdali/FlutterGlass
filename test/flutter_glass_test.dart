import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_glass/flutter_glass.dart';

void main() {
  group('GlassCard', () {
    testWidgets('renders with default properties', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassCard(
              child: Text('Test'),
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(GlassCard), findsOneWidget);
    });

    testWidgets('renders with custom blur sigma', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassCard(
              blurSigma: 25.0,
              child: Text('Custom Blur'),
            ),
          ),
        ),
      );

      expect(find.text('Custom Blur'), findsOneWidget);
    });

    testWidgets('renders with custom tint color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassCard(
              tintColor: Color(0x44FF0000),
              child: Text('Custom Tint'),
            ),
          ),
        ),
      );

      expect(find.text('Custom Tint'), findsOneWidget);
    });

    testWidgets('renders with custom border radius', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassCard(
              borderRadius: 32.0,
              child: Text('Custom Radius'),
            ),
          ),
        ),
      );

      expect(find.text('Custom Radius'), findsOneWidget);
    });

    testWidgets('handles tap callback', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GlassCard(
              onTap: () => tapped = true,
              child: const Text('Tappable'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tappable'));
      expect(tapped, isTrue);
    });
  });

  group('GlassButton', () {
    testWidgets('renders with text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassButton(
              onPressed: null,
              child: Text('Button'),
            ),
          ),
        ),
      );

      expect(find.text('Button'), findsOneWidget);
      expect(find.byType(GlassButton), findsOneWidget);
    });

    testWidgets('handles press callback', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GlassButton(
              onPressed: () => pressed = true,
              child: const Text('Press Me'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Press Me'));
      expect(pressed, isTrue);
    });

    testWidgets('renders as disabled when onPressed is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ),
      );

      final button = tester.widget<GlassButton>(find.byType(GlassButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('renders with icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassButton(
              onPressed: null,
              icon: Icons.star,
              child: Text('With Icon'),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('icon button variant renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GlassButton.icon(
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });

  group('GlassTextField', () {
    testWidgets('renders with hint text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassTextField(
              hintText: 'Enter text',
            ),
          ),
        ),
      );

      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('accepts text input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GlassTextField(
              controller: controller,
              hintText: 'Type here',
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Hello World');
      expect(controller.text, equals('Hello World'));
    });

    testWidgets('renders with prefix icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassTextField(
              hintText: 'Search',
              prefixIcon: Icons.search,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('renders with suffix icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassTextField(
              hintText: 'Password',
              suffixIcon: Icons.visibility,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassTextField(
              hintText: 'Password',
              obscureText: true,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
    });
  });

  group('GlassNavigationBar', () {
    testWidgets('renders navigation items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: GlassNavigationBar(
              selectedIndex: 0,
              onItemSelected: (_) {},
              items: const [
                GlassNavigationItem(icon: Icons.home, label: 'Home'),
                GlassNavigationItem(icon: Icons.search, label: 'Search'),
                GlassNavigationItem(icon: Icons.person, label: 'Profile'),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('handles item selection', (tester) async {
      int selectedIndex = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: GlassNavigationBar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) => selectedIndex = index,
              items: const [
                GlassNavigationItem(icon: Icons.home, label: 'Home'),
                GlassNavigationItem(icon: Icons.search, label: 'Search'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      expect(selectedIndex, equals(1));
    });

    testWidgets('shows badge when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: GlassNavigationBar(
              selectedIndex: 0,
              onItemSelected: (_) {},
              items: const [
                GlassNavigationItem(icon: Icons.home, label: 'Home', badge: 5),
                GlassNavigationItem(icon: Icons.search, label: 'Search'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
    });
  });

  group('GlassAppBar', () {
    testWidgets('renders with title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: GlassAppBar(
              title: Text('App Title'),
            ),
          ),
        ),
      );

      expect(find.text('App Title'), findsOneWidget);
    });

    testWidgets('renders with actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: GlassAppBar(
              title: const Text('Title'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('renders with custom height', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: GlassAppBar(
              title: Text('Tall Bar'),
              toolbarHeight: 80.0,
            ),
          ),
        ),
      );

      final appBar = tester.widget<GlassAppBar>(find.byType(GlassAppBar));
      expect(appBar.preferredSize.height, equals(80.0));
    });
  });

  group('GlassTheme', () {
    testWidgets('provides theme to descendants', (tester) async {
      late GlassThemeConfig capturedTheme;

      await tester.pumpWidget(
        MaterialApp(
          home: GlassThemeProvider(
            data: const GlassThemeConfig(
              blurSigma: 25.0,
              tintColor: Color(0x44FFFFFF),
            ),
            child: Builder(
              builder: (context) {
                capturedTheme = GlassTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      expect(capturedTheme.blurSigma, equals(25.0));
      expect(capturedTheme.tintColor, equals(const Color(0x44FFFFFF)));
    });

    testWidgets('updates when theme changes', (tester) async {
      GlassThemeConfig config = const GlassThemeConfig(blurSigma: 15.0);
      late GlassThemeConfig capturedTheme;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return GlassThemeProvider(
                data: config,
                child: Builder(
                  builder: (context) {
                    capturedTheme = GlassTheme.of(context);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          config = const GlassThemeConfig(blurSigma: 30.0);
                        });
                      },
                      child: const Text('Tap'),
                    );
                  },
                ),
              );
            },
          ),
        ),
      );

      expect(capturedTheme.blurSigma, equals(15.0));

      await tester.tap(find.text('Tap'));
      await tester.pump();

      expect(capturedTheme.blurSigma, equals(30.0));
    });
  });

  group('FrostedGlass', () {
    testWidgets('renders with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FrostedGlass(
              child: Text('Frosted'),
            ),
          ),
        ),
      );

      expect(find.text('Frosted'), findsOneWidget);
      expect(find.byType(FrostedGlass), findsOneWidget);
    });

    testWidgets('applies blur effect', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FrostedGlass(
              blurSigma: 20.0,
              child: Text('Blurred'),
            ),
          ),
        ),
      );

      expect(find.text('Blurred'), findsOneWidget);
    });
  });

  group('AuroraBackground', () {
    testWidgets('renders with default colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuroraBackground(
              child: Text('Aurora'),
            ),
          ),
        ),
      );

      expect(find.text('Aurora'), findsOneWidget);
      expect(find.byType(AuroraBackground), findsOneWidget);
    });

    testWidgets('renders with custom colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuroraBackground(
              colors: [Colors.red, Colors.blue, Colors.green],
              child: Text('Custom Colors'),
            ),
          ),
        ),
      );

      expect(find.text('Custom Colors'), findsOneWidget);
    });
  });

  group('MorphingCard', () {
    testWidgets('renders in collapsed state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MorphingCard(
              expanded: false,
              child: Text('Collapsed'),
            ),
          ),
        ),
      );

      expect(find.text('Collapsed'), findsOneWidget);
    });

    testWidgets('renders in expanded state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MorphingCard(
              expanded: true,
              child: Text('Expanded'),
            ),
          ),
        ),
      );

      expect(find.text('Expanded'), findsOneWidget);
    });

    testWidgets('animates between states', (tester) async {
      bool expanded = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return GestureDetector(
                  onTap: () => setState(() => expanded = !expanded),
                  child: MorphingCard(
                    expanded: expanded,
                    child: const Text('Morphing'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Morphing'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));

      expect(find.text('Morphing'), findsOneWidget);
    });
  });

  group('ShimmerGlass', () {
    testWidgets('renders with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerGlass(
              child: Text('Shimmer'),
            ),
          ),
        ),
      );

      expect(find.text('Shimmer'), findsOneWidget);
      expect(find.byType(ShimmerGlass), findsOneWidget);
    });

    testWidgets('renders with custom colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerGlass(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Text('Custom Shimmer'),
            ),
          ),
        ),
      );

      expect(find.text('Custom Shimmer'), findsOneWidget);
    });
  });

  group('GlassBottomSheet', () {
    testWidgets('shows bottom sheet', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showGlassBottomSheet(
                      context: context,
                      builder: (context) => const Text('Sheet Content'),
                    );
                  },
                  child: const Text('Show Sheet'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Sheet Content'), findsOneWidget);
    });

    testWidgets('dismisses on tap outside', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showGlassBottomSheet(
                      context: context,
                      builder: (context) => const SizedBox(
                        height: 200,
                        child: Text('Sheet'),
                      ),
                    );
                  },
                  child: const Text('Show'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Sheet'), findsOneWidget);

      // Tap outside the bottom sheet
      await tester.tapAt(const Offset(100, 100));
      await tester.pumpAndSettle();

      expect(find.text('Sheet'), findsNothing);
    });
  });

  group('BlurLayer', () {
    testWidgets('renders with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BlurLayer(
              child: Text('Blur Layer'),
            ),
          ),
        ),
      );

      expect(find.text('Blur Layer'), findsOneWidget);
    });

    testWidgets('applies custom blur sigma', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BlurLayer(
              blurSigma: 30.0,
              child: Text('Heavy Blur'),
            ),
          ),
        ),
      );

      expect(find.text('Heavy Blur'), findsOneWidget);
    });
  });
}
