import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/backdrop.dart';
import 'package:flutter_glass_example/tabs/contrast_tab.dart';
import 'package:flutter_glass_example/tabs/controls_tab.dart';
import 'package:flutter_glass_example/tabs/surfaces_tab.dart';

/// The screens the gallery can open on.
enum GalleryRoute {
  /// Surface presets, fidelity levels and corner styles.
  surfaces,

  /// Buttons, an animated surface and the bottom sheet.
  controls,

  /// The contrast checker.
  contrast,

  /// The controls tab with the bottom sheet open.
  sheet;

  /// Maps `/`, `/controls`, `/contrast` and `/sheet` to a route; anything
  /// else opens the surfaces tab.
  static GalleryRoute parse(String path) => switch (path) {
    '/controls' => controls,
    '/contrast' => contrast,
    '/sheet' => sheet,
    _ => surfaces,
  };

  /// The navigation bar index of the route.
  int get tab => switch (this) {
    surfaces => 0,
    controls || sheet => 1,
    contrast => 2,
  };
}

/// The gallery's only page: an app bar, a tab and a navigation bar of glass
/// over the [Backdrop].
class GalleryPage extends StatefulWidget {
  /// Creates the page opened on [route].
  const GalleryPage({super.key, this.route = GalleryRoute.surfaces});

  /// The screen shown first.
  final GalleryRoute route;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  static const _titles = ['Surfaces', 'Controls', 'Contrast'];
  late int _tab = widget.route.tab;

  @override
  void initState() {
    super.initState();
    if (widget.route == GalleryRoute.sheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          showGallerySheet(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tab = switch (_tab) {
      0 => const SurfacesTab(),
      1 => const ControlsTab(),
      _ => const ContrastTab(),
    };
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: GlassAppBar(title: Text(_titles[_tab])),
      // The cards of a tab never overlap one another, so they can share one
      // backdrop read. The bars stay outside the group: content scrolls under
      // them, and they must see it.
      body: Backdrop(child: GlassGroup(child: tab)),
      bottomNavigationBar: GlassNavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.layers_outlined), label: 'Surfaces'),
          NavigationDestination(icon: Icon(Icons.touch_app_outlined), label: 'Controls'),
          NavigationDestination(icon: Icon(Icons.contrast), label: 'Contrast'),
        ],
      ),
    );
  }
}

/// A scrolling column that leaves room for the glass bars above and below.
class GalleryList extends StatelessWidget {
  /// Creates a list of [children].
  const GalleryList({super.key, required this.children});

  /// The rows of the tab.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // With extendBodyBehindAppBar and extendBody, the Scaffold adds the bars'
    // heights to this padding, so the list starts below the app bar and ends
    // above the navigation bar.
    final padding = MediaQuery.paddingOf(context);
    return ListView(padding: EdgeInsets.fromLTRB(16, padding.top + 8, 16, padding.bottom + 16), children: children);
  }
}

/// A section heading over the backdrop.
class SectionTitle extends StatelessWidget {
  /// Creates a heading.
  const SectionTitle(this.text, {super.key});

  /// The heading text.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
    );
  }
}
