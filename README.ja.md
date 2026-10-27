<!-- i18n-source: README.md@cef284ac4975c00c00f964cf03bad67426eda5af status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI ステータス"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="最新バージョン: v1.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="言語バージョン: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="言語バージョン: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="ライセンス: MIT"></picture></a>
</p>

<p align="center">
<a href="#クイックスタート"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ja-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ja-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ja-light.svg" alt="はじめる"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ja-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ja-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ja-light.svg" alt="ドキュメント"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ja-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ja-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ja-light.svg" alt="サンプル"></picture></a>
</p>

> このドキュメントは英語版 README の翻訳です。内容が異なる場合は英語版が最新です。

<!-- brand:end -->
FlutterGlass は、ガラス表現のウィジェットを集めた Flutter パッケージです。パネル、カード、ボタン、app bar、ナビゲーションバー、ボトムシート（bottom sheet）を含み、背後でスクロールする内容をぼかして色を重ねます。iOS のような半透明の見た目を求めつつ、読みやすいテキストとアクセシビリティ対応を損ないたくないアプリ向けです。ユーザーがより高いコントラストを求めると表面は不透明になり、コントラストのヘルパーは、指定した背景の上でテキストが読める色味の量を計算し、スタイル内のすべての数値はレンダラーに渡る前に範囲内へ収められます。パッケージが依存するのは Flutter 本体だけです。サンプルアプリは iOS シミュレーターで実行し、macOS 向けにビルドしています。

## 主な特長

- **読みやすさを前提に設計** — `GlassContrast` は WCAG 2.2 の計算式を使い、背景からサンプリングしたすべての色の上でテキストが 4.5:1 の比率になる、最小の色味の不透明度を求めます。
- **アクセシビリティ設定に追従** — iOS の**コントラストを上げる**設定がオンのときはガラスが不透明になり、**視差効果を減らす**がオンのときはボタンの押下とスタイルの変化のアニメーションが止まります。
- **3 段階の描画品質** — フルのガラス、ぼかしなし（背景を読み取らない）の簡易レベル、不透明レベルを、ウィジェットごと、またはアプリ全体で設定できます。
- **背景読み取りの共有** — `GlassGroup` 内の表面は Flutter の `BackdropGroup` を使うため、Impeller は表面ごとではなく、背後の画面を 1 回だけコピーします。
- **どんな入力でも安全** — `GlassStyle` の NaN、無限大、負の値は範囲内に変換され、ぼかしにも上限があるため、スライダーやアニメーションの行き過ぎでフレームが壊れることはありません。
- **土台は Material** — バーは Flutter の `AppBar` と `NavigationBar` をラップしているので、セマンティクス、キーボード操作、テーマはガラスなしの場合と同じように動作します。

## クイックスタート

**1. パッケージを追加する**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

[Flutter](https://docs.flutter.dev/install) 3.41 以降が必要です。

**2. モジュールをインポートする**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. 使ってみる**

色鮮やかなものの上に `GlassCard` を置きます。これが完全なアプリです。

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

ガラスは背後にあるものをぼかすので、真っ白な画面の上では淡い色の箱にしか見えません。画像、グラデーション、スクロールする内容を下に置いてください。

## インストール

このパッケージはこのリポジトリからインストールします。`pubspec.yaml` に次のように記述します。

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

その後 `flutter pub get` を実行してください。`ref` にはタグを指定します。そうすれば `main` に後から加えられた変更でビルドが変わることはありません。

## 使い方

### 表面のスタイルを設定する

`GlassSurface` は基本の部品で、`GlassCard` はそれにパディングと任意のタップ処理を加えたものです。プリセットから始めて、必要な部分を変更します。

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

プリセットは `GlassStyle.light`（デフォルト）、`dark`、`clear`、`frosted` です。`corners: GlassCorners.circular` を指定しない限り、角は iOS と同じ連続曲線になります。

### バーの下でコンテンツをスクロールさせる

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

ナビゲーションバーは、ホームインジケーターの上にピル型で浮かびます。`floating: false` にすると、下端いっぱいに広がります。

### ライトモードとダークモードのテーマを設定する

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

`GlassThemeData` がない場合、ガラスはテーマの明るさに応じてライトまたはダークのプリセットを選びます。

### テキストを読みやすく保つ

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle` は、白いテキストがサンプリングしたすべての色の上で 4.5:1 に達するまで、色味の不透明度を上げます。`GlassContrast.minimumTintOpacity` はその数値そのものを返し、どの不透明度でも足りない場合は null を返します。

### どの程度ガラスを描くかを選ぶ

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` はフルのガラスを描画し、プラットフォームが高コントラストを報告したときに不透明へ切り替わります。`GlassFidelity.reduced` はぼかしをやめて半透明の色味だけを残します。長いリストや古い端末向けです。

### ガラスのシートを表示する

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## スクリーンショット

iPhone 18 Pro シミュレーター（iOS 27）上の[サンプルアプリ](example)です。ぼかしは、アプリがコードで描いた背景の上で Impeller によって描画されています。

| 表面 | 表面（ダーク） | コントロール                                                                           | コントラスト                                                                                 | シート                                                                              |
| -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| ![青いストライプの背景の上に並んだガラスのプリセット、描画品質のレベル、角のスタイル](docs/screenshots/surfaces.png) | ![同じ画面をダークのガラスで表示したもの](docs/screenshots/surfaces-dark.png) | ![ガラスのボタン、アニメーションする表面、天気のカード](docs/screenshots/controls.png) | ![最も悪いコントラスト比を表示する、色味の不透明度スライダー](docs/screenshots/contrast.png) | ![コントロール画面の上に表示されたガラスのボトムシート](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) がサンプルをビルドし、これらのスクリーンショットを撮影します。サンプルを自分で実行するには次のようにします。

```sh
cd example
flutter run
```

## ドキュメント

[API リファレンス](https://muhittincamdali.github.io/FlutterGlass/)は、`lib/` 内のコメントから `dart doc` で生成され、以下のガイドを含みます。

## ガイド

- [はじめに](doc/guides/getting-started.md) — カード、バー、プリセット、テーマ、シートを順を追って説明します。
- [アクセシビリティとコントラスト](doc/guides/accessibility.md) — 描画品質のレベル、コントラストの計算方法、各コントロールが読み上げる内容。
- [パフォーマンス](doc/guides/performance.md) — 背景ぼかしのコストと、`GlassGroup` や `GlassFidelity.reduced` でそれを減らす方法。

## 動作要件

| ツールチェーン | 最小バージョン |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI は最新の安定版 Flutter で実行されます。テストは Flutter 3.41.5 でも通ります。

## アーキテクチャ

- `lib/src/style/` — `GlassStyle`。`copyWith`、`lerp`、`sanitized` を持つイミュータブルな値で、描画前にすべての数値を範囲内に収めます。
- `lib/src/theme/` — `GlassThemeData`（`ThemeExtension`）、`GlassTheme`（`InheritedTheme`）、`ResolvedGlass`。`ResolvedGlass` は、テーマ、プラットフォームのアクセシビリティフラグ、ウィジェット自身の設定を組み合わせて、実際に描画される内容にします。
- `lib/src/rendering/` — 色味、縁のライト、影を描くペインターです。影はクリップされるため、ガラスの内側に透けて見えることはありません。
- `lib/src/widgets/` — `GlassSurface`（クリップ、`BackdropFilter`、ペインター）、`GlassGroup`、`AnimatedGlassSurface`、およびそれらの上に作られたコントロールとバー。
- `lib/src/contrast/` — `GlassContrast`。入力に上限のある純粋関数です。
- `example/` — ギャラリーアプリ。`path: ..` でこのチェックアウトに依存しています。

ローカルでチェックを実行するには次のようにします。

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## ロードマップ

- Impeller が `ImageFilter.shader` に対応している環境で、フラグメントシェーダーで描く屈折効果。現在のぼかしをフォールバックとして残します。
- 範囲を限定したぼかし。範囲を限定した `ImageFilterConfig.blur` が、スクロールするリスト内で正しい領域をサンプリングできるようになった時点で対応します。
- `SegmentedButton`、`Switch`、`SearchBar` のガラス版。

## コントリビューション

コントリビューションを歓迎します。pull request を作成する前に[コントリビューションガイド](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md)と[行動規範](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md)をお読みください。セキュリティ上の問題は[セキュリティポリシー](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md)に従って非公開で報告してください。

## ライセンス

MIT ライセンスで公開しています。詳細は [LICENSE](LICENSE) を参照してください。
