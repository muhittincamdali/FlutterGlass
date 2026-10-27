<!-- i18n-source: README.md@c089c4d1a38ffc459e6b947e6a5516a221d0bc01 status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="État de la CI"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="Dernière version: v2.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="Version du langage: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="Version du langage: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="Licence: MIT"></picture></a>
</p>

<p align="center">
<a href="#démarrage-rapide"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-fr-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-fr-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-fr-light.svg" alt="Commencer"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-fr-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-fr-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-fr-light.svg" alt="Documentation"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-fr-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-fr-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-fr-light.svg" alt="Exemples"></picture></a>
</p>

> Ceci est une traduction du README anglais. En cas de différence, la version anglaise fait foi.

<!-- brand:end -->
FlutterGlass est un paquet Flutter de widgets en verre : panneaux, cartes, boutons, une app bar, une barre de navigation et une feuille inférieure (bottom sheet) qui floutent et teintent tout ce qui défile derrière eux. Il s’adresse aux applications qui veulent l’aspect translucide d’iOS sans perdre la lisibilité du texte ni la prise en charge de l’accessibilité. Une surface devient opaque lorsque l’utilisateur demande plus de contraste, un utilitaire de contraste calcule la teinte nécessaire pour que le texte reste lisible sur un arrière-plan donné, et chaque nombre d’un style est borné avant d’atteindre le moteur de rendu. Le paquet ne dépend que de Flutter lui-même ; l’application d’exemple s’exécute sur un simulateur iOS et se compile pour macOS.

## Points forts

- **Lisible par conception** — `GlassContrast` utilise les formules de WCAG 2.2 pour trouver l’opacité de teinte la plus basse qui donne à votre texte un rapport de 4.5:1 sur chaque couleur que vous échantillonnez dans l’arrière-plan.
- **Respecte les réglages d’accessibilité** — lorsque le réglage iOS **Augmenter le contraste** est activé, le verre devient opaque ; lorsque **Réduire les animations** est activé, les appuis sur les boutons et les changements de style ne sont plus animés.
- **Trois niveaux de fidélité** — verre complet, un niveau réduit sans flou (aucune lecture de l’arrière-plan) et un niveau opaque, définis par widget ou pour toute l’application.
- **Lectures d’arrière-plan partagées** — les surfaces à l’intérieur d’un `GlassGroup` utilisent le `BackdropGroup` de Flutter, si bien qu’Impeller copie l’écran situé derrière elles une seule fois au lieu d’une fois par surface.
- **Sûr quelle que soit l’entrée** — les valeurs NaN, infinies et négatives d’un `GlassStyle` sont ramenées dans la plage valide et le flou est plafonné, de sorte qu’un curseur ou un dépassement d’animation ne peut pas casser une image.
- **Material en dessous** — les barres enveloppent l’`AppBar` et la `NavigationBar` de Flutter, de sorte que la sémantique, la gestion du clavier et les thèmes fonctionnent comme sans verre.

## Démarrage rapide

**1. Ajouter le paquet**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

Vous avez besoin de [Flutter](https://docs.flutter.dev/install) 3.41 ou plus récent.

**2. Importer le module**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. L’utiliser**

Placez une `GlassCard` au-dessus de quelque chose de coloré ; voici une application complète :

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

Le verre floute ce qui se trouve derrière lui ; sur un écran tout blanc, il ressemble donc à une boîte pâle : gardez une image, un dégradé ou du contenu défilant en dessous.

## Installation

Le paquet s’installe depuis ce dépôt. Dans `pubspec.yaml` :

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

Exécutez ensuite `flutter pub get`. Utilisez un tag pour `ref`, afin qu’une modification ultérieure sur `main` ne change pas votre build.

## Utilisation

### Styliser une surface

`GlassSurface` est la brique de base ; `GlassCard` ajoute une marge intérieure et un appui facultatif. Partez d’un préréglage et modifiez ce dont vous avez besoin :

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

Les préréglages sont `GlassStyle.light` (celui par défaut), `dark`, `clear` et `frosted`. Les coins sont continus, comme sur iOS, sauf si vous définissez `corners: GlassCorners.circular`.

### Laisser le contenu défiler sous les barres

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

La barre de navigation flotte comme une pilule au-dessus de l’indicateur d’accueil ; `floating: false` l’étend à la place sur tout le bord inférieur.

### Définir un thème clair et sombre

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

Sans `GlassThemeData`, le verre choisit le préréglage clair ou sombre selon la luminosité du thème.

### Garder le texte lisible

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` augmente l’opacité de la teinte jusqu’à ce que le texte blanc atteigne 4.5:1 sur chaque couleur échantillonnée. `GlassContrast.minimumTintOpacity` renvoie le nombre lui-même, ou null lorsqu’aucune opacité ne suffit.

### Choisir la quantité de verre à dessiner

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` dessine le verre complet et passe à l’opaque lorsque la plateforme signale un contraste élevé. `GlassFidelity.reduced` supprime le flou mais conserve une teinte translucide, pour les longues listes ou les appareils plus anciens.

### Afficher une feuille en verre

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## Captures d’écran

L’[application d’exemple](example) sur un simulateur d’iPhone 18 Pro (iOS 27). Le flou est rendu par Impeller sur un arrière-plan que l’application dessine en code.

| Surfaces                                                                                                                     | Surfaces, sombre                                                          | Contrôles                                                                                 | Contraste                                                                                                    | Feuille                                                                                           |
| ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- |
| ![Préréglages de verre, niveaux de fidélité et styles de coins sur un arrière-plan bleu rayé](docs/screenshots/surfaces.png) | ![Le même écran avec du verre sombre](docs/screenshots/surfaces-dark.png) | ![Boutons en verre, une surface animée et une carte météo](docs/screenshots/controls.png) | ![Un curseur d’opacité de la teinte qui indique le pire rapport de contraste](docs/screenshots/contrast.png) | ![Une feuille inférieure en verre au-dessus de l’écran des contrôles](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) compile l’exemple et réalise ces captures d’écran. Pour exécuter l’exemple vous-même :

```sh
cd example
flutter run
```

## Documentation

La [référence de l’API](https://muhittincamdali.github.io/FlutterGlass/) est générée avec `dart doc` à partir des commentaires de `lib/` et comprend les guides ci-dessous.

## Guides

- [Premiers pas](doc/guides/getting-started.md) — une carte, des barres, des préréglages, un thème et une feuille, pas à pas.
- [Accessibilité et contraste](doc/guides/accessibility.md) — les niveaux de fidélité, le calcul du contraste et ce que les contrôles annoncent.
- [Performances](doc/guides/performance.md) — ce que coûte un flou d’arrière-plan et comment `GlassGroup` et `GlassFidelity.reduced` le réduisent.

## Prérequis

| Chaîne d’outils | Version minimale |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI s’exécute sur la dernière version stable de Flutter ; les tests passent aussi sur Flutter 3.41.5.

## Architecture

- `lib/src/style/` — `GlassStyle`, une valeur immuable avec `copyWith`, `lerp` et `sanitized`, qui borne chaque nombre avant le dessin.
- `lib/src/theme/` — `GlassThemeData` (une `ThemeExtension`), `GlassTheme` (un `InheritedTheme`) et `ResolvedGlass`, qui combine le thème, les indicateurs d’accessibilité de la plateforme et les réglages propres à un widget pour obtenir ce qui est dessiné.
- `lib/src/rendering/` — les peintres de la teinte, de la lumière de bordure et de l’ombre, laquelle est découpée pour ne jamais transparaître à travers le verre.
- `lib/src/widgets/` — `GlassSurface` (découpe, `BackdropFilter`, peintres), `GlassGroup`, `AnimatedGlassSurface`, ainsi que les contrôles et les barres construits dessus.
- `lib/src/contrast/` — `GlassContrast`, des fonctions pures à entrée bornée.
- `example/` — l’application de galerie, qui dépend de ce checkout avec `path: ..`.

Exécutez les vérifications en local :

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## Feuille de route

- Un effet de réfraction dessiné avec un fragment shader là où Impeller prend en charge `ImageFilter.shader`, avec le flou actuel comme solution de repli.
- Un flou borné, une fois qu’un `ImageFilterConfig.blur` borné échantillonnera la bonne zone dans les listes défilantes.
- Des versions en verre de `SegmentedButton`, `Switch` et `SearchBar`.

## Contribuer

Les contributions sont les bienvenues. Lisez le [guide de contribution](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md) et le [code de conduite](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md) avant d’ouvrir une pull request. Signalez les problèmes de sécurité en privé, comme indiqué dans la [politique de sécurité](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md).

## Licence

Publié sous licence MIT. Voir [LICENSE](LICENSE).
