import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass/src/rendering/glass_painters.dart';
import 'package:flutter_test/flutter_test.dart';

Widget host(Widget child, {MediaQueryData? mediaQuery, ThemeData? theme}) {
  Widget body = Center(child: child);
  if (mediaQuery != null) {
    body = MediaQuery(data: mediaQuery, child: body);
  }
  return MaterialApp(
    theme: theme,
    home: Scaffold(body: body),
  );
}

double scaleOf(WidgetTester tester) => tester.widget<AnimatedScale>(find.byType(AnimatedScale)).scale;

void main() {
  group('GlassButton', () {
    testWidgets('calls onPressed when tapped', (tester) async {
      var taps = 0;
      await tester.pumpWidget(host(GlassButton(onPressed: () => taps++, child: const Text('Save'))));
      await tester.tap(find.text('Save'));
      expect(taps, 1);
    });

    testWidgets('is at least 48 × 48 even with a tiny label', (tester) async {
      await tester.pumpWidget(
        host(GlassButton(onPressed: () {}, padding: EdgeInsets.zero, child: const SizedBox(width: 4, height: 4))),
      );
      final size = tester.getSize(find.byType(GlassButton));
      expect(size.width, greaterThanOrEqualTo(kMinInteractiveDimension));
      expect(size.height, greaterThanOrEqualTo(kMinInteractiveDimension));
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    });

    testWidgets('a disabled button ignores taps and says so', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(host(const GlassButton(onPressed: null, child: Text('Send'))));
      await tester.tap(find.text('Send'), warnIfMissed: false);
      expect(
        tester.getSemantics(find.byType(GlassButton)),
        matchesSemantics(label: 'Send', isButton: true, hasEnabledState: true),
      );
      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.5);
      handle.dispose();
    });

    testWidgets('an enabled button is announced with a tap action', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        host(GlassButton(onPressed: () {}, semanticLabel: 'Close', child: const Icon(Icons.close))),
      );
      expect(
        tester.getSemantics(find.byType(GlassButton)),
        matchesSemantics(
          label: 'Close',
          isButton: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasTapAction: true,
          hasFocusAction: true,
        ),
      );
      handle.dispose();
    });

    testWidgets('activates with the keyboard', (tester) async {
      var taps = 0;
      await tester.pumpWidget(host(GlassButton(onPressed: () => taps++, autofocus: true, child: const Text('Go'))));
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(taps, 2);
    });

    testWidgets('shrinks while pressed and springs back', (tester) async {
      await tester.pumpWidget(host(GlassButton(onPressed: () {}, child: const Text('Hold'))));
      final gesture = await tester.startGesture(tester.getCenter(find.text('Hold')));
      await tester.pump(const Duration(milliseconds: 200));
      expect(scaleOf(tester), GlassButton.pressedScale);
      await gesture.up();
      await tester.pumpAndSettle();
      expect(scaleOf(tester), 1);
    });

    testWidgets('does not animate the press when motion is reduced', (tester) async {
      await tester.pumpWidget(
        host(
          GlassButton(onPressed: () {}, child: const Text('Hold')),
          mediaQuery: const MediaQueryData(disableAnimations: true),
        ),
      );
      final gesture = await tester.startGesture(tester.getCenter(find.text('Hold')));
      await tester.pump(const Duration(milliseconds: 200));
      expect(tester.widget<AnimatedScale>(find.byType(AnimatedScale)).duration, Duration.zero);
      await gesture.up();
    });

    testWidgets('prominent buttons use the primary color', (tester) async {
      final theme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A84FF)));
      await tester.pumpWidget(
        host(
          GlassButton.prominent(onPressed: () {}, child: const Text('Buy')),
          theme: theme,
        ),
      );
      final painter = tester
          .widgetList<CustomPaint>(find.byType(CustomPaint))
          .map((paint) => paint.painter)
          .whereType<GlassFillPainter>()
          .single;
      expect(painter.fill, theme.colorScheme.primary.withValues(alpha: 0.72));
      final text = tester.widget<DefaultTextStyle>(
        find.ancestor(of: find.text('Buy'), matching: find.byType(DefaultTextStyle)).first,
      );
      expect(text.style.color, theme.colorScheme.onPrimary);
    });
  });

  group('GlassCard', () {
    testWidgets('a card without callbacks is not a button', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(host(const GlassCard(child: Text('Info'))));
      expect(find.byType(InkWell), findsNothing);
      expect(tester.getSemantics(find.text('Info')), matchesSemantics(label: 'Info'));
      handle.dispose();
    });

    testWidgets('a tappable card reports taps and long presses', (tester) async {
      var taps = 0;
      var longPresses = 0;
      await tester.pumpWidget(
        host(
          GlassCard(
            onTap: () => taps++,
            onLongPress: () => longPresses++,
            semanticLabel: 'Weather',
            child: const Text('21°'),
          ),
        ),
      );
      await tester.tap(find.text('21°'));
      await tester.longPress(find.text('21°'));
      expect(taps, 1);
      expect(longPresses, 1);
      final handle = tester.ensureSemantics();
      await tester.pump();
      expect(find.bySemanticsLabel(RegExp('Weather')), findsOneWidget);
      handle.dispose();
    });

    testWidgets('margin adds space around the glass', (tester) async {
      await tester.pumpWidget(
        host(
          const GlassCard(margin: EdgeInsets.all(8), padding: EdgeInsets.zero, child: SizedBox(width: 50, height: 50)),
        ),
      );
      expect(tester.getSize(find.byType(GlassCard)), const Size(66, 66));
      expect(tester.getSize(find.byType(GlassSurface)), const Size(50, 50));
    });
  });
}
