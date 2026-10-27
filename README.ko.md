<!-- i18n-source: README.md@cef284ac4975c00c00f964cf03bad67426eda5af status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI 상태"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="최신 버전: v1.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="언어 버전: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="언어 버전: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="라이선스: MIT"></picture></a>
</p>

<p align="center">
<a href="#빠른-시작"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ko-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ko-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-ko-light.svg" alt="시작하기"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ko-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ko-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-ko-light.svg" alt="문서"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ko-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ko-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-ko-light.svg" alt="예제"></picture></a>
</p>

> 이 문서는 영어 README의 번역본입니다. 내용이 다를 경우 영어 버전이 최신입니다.

<!-- brand:end -->
FlutterGlass는 유리 느낌의 위젯으로 이루어진 Flutter 패키지입니다. 패널, 카드, 버튼, app bar, 내비게이션 바, 바텀 시트(bottom sheet)가 포함되어 있으며, 뒤에서 스크롤되는 내용을 흐리게 만들고 색조를 입힙니다. iOS의 반투명한 느낌을 원하면서도 읽기 쉬운 텍스트와 접근성 지원을 포기하고 싶지 않은 앱을 위한 것입니다. 사용자가 더 높은 대비를 요청하면 표면이 불투명해지고, 대비 도우미는 주어진 배경 위에서 텍스트가 읽히려면 색조가 얼마나 필요한지 계산하며, 스타일의 모든 숫자는 렌더러에 도달하기 전에 허용 범위로 제한됩니다. 이 패키지는 Flutter 자체에만 의존하며, 예제 앱은 iOS 시뮬레이터에서 실행하고 macOS용으로 빌드합니다.

## 주요 기능

- **읽기 쉽게 설계** — `GlassContrast`는 WCAG 2.2 공식을 사용해, 배경에서 샘플링한 모든 색 위에서 텍스트가 4.5:1 비율을 얻는 가장 낮은 색조 불투명도를 찾습니다.
- **접근성 설정을 따름** — iOS의 **대비 증가** 설정이 켜져 있으면 유리가 불투명해지고, **동작 줄이기**가 켜져 있으면 버튼 누름과 스타일 변경의 애니메이션이 멈춥니다.
- **세 가지 충실도 수준** — 전체 유리, 블러가 없는(배경을 읽지 않는) 축소 수준, 불투명 수준을 위젯별로 또는 앱 전체에 설정할 수 있습니다.
- **공유되는 배경 읽기** — `GlassGroup` 안의 표면은 Flutter의 `BackdropGroup`을 사용하므로, Impeller가 표면마다 한 번씩이 아니라 뒤의 화면을 한 번만 복사합니다.
- **어떤 입력에도 안전** — `GlassStyle`의 NaN, 무한대, 음수 값은 허용 범위로 변환되고 블러에는 상한이 있어서, 슬라이더나 애니메이션이 범위를 넘어도 프레임이 깨지지 않습니다.
- **아래는 Material** — 바는 Flutter의 `AppBar`와 `NavigationBar`를 감싸므로, 시맨틱, 키보드 처리, 테마가 유리 없이 쓸 때와 똑같이 동작합니다.

## 빠른 시작

**1. 패키지 추가**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

[Flutter](https://docs.flutter.dev/install) 3.41 이상이 필요합니다.

**2. 모듈 가져오기**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. 사용하기**

색이 다채로운 것 위에 `GlassCard`를 올려 보세요. 다음이 완전한 앱입니다.

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

유리는 뒤에 있는 것을 흐리게 하므로, 순백 화면 위에서는 연한 상자처럼 보입니다. 이미지, 그라데이션 또는 스크롤되는 내용을 아래에 두세요.

## 설치

이 패키지는 이 저장소에서 설치합니다. `pubspec.yaml`에 다음과 같이 추가합니다.

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

그다음 `flutter pub get`을 실행하세요. `ref`에는 태그를 사용해야 이후 `main`에 생기는 변경이 빌드에 영향을 주지 않습니다.

## 사용법

### 표면 스타일 지정하기

`GlassSurface`가 기본 구성 요소이고, `GlassCard`는 여기에 패딩과 선택적인 탭 동작을 더한 것입니다. 프리셋에서 시작해 필요한 부분만 바꾸세요.

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

프리셋은 `GlassStyle.light`(기본값), `dark`, `clear`, `frosted`입니다. `corners: GlassCorners.circular`를 지정하지 않으면 모서리는 iOS처럼 연속 곡선입니다.

### 바 아래로 내용 스크롤하기

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

내비게이션 바는 홈 인디케이터 위에 알약 모양으로 떠 있습니다. `floating: false`로 하면 아래쪽 가장자리 전체에 걸쳐 표시됩니다.

### 라이트 모드와 다크 모드 테마 지정하기

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

`GlassThemeData`가 없으면 유리는 테마의 밝기에 따라 라이트 또는 다크 프리셋을 선택합니다.

### 텍스트를 읽기 쉽게 유지하기

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle`은 흰색 텍스트가 샘플링한 각 색 위에서 4.5:1에 이를 때까지 색조 불투명도를 높입니다. `GlassContrast.minimumTintOpacity`는 그 숫자 자체를 반환하며, 어떤 불투명도로도 충분하지 않으면 null을 반환합니다.

### 유리를 얼마나 그릴지 선택하기

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto`는 전체 유리를 그리다가 플랫폼이 고대비를 알리면 불투명으로 전환합니다. `GlassFidelity.reduced`는 블러를 없애되 반투명 색조는 유지하며, 긴 목록이나 오래된 기기에 알맞습니다.

### 유리 시트 표시하기

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## 스크린샷

iPhone 18 Pro 시뮬레이터(iOS 27)에서 실행한 [예제 앱](example)입니다. 블러는 앱이 코드로 그린 배경 위에서 Impeller가 렌더링합니다.

| 표면                                                                                            | 표면, 다크                                                          | 컨트롤                                                                      | 대비                                                                                     | 시트                                                           |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| ![파란 줄무늬 배경 위의 유리 프리셋, 충실도 수준, 모서리 스타일](docs/screenshots/surfaces.png) | ![다크 유리를 적용한 같은 화면](docs/screenshots/surfaces-dark.png) | ![유리 버튼, 애니메이션되는 표면, 날씨 카드](docs/screenshots/controls.png) | ![가장 낮은 대비 비율을 보여 주는 색조 불투명도 슬라이더](docs/screenshots/contrast.png) | ![컨트롤 화면 위의 유리 바텀 시트](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh)가 예제를 빌드하고 이 스크린샷을 찍습니다. 예제를 직접 실행하려면 다음과 같이 하세요.

```sh
cd example
flutter run
```

## 문서

[API 레퍼런스](https://muhittincamdali.github.io/FlutterGlass/)는 `lib/`의 주석을 바탕으로 `dart doc`으로 생성되며, 아래 가이드를 포함합니다.

## 가이드

- [시작하기](doc/guides/getting-started.md) — 카드, 바, 프리셋, 테마, 시트를 단계별로 설명합니다.
- [접근성과 대비](doc/guides/accessibility.md) — 충실도 수준, 대비 계산 방식, 컨트롤이 음성으로 안내하는 내용.
- [성능](doc/guides/performance.md) — 배경 블러의 비용과 `GlassGroup` 및 `GlassFidelity.reduced`로 이를 줄이는 방법.

## 요구 사항

| 툴체인 | 최소 버전 |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI는 최신 안정 Flutter 릴리스에서 실행되며, 테스트는 Flutter 3.41.5에서도 통과합니다.

## 아키텍처

- `lib/src/style/` — `GlassStyle`. `copyWith`, `lerp`, `sanitized`를 갖춘 불변 값이며, 그리기 전에 모든 숫자를 제한합니다.
- `lib/src/theme/` — `GlassThemeData`(`ThemeExtension`), `GlassTheme`(`InheritedTheme`), `ResolvedGlass`. `ResolvedGlass`는 테마, 플랫폼의 접근성 플래그, 위젯 자체 설정을 합쳐 실제로 그려질 내용으로 만듭니다.
- `lib/src/rendering/` — 색조, 테두리 빛, 그림자를 그리는 페인터입니다. 그림자는 잘려서 유리 너머로 비치지 않습니다.
- `lib/src/widgets/` — `GlassSurface`(클립, `BackdropFilter`, 페인터), `GlassGroup`, `AnimatedGlassSurface`, 그리고 이를 바탕으로 만든 컨트롤과 바.
- `lib/src/contrast/` — `GlassContrast`. 입력 범위가 제한된 순수 함수입니다.
- `example/` — 갤러리 앱. `path: ..`로 이 체크아웃에 의존합니다.

로컬에서 검사를 실행하세요.

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## 로드맵

- Impeller가 `ImageFilter.shader`를 지원하는 환경에서 프래그먼트 셰이더로 그리는 굴절 효과. 현재의 블러는 대체 수단으로 남깁니다.
- 범위가 제한된 블러. 범위가 제한된 `ImageFilterConfig.blur`가 스크롤되는 목록 안에서 올바른 영역을 샘플링하게 되면 지원합니다.
- `SegmentedButton`, `Switch`, `SearchBar`의 유리 버전.

## 기여하기

기여를 환영합니다. pull request를 열기 전에 [기여 가이드](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md)와 [행동 강령](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md)을 읽어 주세요. 보안 문제는 [보안 정책](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md)에 따라 비공개로 제보해 주세요.

## 라이선스

MIT 라이선스로 배포됩니다. 자세한 내용은 [LICENSE](LICENSE)를 참고하세요.
