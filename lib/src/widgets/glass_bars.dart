import 'package:flutter/material.dart';

import '../style/glass_style.dart';
import '../theme/glass_theme.dart';
import 'glass_surface.dart';

/// A Material [AppBar] on a strip of glass, for `Scaffold.appBar`.
///
/// Set `Scaffold.extendBodyBehindAppBar` to true so the body scrolls under
/// the glass; otherwise there is nothing behind it to blur.
class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a glass app bar. The arguments match [AppBar].
  const GlassAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.foregroundColor,
    this.style,
    this.fidelity,
  });

  /// See [AppBar.title].
  final Widget? title;

  /// See [AppBar.leading].
  final Widget? leading;

  /// See [AppBar.actions].
  final List<Widget>? actions;

  /// See [AppBar.bottom].
  final PreferredSizeWidget? bottom;

  /// See [AppBar.centerTitle].
  final bool? centerTitle;

  /// See [AppBar.automaticallyImplyLeading].
  final bool automaticallyImplyLeading;

  /// See [AppBar.foregroundColor].
  final Color? foregroundColor;

  /// See [GlassSurface.style]. Corners, rim and shadow are removed; the bar
  /// draws a hairline along its bottom edge instead.
  final GlassStyle? style;

  /// See [GlassSurface.fidelity].
  final GlassFidelity? fidelity;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final base = style ?? GlassTheme.styleOf(context);
    final glass = base.copyWith(borderRadius: BorderRadius.zero, borderWidth: 0, shadows: const []);
    final clean = base.sanitized();
    final hairline = clean.rimColor.withValues(alpha: clean.rimColor.a * clean.borderOpacity * 0.6);
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: hairline, width: 0.5)),
      ),
      child: GlassSurface(
        style: glass,
        fidelity: fidelity,
        child: AppBar(
          title: title,
          leading: leading,
          actions: actions,
          bottom: bottom,
          centerTitle: centerTitle,
          automaticallyImplyLeading: automaticallyImplyLeading,
          foregroundColor: foregroundColor,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
    );
  }
}

/// A Material 3 [NavigationBar] on glass, for `Scaffold.bottomNavigationBar`.
///
/// By default it floats as a pill above the bottom safe area, the way tab bars
/// look on iOS 26 and later. Set `Scaffold.extendBody` to true so content
/// scrolls under it.
class GlassNavigationBar extends StatelessWidget {
  /// Creates a glass navigation bar with two or more [destinations].
  // Not const, like NavigationBar: the assert reads destinations.length.
  // ignore: prefer_const_constructors_in_immutables
  GlassNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
    this.floating = true,
    this.labelBehavior,
    this.indicatorColor,
    this.style,
    this.fidelity,
  }) : assert(destinations.length >= 2, 'A navigation bar needs at least two destinations');

  /// Usually [NavigationDestination]s.
  final List<Widget> destinations;

  /// The selected destination. An index outside the list selects the nearest
  /// valid one instead of failing.
  final int selectedIndex;

  /// Called with the index of the tapped destination.
  final ValueChanged<int>? onDestinationSelected;

  /// Whether the bar floats as a rounded pill (true) or spans the bottom edge.
  final bool floating;

  /// See [NavigationBar.labelBehavior].
  final NavigationDestinationLabelBehavior? labelBehavior;

  /// The pill behind the selected icon. Null uses the primary color at 22 %.
  final Color? indicatorColor;

  /// See [GlassSurface.style].
  final GlassStyle? style;

  /// See [GlassSurface.fidelity].
  final GlassFidelity? fidelity;

  /// The height of the bar, without the safe area.
  static const double barHeight = 68;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final base = style ?? GlassTheme.styleOf(context);
    final index = destinations.isEmpty ? 0 : selectedIndex.clamp(0, destinations.length - 1);
    final bar = NavigationBar(
      destinations: destinations,
      selectedIndex: index,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: labelBehavior,
      indicatorColor: indicatorColor ?? colors.primary.withValues(alpha: 0.22),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      height: barHeight,
    );
    if (!floating) {
      return GlassSurface(
        style: base.copyWith(borderRadius: BorderRadius.zero, borderWidth: 0, shadows: const []),
        fidelity: fidelity,
        child: bar,
      );
    }
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: GlassSurface(
        style: base.copyWith(borderRadius: const BorderRadius.all(Radius.circular(barHeight / 2))),
        fidelity: fidelity,
        child: MediaQuery.removePadding(context: context, removeBottom: true, child: bar),
      ),
    );
  }
}

/// Shows a modal bottom sheet made of glass and returns the value it is
/// popped with.
///
/// The arguments match [showModalBottomSheet]. A drag handle is drawn unless
/// [showDragHandle] is false, and the content stays above the bottom safe
/// area. The ambient [GlassTheme] is carried into the sheet's route.
Future<T?> showGlassModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  GlassStyle? style,
  GlassFidelity? fidelity,
  bool isScrollControlled = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool showDragHandle = true,
  bool useRootNavigator = false,
  Color? barrierColor,
  RouteSettings? routeSettings,
}) {
  final base = style ?? GlassTheme.styleOf(context);
  final glass = base.copyWith(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
    shadows: const [],
  );
  final handleColor = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4);
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    useRootNavigator: useRootNavigator,
    barrierColor: barrierColor,
    routeSettings: routeSettings,
    backgroundColor: Colors.transparent,
    elevation: 0,
    builder: (sheetContext) => GlassSurface(
      style: glass,
      fidelity: fidelity,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showDragHandle)
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 36,
                  height: 5,
                  decoration: BoxDecoration(color: handleColor, borderRadius: BorderRadius.circular(3)),
                ),
              ),
            Flexible(child: builder(sheetContext)),
          ],
        ),
      ),
    ),
  );
}
