<!-- i18n-source: README.md@cef284ac4975c00c00f964cf03bad67426eda5af status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI 状态"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="最新版本: v1.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="语言版本: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="语言版本: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="许可证: MIT"></picture></a>
</p>

<p align="center">
<a href="#快速开始"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-zh-CN-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-zh-CN-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-zh-CN-light.svg" alt="开始使用"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-zh-CN-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-zh-CN-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-zh-CN-light.svg" alt="文档"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-zh-CN-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-zh-CN-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-zh-CN-light.svg" alt="示例"></picture></a>
</p>

> 本文是英文 README 的译文。如两者内容不一致，以英文版为准。

<!-- brand:end -->
FlutterGlass 是一个由玻璃质感 widget 组成的 Flutter 软件包：面板、卡片、按钮、app bar、导航栏和底部面板（bottom sheet），它们会对身后滚动的内容进行模糊并叠加色调。它面向希望获得 iOS 半透明外观，同时又不牺牲文字可读性和无障碍支持的应用。当用户要求更高对比度时，表面会变为不透明；对比度辅助工具会计算在给定背景上需要多少色调才能让文字保持可读；样式中的每个数值在到达渲染器之前都会被限制在有效范围内。该软件包只依赖 Flutter 本身；示例应用在 iOS 模拟器上运行，并可为 macOS 构建。

## 亮点

- **天生可读** — `GlassContrast` 使用 WCAG 2.2 公式，找出最低的色调不透明度，使你的文字在从背景中采样的每一种颜色上都达到 4.5:1 的对比度。
- **遵循无障碍设置** — 开启 iOS 的**提高对比度**设置后，玻璃会变为不透明；开启**减弱动态效果**后，按钮按下和样式变化将不再播放动画。
- **三个保真级别** — 完整玻璃、不带模糊的降级级别（不读取背景）以及不透明级别，可按 widget 或为整个应用设置。
- **共享背景读取** — `GlassGroup` 内的表面使用 Flutter 的 `BackdropGroup`，因此 Impeller 只需复制一次身后的屏幕内容，而不是每个表面各复制一次。
- **任何输入都安全** — `GlassStyle` 中的 NaN、无穷大和负值会被映射到有效范围内，模糊半径也有上限，因此滑块或动画过冲不会破坏任何一帧。
- **底层是 Material** — 这些栏封装了 Flutter 的 `AppBar` 和 `NavigationBar`，因此语义、键盘处理和主题的行为与不用玻璃时一致。

## 快速开始

**1. 添加软件包**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

你需要 [Flutter](https://docs.flutter.dev/install) 3.41 或更高版本。

**2. 导入模块**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. 开始使用**

把 `GlassCard` 放在色彩丰富的内容之上；这是一个完整的应用：

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

玻璃会模糊它身后的内容，所以在纯白屏幕上它看起来只是一个浅色方框：请在下面放置图片、渐变或可滚动的内容。

## 安装

该软件包从本仓库安装。在 `pubspec.yaml` 中：

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

然后运行 `flutter pub get`。请为 `ref` 使用标签（tag），这样 `main` 上之后的改动不会影响你的构建。

## 使用方法

### 设置表面样式

`GlassSurface` 是基础构件；`GlassCard` 增加了内边距和可选的点击。从预设开始，再修改你需要的部分：

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

预设有 `GlassStyle.light`（默认）、`dark`、`clear` 和 `frosted`。除非你设置 `corners: GlassCorners.circular`，否则圆角与 iOS 一样是连续曲线。

### 让内容在顶栏和底栏下方滚动

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

导航栏以胶囊形悬浮在主屏幕指示条上方；`floating: false` 则会贴合并横跨整个底部边缘。

### 为浅色和深色模式设置主题

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

没有 `GlassThemeData` 时，玻璃会根据主题的亮度选择浅色或深色预设。

### 保持文字可读

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` 会不断提高色调不透明度，直到白色文字在每一种采样颜色上都达到 4.5:1。`GlassContrast.minimumTintOpacity` 直接返回该数值；如果任何不透明度都不够，则返回 null。

### 选择绘制多少玻璃效果

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` 绘制完整玻璃，并在平台报告高对比度时切换为不透明。`GlassFidelity.reduced` 去掉模糊但保留半透明色调，适用于长列表或较旧的设备。

### 显示玻璃面板

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## 截图

在 iPhone 18 Pro 模拟器（iOS 27）上运行的[示例应用](example)。模糊效果由 Impeller 在应用用代码绘制的背景之上渲染。

| 表面                                                                           | 表面（深色）                                                | 控件                                                                   | 对比度                                                             | 面板                                                      |
| ------------------------------------------------------------------------------ | ----------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------ | --------------------------------------------------------- |
| ![蓝色条纹背景上的玻璃预设、保真级别和圆角样式](docs/screenshots/surfaces.png) | ![同一屏幕使用深色玻璃](docs/screenshots/surfaces-dark.png) | ![玻璃按钮、带动画的表面和一张天气卡片](docs/screenshots/controls.png) | ![显示最差对比度的色调不透明度滑块](docs/screenshots/contrast.png) | ![控件屏幕之上的玻璃底部面板](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) 会构建示例并截取这些屏幕截图。要自己运行示例：

```sh
cd example
flutter run
```

## 文档

[API 参考](https://muhittincamdali.github.io/FlutterGlass/)由 `dart doc` 根据 `lib/` 中的注释生成，并包含下面的指南。

## 指南

- [入门](doc/guides/getting-started.md) — 一步一步介绍卡片、导航栏、预设、主题和面板。
- [无障碍与对比度](doc/guides/accessibility.md) — 保真级别、对比度计算方式，以及控件会播报的内容。
- [性能](doc/guides/performance.md) — 背景模糊的开销，以及 `GlassGroup` 和 `GlassFidelity.reduced` 如何降低它。

## 系统要求

| 工具链 | 最低版本 |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI 在最新的稳定版 Flutter 上运行；测试在 Flutter 3.41.5 上同样通过。

## 架构

- `lib/src/style/` — `GlassStyle`，一个带有 `copyWith`、`lerp` 和 `sanitized` 的不可变值，在绘制前限制每一个数值。
- `lib/src/theme/` — `GlassThemeData`（一个 `ThemeExtension`）、`GlassTheme`（一个 `InheritedTheme`）和 `ResolvedGlass`，后者把主题、平台的无障碍标志和 widget 自身的设置合并为最终绘制的内容。
- `lib/src/rendering/` — 色调、边缘光和阴影的绘制器；阴影会被裁剪，因此永远不会透过玻璃显示出来。
- `lib/src/widgets/` — `GlassSurface`（裁剪、`BackdropFilter`、绘制器）、`GlassGroup`、`AnimatedGlassSurface`，以及构建在它们之上的控件和导航栏。
- `lib/src/contrast/` — `GlassContrast`，输入有界的纯函数。
- `example/` — 画廊应用，通过 `path: ..` 依赖当前检出的代码。

在本地运行检查：

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## 路线图

- 在 Impeller 支持 `ImageFilter.shader` 的平台上，用 fragment shader 绘制折射效果，并以当前的模糊作为后备。
- 有界模糊，待有界的 `ImageFilterConfig.blur` 能在滚动列表内采样到正确区域之后。
- `SegmentedButton`、`Switch` 和 `SearchBar` 的玻璃版本。

## 参与贡献

欢迎参与贡献。提交 pull request 之前，请先阅读[贡献指南](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md)和[行为准则](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md)。如发现安全问题，请按照[安全策略](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md)私下报告。

## 许可证

基于 MIT 许可证发布。详见 [LICENSE](LICENSE)。
