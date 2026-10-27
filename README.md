<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="Latest version: v2.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="Language version: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="Language version: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="License: MIT"></picture></a>
</p>

<p align="center">
<a href="#quick-start"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-en-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-en-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-en-light.svg" alt="Get started"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-en-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-en-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-en-light.svg" alt="Documentation"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-en-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-en-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-en-light.svg" alt="Examples"></picture></a>
</p>

<!-- brand:end -->
FlutterGlass is a Flutter package of glass widgets: panels, cards, buttons, an app bar, a
navigation bar and a bottom sheet that blur and tint whatever scrolls behind them. It is for
apps that want the translucent look of iOS without losing readable text or accessibility
support. A surface turns opaque when the user asks for more contrast, a contrast helper
computes how much tint keeps text readable over a given background, and every number in a
style is clamped before it reaches the renderer. The package depends only on Flutter itself;
the example app is run on an iOS simulator and built for macOS.

## Highlights

- **Readable by design** — `GlassContrast` uses the WCAG 2.2 formulas to find the lowest tint
  opacity that gives your text a 4.5:1 ratio over every color you sample from the background.
- **Follows accessibility settings** — with the iOS **Increase Contrast** setting on, glass
  turns opaque; with **Reduce Motion** on, button presses and style changes stop animating.
- **Three fidelity levels** — full glass, a reduced level without blur (no backdrop read) and
  an opaque level, set per widget or for the whole app.
- **Shared backdrop reads** — surfaces inside a `GlassGroup` use Flutter's `BackdropGroup`, so
  Impeller copies the screen behind them once instead of once per surface.
- **Safe with any input** — NaN, infinite and negative values in a `GlassStyle` are mapped into
  range, and the blur is capped, so a slider or an animation overshoot cannot break a frame.
- **Material underneath** — the bars wrap Flutter's `AppBar` and `NavigationBar`, so semantics,
  keyboard handling and theming work as they do without glass.

## Quick start

**1. Add the package**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

You need [Flutter](https://docs.flutter.dev/install) 3.41 or later.

**2. Import the module**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. Use it**

Put a `GlassCard` over something colorful; this is a complete app:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';

void main() => runApp(const MaterialApp(home: HelloGlass()));

class HelloGlass extends StatelessWidget {
  const HelloGlass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF0A84FF), Color(0xFFFF9F0A)]),
        ),
        child: Center(
          child: GlassCard(
            child: Text('Hello, glass', style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
      ),
    );
  }
}
```

Glass blurs what is behind it, so over a plain white screen it looks like a pale box: keep an
image, a gradient or scrolling content underneath.

## Installation

The package is installed from this repository. In `pubspec.yaml`:

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

Then run `flutter pub get`. Use a tag for `ref` so a later change on `main` does not change
your build.

## Usage

### Style a surface

`GlassSurface` is the building block; `GlassCard` adds padding and an optional tap. Start from a
preset and change what you need:

```dart
GlassSurface(
  width: 220,
  height: 120,
  alignment: Alignment.center,
  style: GlassStyle.frosted.copyWith(
    tint: const Color(0xFF0A84FF),
    borderRadius: const BorderRadius.all(Radius.circular(32)),
  ),
  child: const Text('Frosted'),
)
```

The presets are `GlassStyle.light` (the default), `dark`, `clear` and `frosted`. Corners are
continuous, as on iOS, unless you set `corners: GlassCorners.circular`.

### Let content scroll under the bars

```dart
Scaffold(
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
)
```

The navigation bar floats as a pill above the home indicator; `floating: false` spans the
bottom edge instead.

### Theme light and dark mode

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

Without a `GlassThemeData`, glass picks the light or dark preset from the theme's brightness.

### Keep text readable

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` raises the tint opacity until white text reaches 4.5:1 over each sampled color.
`GlassContrast.minimumTintOpacity` returns the number itself, or null when no opacity is enough.

### Choose how much glass to draw

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` draws full glass and switches to opaque when the platform reports high contrast.
`GlassFidelity.reduced` drops the blur but keeps a translucent tint, for long lists or older
devices.

### Show a glass sheet

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## Screenshots

The [example app](example) on an iPhone 18 Pro simulator (iOS 27). The blur is rendered by
Impeller over a backdrop the app draws in code.

| Surfaces                                                                                                        | Surfaces, dark                                                         | Controls                                                                                | Contrast                                                                                      | Sheet                                                                        |
| --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| ![Glass presets, fidelity levels and corner styles over a striped blue backdrop](docs/screenshots/surfaces.png) | ![The same screen with dark glass](docs/screenshots/surfaces-dark.png) | ![Glass buttons, an animated surface and a weather card](docs/screenshots/controls.png) | ![A tint opacity slider that reports the worst contrast ratio](docs/screenshots/contrast.png) | ![A glass bottom sheet over the controls screen](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) builds the example and takes these
screenshots. To run the example yourself:

```sh
cd example
flutter run
```

## Documentation

The [API reference](https://muhittincamdali.github.io/FlutterGlass/) is built with `dart doc`
from the comments in `lib/` and includes the guides below.

## Guides

- [Getting started](doc/guides/getting-started.md) — a card, bars, presets, a theme and a sheet,
  step by step.
- [Accessibility and contrast](doc/guides/accessibility.md) — the fidelity levels, the contrast
  calculation and what the controls announce.
- [Performance](doc/guides/performance.md) — what a backdrop blur costs and how `GlassGroup` and
  `GlassFidelity.reduced` reduce it.

## Requirements

| Toolchain | Minimum version |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI runs on the latest stable Flutter release; the tests also pass on Flutter 3.41.5.

## Architecture

- `lib/src/style/` — `GlassStyle`, an immutable value with `copyWith`, `lerp` and `sanitized`,
  which clamps every number before painting.
- `lib/src/theme/` — `GlassThemeData` (a `ThemeExtension`), `GlassTheme` (an `InheritedTheme`)
  and `ResolvedGlass`, which combines the theme, the platform's accessibility flags and a
  widget's own settings into what is painted.
- `lib/src/rendering/` — the painters for the tint, the rim light and the shadow, which is
  clipped so it never shows through the glass.
- `lib/src/widgets/` — `GlassSurface` (clip, `BackdropFilter`, painters), `GlassGroup`,
  `AnimatedGlassSurface`, and the controls and bars built on them.
- `lib/src/contrast/` — `GlassContrast`, pure functions with bounded input.
- `example/` — the gallery app, depending on this checkout with `path: ..`.

Run the checks locally:

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## Roadmap

- A refraction effect drawn with a fragment shader where Impeller supports
  `ImageFilter.shader`, with the current blur as the fallback.
- Bounded blur, once a bounded `ImageFilterConfig.blur` samples the right area inside scrolling
  lists.
- Glass versions of `SegmentedButton`, `Switch` and `SearchBar`.

## Contributing

Contributions are welcome. Read the [contributing guide](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md) and the [code of conduct](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md) before opening a pull request. Report security issues privately as described in the [security policy](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md).

## License

Released under the MIT license. See [LICENSE](LICENSE).
