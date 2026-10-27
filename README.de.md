<!-- i18n-source: README.md@cef284ac4975c00c00f964cf03bad67426eda5af status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI-Status"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="Aktuelle Version: v1.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="Sprachversion: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="Sprachversion: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="Lizenz: MIT"></picture></a>
</p>

<p align="center">
<a href="#schnellstart"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-de-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-de-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-de-light.svg" alt="Loslegen"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-de-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-de-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-de-light.svg" alt="Dokumentation"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-de-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-de-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-de-light.svg" alt="Beispiele"></picture></a>
</p>

> Dies ist eine Übersetzung der englischen README. Bei Abweichungen gilt die englische Fassung.

<!-- brand:end -->
FlutterGlass ist ein Flutter-Paket mit Glas-Widgets: Panels, Karten, Buttons, eine App-Bar, eine Navigationsleiste und ein Bottom Sheet, die alles, was dahinter scrollt, weichzeichnen und einfärben. Es richtet sich an Apps, die den durchscheinenden Look von iOS wollen, ohne lesbaren Text oder Unterstützung für Barrierefreiheit zu verlieren. Eine Fläche wird undurchsichtig, wenn der Nutzer mehr Kontrast verlangt, ein Kontrast-Helfer berechnet, wie viel Tönung Text über einem gegebenen Hintergrund lesbar hält, und jede Zahl in einem Stil wird begrenzt, bevor sie den Renderer erreicht. Das Paket hängt nur von Flutter selbst ab; die Beispiel-App läuft in einem iOS-Simulator und wird für macOS gebaut.

## Highlights

- **Lesbar durch Design** — `GlassContrast` nutzt die WCAG-2.2-Formeln, um die niedrigste Deckkraft der Tönung zu finden, die deinem Text über jeder Farbe, die du aus dem Hintergrund abtastest, ein Verhältnis von 4.5:1 gibt.
- **Folgt den Bedienungshilfen-Einstellungen** — ist die iOS-Einstellung **Kontrast erhöhen** aktiv, wird das Glas undurchsichtig; ist **Bewegung reduzieren** aktiv, werden Button-Druck und Stiländerungen nicht mehr animiert.
- **Drei Detailstufen** — volles Glas, eine reduzierte Stufe ohne Weichzeichner (kein Lesen des Hintergrunds) und eine undurchsichtige Stufe, einstellbar pro Widget oder für die ganze App.
- **Gemeinsame Hintergrundzugriffe** — Flächen innerhalb einer `GlassGroup` verwenden Flutters `BackdropGroup`, sodass Impeller den Bildschirm dahinter einmal kopiert statt einmal pro Fläche.
- **Sicher bei jeder Eingabe** — NaN, unendliche und negative Werte in einem `GlassStyle` werden in den gültigen Bereich abgebildet, und der Weichzeichner ist nach oben begrenzt, sodass ein Schieberegler oder das Überschwingen einer Animation keinen Frame beschädigen kann.
- **Material darunter** — die Leisten umschließen Flutters `AppBar` und `NavigationBar`, daher funktionieren Semantik, Tastaturbedienung und Theming wie ohne Glas.

## Schnellstart

**1. Paket hinzufügen**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

Du brauchst [Flutter](https://docs.flutter.dev/install) 3.41 oder neuer.

**2. Modul importieren**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. Verwenden**

Lege eine `GlassCard` über etwas Farbiges; das ist eine vollständige App:

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

Glas zeichnet weich, was dahinter liegt; über einem einfarbig weißen Bildschirm sieht es daher wie ein blasser Kasten aus. Lege also ein Bild, einen Farbverlauf oder scrollenden Inhalt darunter.

## Installation

Das Paket wird aus diesem Repository installiert. In `pubspec.yaml`:

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

Führe danach `flutter pub get` aus. Verwende für `ref` ein Tag, damit eine spätere Änderung auf `main` deinen Build nicht verändert.

## Verwendung

### Eine Fläche gestalten

`GlassSurface` ist der Baustein; `GlassCard` fügt Innenabstand und ein optionales Tippen hinzu. Beginne mit einer Voreinstellung und ändere, was du brauchst:

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

Die Voreinstellungen sind `GlassStyle.light` (der Standard), `dark`, `clear` und `frosted`. Die Ecken sind wie bei iOS durchgehend gerundet, außer du setzt `corners: GlassCorners.circular`.

### Inhalt unter den Leisten scrollen lassen

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

Die Navigationsleiste schwebt als Pille über dem Home-Indikator; `floating: false` erstreckt sie stattdessen über den unteren Rand.

### Hell- und Dunkelmodus gestalten

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

Ohne `GlassThemeData` wählt das Glas die helle oder dunkle Voreinstellung anhand der Helligkeit des Themes.

### Text lesbar halten

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` erhöht die Deckkraft der Tönung, bis weißer Text über jeder abgetasteten Farbe 4.5:1 erreicht. `GlassContrast.minimumTintOpacity` gibt die Zahl selbst zurück oder null, wenn keine Deckkraft ausreicht.

### Wählen, wie viel Glas gezeichnet wird

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` zeichnet volles Glas und wechselt zu undurchsichtig, wenn die Plattform hohen Kontrast meldet. `GlassFidelity.reduced` lässt den Weichzeichner weg, behält aber eine durchscheinende Tönung, für lange Listen oder ältere Geräte.

### Ein Glas-Sheet anzeigen

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

Die [Beispiel-App](example) in einem iPhone-18-Pro-Simulator (iOS 27). Der Weichzeichner wird von Impeller über einem Hintergrund gerendert, den die App im Code zeichnet.

| Flächen                                                                                                                      | Flächen, dunkel                                                             | Steuerelemente                                                                             | Kontrast                                                                                                                          | Sheet                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| ![Glas-Voreinstellungen, Detailstufen und Eckenstile über einem blau gestreiften Hintergrund](docs/screenshots/surfaces.png) | ![Derselbe Bildschirm mit dunklem Glas](docs/screenshots/surfaces-dark.png) | ![Glas-Buttons, eine animierte Fläche und eine Wetterkarte](docs/screenshots/controls.png) | ![Ein Schieberegler für die Deckkraft der Tönung, der das schlechteste Kontrastverhältnis anzeigt](docs/screenshots/contrast.png) | ![Ein gläsernes Bottom Sheet über dem Bildschirm mit den Steuerelementen](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) baut das Beispiel und erstellt diese Screenshots. So führst du das Beispiel selbst aus:

```sh
cd example
flutter run
```

## Dokumentation

Die [API-Referenz](https://muhittincamdali.github.io/FlutterGlass/) wird mit `dart doc` aus den Kommentaren in `lib/` erzeugt und enthält die folgenden Anleitungen.

## Anleitungen

- [Erste Schritte](doc/guides/getting-started.md) — eine Karte, Leisten, Voreinstellungen, ein Theme und ein Sheet, Schritt für Schritt.
- [Barrierefreiheit und Kontrast](doc/guides/accessibility.md) — die Detailstufen, die Kontrastberechnung und was die Steuerelemente ansagen.
- [Performance](doc/guides/performance.md) — was ein Hintergrund-Weichzeichner kostet und wie `GlassGroup` und `GlassFidelity.reduced` die Kosten senken.

## Voraussetzungen

| Toolchain | Mindestversion |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI läuft auf dem neuesten stabilen Flutter-Release; die Tests bestehen auch auf Flutter 3.41.5.

## Architektur

- `lib/src/style/` — `GlassStyle`, ein unveränderlicher Wert mit `copyWith`, `lerp` und `sanitized`, der jede Zahl vor dem Zeichnen begrenzt.
- `lib/src/theme/` — `GlassThemeData` (eine `ThemeExtension`), `GlassTheme` (ein `InheritedTheme`) und `ResolvedGlass`, das Theme, die Bedienungshilfen-Flags der Plattform und die eigenen Einstellungen eines Widgets zu dem zusammenführt, was gezeichnet wird.
- `lib/src/rendering/` — die Painter für Tönung, Randlicht und Schatten; der Schatten wird abgeschnitten, damit er nie durch das Glas scheint.
- `lib/src/widgets/` — `GlassSurface` (Beschnitt, `BackdropFilter`, Painter), `GlassGroup`, `AnimatedGlassSurface` sowie die darauf aufbauenden Steuerelemente und Leisten.
- `lib/src/contrast/` — `GlassContrast`, reine Funktionen mit begrenzter Eingabe.
- `example/` — die Galerie-App, die über `path: ..` von diesem Checkout abhängt.

Führe die Prüfungen lokal aus:

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## Roadmap

- Ein Brechungseffekt, der mit einem Fragment-Shader gezeichnet wird, wo Impeller `ImageFilter.shader` unterstützt; der aktuelle Weichzeichner dient als Fallback.
- Begrenzter Weichzeichner, sobald ein begrenzter `ImageFilterConfig.blur` in scrollenden Listen den richtigen Bereich abtastet.
- Glas-Versionen von `SegmentedButton`, `Switch` und `SearchBar`.

## Mitwirken

Beiträge sind willkommen. Lies vor einem Pull Request den [Leitfaden für Beiträge](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md) und den [Verhaltenskodex](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md). Sicherheitsprobleme meldest du vertraulich, wie in der [Sicherheitsrichtlinie](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md) beschrieben.

## Lizenz

Veröffentlicht unter der MIT-Lizenz. Siehe [LICENSE](LICENSE).
