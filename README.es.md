<!-- i18n-source: README.md@cef284ac4975c00c00f964cf03bad67426eda5af status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="Estado de CI"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="Última versión: v1.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="Versión del lenguaje: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="Versión del lenguaje: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="Licencia: MIT"></picture></a>
</p>

<p align="center">
<a href="#inicio-rápido"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-es-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-es-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-es-light.svg" alt="Empezar"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-es-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-es-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-es-light.svg" alt="Documentación"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-es-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-es-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-es-light.svg" alt="Ejemplos"></picture></a>
</p>

> Esta es una traducción del README en inglés. Si hay diferencias, la versión en inglés es la vigente.

<!-- brand:end -->
FlutterGlass es un paquete de Flutter con widgets de cristal: paneles, tarjetas, botones, una app bar, una barra de navegación y una hoja inferior (bottom sheet) que desenfocan y tiñen todo lo que se desplaza detrás de ellos. Está pensado para apps que quieren el aspecto translúcido de iOS sin perder la legibilidad del texto ni la compatibilidad con la accesibilidad. Una superficie se vuelve opaca cuando el usuario pide más contraste, un auxiliar de contraste calcula cuánto tinte mantiene legible el texto sobre un fondo dado, y cada número de un estilo se limita antes de llegar al renderizador. El paquete depende únicamente de Flutter; la app de ejemplo se ejecuta en un simulador de iOS y se compila para macOS.

## Lo más destacado

- **Legible por diseño** — `GlassContrast` usa las fórmulas de WCAG 2.2 para encontrar la opacidad de tinte más baja que da a tu texto una relación de 4.5:1 sobre cada color que muestrees del fondo.
- **Respeta los ajustes de accesibilidad** — con el ajuste **Aumentar contraste** de iOS activado, el cristal se vuelve opaco; con **Reducir movimiento** activado, las pulsaciones de botones y los cambios de estilo dejan de animarse.
- **Tres niveles de fidelidad** — cristal completo, un nivel reducido sin desenfoque (sin leer el fondo) y un nivel opaco, que se definen por widget o para toda la app.
- **Lecturas de fondo compartidas** — las superficies dentro de un `GlassGroup` usan el `BackdropGroup` de Flutter, de modo que Impeller copia la pantalla que hay detrás una sola vez en lugar de una vez por superficie.
- **Seguro con cualquier entrada** — los valores NaN, infinitos y negativos de un `GlassStyle` se ajustan al rango válido y el desenfoque tiene un tope, así que un control deslizante o el exceso de una animación no pueden romper un fotograma.
- **Material por debajo** — las barras envuelven el `AppBar` y el `NavigationBar` de Flutter, así que la semántica, el manejo del teclado y los temas funcionan igual que sin cristal.

## Inicio rápido

**1. Añade el paquete**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

Necesitas [Flutter](https://docs.flutter.dev/install) 3.41 o posterior.

**2. Importa el módulo**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. Úsalo**

Pon un `GlassCard` sobre algo colorido; esta es una app completa:

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

El cristal desenfoca lo que hay detrás, así que sobre una pantalla blanca lisa parece una caja pálida: mantén debajo una imagen, un degradado o contenido que se desplace.

## Instalación

El paquete se instala desde este repositorio. En `pubspec.yaml`:

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

Después ejecuta `flutter pub get`. Usa una etiqueta (tag) para `ref`, de modo que un cambio posterior en `main` no altere tu compilación.

## Uso

### Dar estilo a una superficie

`GlassSurface` es el bloque de construcción; `GlassCard` añade relleno y un toque opcional. Parte de un preajuste y cambia lo que necesites:

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

Los preajustes son `GlassStyle.light` (el predeterminado), `dark`, `clear` y `frosted`. Las esquinas son continuas, como en iOS, a menos que establezcas `corners: GlassCorners.circular`.

### Dejar que el contenido se desplace bajo las barras

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

La barra de navegación flota como una píldora sobre el indicador de inicio; con `floating: false` ocupa todo el borde inferior.

### Aplicar un tema claro y oscuro

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

Sin un `GlassThemeData`, el cristal elige el preajuste claro u oscuro según el brillo del tema.

### Mantener el texto legible

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` sube la opacidad del tinte hasta que el texto blanco alcanza 4.5:1 sobre cada color muestreado. `GlassContrast.minimumTintOpacity` devuelve el número en sí, o null cuando ninguna opacidad es suficiente.

### Elegir cuánto cristal dibujar

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` dibuja cristal completo y cambia a opaco cuando la plataforma indica contraste alto. `GlassFidelity.reduced` elimina el desenfoque pero conserva un tinte translúcido, para listas largas o dispositivos antiguos.

### Mostrar una hoja de cristal

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## Capturas de pantalla

La [app de ejemplo](example) en un simulador de iPhone 18 Pro (iOS 27). El desenfoque lo renderiza Impeller sobre un fondo que la app dibuja con código.

| Superficies                                                                                                                    | Superficies, oscuro                                                         | Controles                                                                                             | Contraste                                                                                                              | Hoja                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| ![Preajustes de cristal, niveles de fidelidad y estilos de esquina sobre un fondo azul a rayas](docs/screenshots/surfaces.png) | ![La misma pantalla con cristal oscuro](docs/screenshots/surfaces-dark.png) | ![Botones de cristal, una superficie animada y una tarjeta del tiempo](docs/screenshots/controls.png) | ![Un control deslizante de opacidad del tinte que indica la peor relación de contraste](docs/screenshots/contrast.png) | ![Una hoja inferior de cristal sobre la pantalla de controles](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) compila el ejemplo y hace estas capturas. Para ejecutar el ejemplo tú mismo:

```sh
cd example
flutter run
```

## Documentación

La [referencia de la API](https://muhittincamdali.github.io/FlutterGlass/) se genera con `dart doc` a partir de los comentarios de `lib/` e incluye las guías de abajo.

## Guías

- [Primeros pasos](doc/guides/getting-started.md) — una tarjeta, barras, preajustes, un tema y una hoja, paso a paso.
- [Accesibilidad y contraste](doc/guides/accessibility.md) — los niveles de fidelidad, el cálculo del contraste y lo que anuncian los controles.
- [Rendimiento](doc/guides/performance.md) — cuánto cuesta un desenfoque de fondo y cómo lo reducen `GlassGroup` y `GlassFidelity.reduced`.

## Requisitos

| Herramientas | Versión mínima |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI se ejecuta en la última versión estable de Flutter; las pruebas también pasan en Flutter 3.41.5.

## Arquitectura

- `lib/src/style/` — `GlassStyle`, un valor inmutable con `copyWith`, `lerp` y `sanitized`, que limita cada número antes de pintar.
- `lib/src/theme/` — `GlassThemeData` (una `ThemeExtension`), `GlassTheme` (un `InheritedTheme`) y `ResolvedGlass`, que combina el tema, los indicadores de accesibilidad de la plataforma y los ajustes propios de un widget en lo que se pinta.
- `lib/src/rendering/` — los pintores del tinte, la luz del borde y la sombra, que se recorta para que nunca se vea a través del cristal.
- `lib/src/widgets/` — `GlassSurface` (recorte, `BackdropFilter`, pintores), `GlassGroup`, `AnimatedGlassSurface`, y los controles y barras construidos sobre ellos.
- `lib/src/contrast/` — `GlassContrast`, funciones puras con entrada acotada.
- `example/` — la app de galería, que depende de esta copia con `path: ..`.

Ejecuta las comprobaciones en local:

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## Hoja de ruta

- Un efecto de refracción dibujado con un fragment shader donde Impeller admita `ImageFilter.shader`, con el desenfoque actual como alternativa.
- Desenfoque acotado, cuando un `ImageFilterConfig.blur` acotado muestree el área correcta dentro de listas con desplazamiento.
- Versiones de cristal de `SegmentedButton`, `Switch` y `SearchBar`.

## Contribuir

Las contribuciones son bienvenidas. Lee la [guía de contribución](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md) y el [código de conducta](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md) antes de abrir una pull request. Informa de los problemas de seguridad de forma privada, como se describe en la [política de seguridad](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md).

## Licencia

Publicado bajo la licencia MIT. Consulta [LICENSE](LICENSE).
