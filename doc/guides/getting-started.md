# Getting started with FlutterGlass

This guide puts a glass card, a glass app bar and a glass navigation bar on a
screen, then themes them for light and dark mode. Every snippet uses the public
API of `package:flutter_glass/flutter_glass.dart`.

## 1. Give the glass something to blur

Glass blurs what is painted behind it. Over a flat color there is nothing to
blur, and a glass surface looks like a plain translucent box. Put it over an
image, a gradient or scrolling content:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF0A84FF), Color(0xFF64D2FF)]),
      ),
      child: Center(
        child: GlassCard(
          child: const Text('Istanbul · Sunny, 21°'),
        ),
      ),
    );
  }
}
```

`GlassCard` is a `GlassSurface` with 16 px of padding. Use `GlassSurface`
directly when you need a fixed `width` and `height`, your own `padding` or an
`alignment`.

## 2. Let content scroll under the bars

`GlassAppBar` and `GlassNavigationBar` go into the usual `Scaffold` slots. Two
`Scaffold` flags make the body extend under them, so the glass has content to
blur while the list scrolls:

```dart
Scaffold(
  extendBodyBehindAppBar: true,
  extendBody: true,
  appBar: const GlassAppBar(title: Text('Photos')),
  // Without its own padding, a ListView pads itself by the bars' heights,
  // which the Scaffold adds to the MediaQuery padding of its body.
  body: ListView(children: [/* … */]),
  bottomNavigationBar: GlassNavigationBar(
    selectedIndex: index,
    onDestinationSelected: (value) => setState(() => index = value),
    destinations: const [
      NavigationDestination(icon: Icon(Icons.photo), label: 'Library'),
      NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    ],
  ),
)
```

The navigation bar floats as a pill by default; pass `floating: false` for a
bar that spans the bottom edge.

## 3. Pick a style

Four presets cover most screens:

| Preset               | Use it for                                               |
| -------------------- | -------------------------------------------------------- |
| `GlassStyle.light`   | The default: light glass over bright or colorful content |
| `GlassStyle.dark`    | Dark themes: a near-black tint and a softer rim          |
| `GlassStyle.clear`   | Overlays that should keep the background readable        |
| `GlassStyle.frosted` | Text-heavy panels: more blur and a stronger tint         |

Change one value with `copyWith`:

```dart
GlassSurface(
  style: GlassStyle.frosted.copyWith(
    tint: Theme.of(context).colorScheme.primary,
    borderRadius: const BorderRadius.all(Radius.circular(32)),
  ),
  child: const Text('Selected'),
)
```

`corners: GlassCorners.continuous` (the default) draws the continuous corners
iOS uses; `GlassCorners.circular` draws plain circular arcs.

## 4. Theme the whole app

Add a `GlassThemeData` to each `ThemeData` so the glass follows light and dark
mode and animates with the theme:

```dart
MaterialApp(
  theme: ThemeData(extensions: const [GlassThemeData(style: GlassStyle.light)]),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    extensions: const [GlassThemeData(style: GlassStyle.dark)],
  ),
  home: const HomePage(),
)
```

Without an extension, glass widgets pick `GlassStyle.light` or
`GlassStyle.dark` from the theme's brightness. A `GlassTheme` widget overrides
the settings for one subtree, and sheets opened from inside it keep them.

## 5. Show a glass sheet

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

It takes the same main arguments as `showModalBottomSheet` and draws a drag
handle unless `showDragHandle` is false.

## Next

- [Accessibility and contrast](https://github.com/muhittincamdali/FlutterGlass/blob/main/doc/guides/accessibility.md)
  explains the fidelity levels and how to keep text readable on glass.
- [Performance](https://github.com/muhittincamdali/FlutterGlass/blob/main/doc/guides/performance.md)
  explains what a backdrop blur costs and how to share it.
