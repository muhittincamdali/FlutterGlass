<!-- i18n-source: README.md@c089c4d1a38ffc459e6b947e6a5516a221d0bc01 status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="Статус CI"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="Последняя версия: v2.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="Версия языка: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="Версия языка: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="Лицензия: MIT"></picture></a>
</p>

<p align="center">
<a href="#быстрый-старт"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ru-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ru-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ru-light.svg" alt="Начать"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ru-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ru-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ru-light.svg" alt="Документация"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ru-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ru-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ru-light.svg" alt="Примеры"></picture></a>
</p>

> Это перевод README на английском языке. Если они расходятся, актуальна английская версия.

<!-- brand:end -->
FlutterGlass — это пакет Flutter со стеклянными виджетами: панели, карточки, кнопки, app bar, панель навигации и нижняя панель (bottom sheet), которые размывают и тонируют всё, что прокручивается за ними. Он предназначен для приложений, которым нужен полупрозрачный вид iOS, но без потери читаемости текста и поддержки доступности. Поверхность становится непрозрачной, когда пользователь просит больше контраста; вспомогательный класс контраста вычисляет, сколько тонировки нужно, чтобы текст оставался читаемым на заданном фоне; а каждое число в стиле ограничивается до того, как попадёт в рендерер. Пакет зависит только от самого Flutter; пример приложения запускается на симуляторе iOS и собирается для macOS.

## Основные возможности

- **Читаемость заложена в дизайн** — `GlassContrast` использует формулы WCAG 2.2, чтобы найти наименьшую непрозрачность тонировки, при которой ваш текст получает контраст 4.5:1 на каждом цвете, который вы выбрали из фона.
- **Учитывает настройки доступности** — при включённой настройке iOS **Увеличение контраста** стекло становится непрозрачным; при включённой настройке **Уменьшение движения** нажатия кнопок и смена стиля перестают анимироваться.
- **Три уровня детализации** — полное стекло, сокращённый уровень без размытия (без чтения фона) и непрозрачный уровень; задаются для отдельного виджета или для всего приложения.
- **Общее чтение фона** — поверхности внутри `GlassGroup` используют `BackdropGroup` из Flutter, поэтому Impeller копирует экран за ними один раз, а не по разу для каждой поверхности.
- **Безопасно при любых входных данных** — NaN, бесконечные и отрицательные значения в `GlassStyle` приводятся к допустимому диапазону, а размытие ограничено сверху, поэтому ползунок или выброс анимации не могут испортить кадр.
- **Внутри — Material** — панели оборачивают `AppBar` и `NavigationBar` из Flutter, поэтому семантика, обработка клавиатуры и темы работают так же, как без стекла.

## Быстрый старт

**1. Добавьте пакет**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

Вам понадобится [Flutter](https://docs.flutter.dev/install) 3.41 или новее.

**2. Импортируйте модуль**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. Используйте**

Поместите `GlassCard` поверх чего-нибудь цветного; это готовое приложение целиком:

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

Стекло размывает то, что находится за ним, поэтому на простом белом экране оно выглядит как бледная коробка: держите под ним изображение, градиент или прокручиваемое содержимое.

## Установка

Пакет устанавливается из этого репозитория. В `pubspec.yaml`:

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

Затем выполните `flutter pub get`. Используйте для `ref` тег, чтобы более позднее изменение в `main` не меняло вашу сборку.

## Использование

### Оформление поверхности

`GlassSurface` — это базовый элемент; `GlassCard` добавляет отступы и необязательное нажатие. Начните с пресета и измените то, что нужно:

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

Доступные пресеты: `GlassStyle.light` (по умолчанию), `dark`, `clear` и `frosted`. Углы непрерывные, как в iOS, если только вы не зададите `corners: GlassCorners.circular`.

### Прокрутка содержимого под панелями

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

Панель навигации парит в виде «таблетки» над индикатором «Домой»; `floating: false` вместо этого растягивает её по всему нижнему краю.

### Тема для светлого и тёмного режима

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

Без `GlassThemeData` стекло выбирает светлый или тёмный пресет по яркости темы.

### Сохранение читаемости текста

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` повышает непрозрачность тонировки, пока белый текст не достигнет 4.5:1 на каждом выбранном цвете. `GlassContrast.minimumTintOpacity` возвращает само число или null, если никакой непрозрачности не хватает.

### Выбор количества отрисовываемого стекла

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` рисует полное стекло и переключается на непрозрачное, когда платформа сообщает о высоком контрасте. `GlassFidelity.reduced` отказывается от размытия, но сохраняет полупрозрачную тонировку; подходит для длинных списков и старых устройств.

### Показ стеклянной панели

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## Скриншоты

[Пример приложения](example) на симуляторе iPhone 18 Pro (iOS 27). Размытие рисует Impeller поверх фона, который приложение создаёт в коде.

| Поверхности                                                                                                    | Поверхности, тёмный режим                                            | Элементы управления                                                                              | Контраст                                                                                                          | Панель                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| ![Стеклянные пресеты, уровни детализации и стили углов на полосатом синем фоне](docs/screenshots/surfaces.png) | ![Тот же экран с тёмным стеклом](docs/screenshots/surfaces-dark.png) | ![Стеклянные кнопки, анимированная поверхность и карточка погоды](docs/screenshots/controls.png) | ![Ползунок непрозрачности тонировки, показывающий наихудшее соотношение контраста](docs/screenshots/contrast.png) | ![Стеклянная нижняя панель поверх экрана с элементами управления](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) собирает пример и делает эти скриншоты. Чтобы запустить пример самостоятельно:

```sh
cd example
flutter run
```

## Документация

[Справочник по API](https://muhittincamdali.github.io/FlutterGlass/) создаётся командой `dart doc` из комментариев в `lib/` и включает приведённые ниже руководства.

## Руководства

- [Начало работы](doc/guides/getting-started.md) — карточка, панели, пресеты, тема и нижняя панель, шаг за шагом.
- [Доступность и контраст](doc/guides/accessibility.md) — уровни детализации, расчёт контраста и то, что озвучивают элементы управления.
- [Производительность](doc/guides/performance.md) — во сколько обходится размытие фона и как `GlassGroup` и `GlassFidelity.reduced` её снижают.

## Требования

| Инструменты | Минимальная версия |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI запускается на последнем стабильном выпуске Flutter; тесты также проходят на Flutter 3.41.5.

## Архитектура

- `lib/src/style/` — `GlassStyle`, неизменяемое значение с `copyWith`, `lerp` и `sanitized`, которое ограничивает каждое число перед отрисовкой.
- `lib/src/theme/` — `GlassThemeData` (`ThemeExtension`), `GlassTheme` (`InheritedTheme`) и `ResolvedGlass`, который объединяет тему, флаги доступности платформы и собственные настройки виджета в то, что будет нарисовано.
- `lib/src/rendering/` — отрисовщики тонировки, светового ободка и тени; тень обрезается, чтобы никогда не просвечивать сквозь стекло.
- `lib/src/widgets/` — `GlassSurface` (обрезка, `BackdropFilter`, отрисовщики), `GlassGroup`, `AnimatedGlassSurface`, а также построенные на них элементы управления и панели.
- `lib/src/contrast/` — `GlassContrast`, чистые функции с ограниченным входом.
- `example/` — приложение-галерея, которое зависит от этой копии через `path: ..`.

Запустите проверки локально:

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## План развития

- Эффект преломления, рисуемый фрагментным шейдером там, где Impeller поддерживает `ImageFilter.shader`; текущее размытие остаётся запасным вариантом.
- Ограниченное размытие — когда ограниченный `ImageFilterConfig.blur` будет захватывать нужную область внутри прокручиваемых списков.
- Стеклянные версии `SegmentedButton`, `Switch` и `SearchBar`.

## Участие в разработке

Мы рады вашему участию. Перед открытием pull request прочитайте [руководство для участников](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md) и [кодекс поведения](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md). О проблемах безопасности сообщайте конфиденциально, как описано в [политике безопасности](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md).

## Лицензия

Распространяется по лицензии MIT. Подробнее — в файле [LICENSE](LICENSE).
