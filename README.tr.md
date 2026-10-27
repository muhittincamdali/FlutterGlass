<!-- i18n-source: README.md@c089c4d1a38ffc459e6b947e6a5516a221d0bc01 status=reviewed -->
<!-- brand:start -->

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/banner-light.svg" alt="FlutterGlass: Glass surfaces for Flutter: blurred panels, buttons and bars that keep text readable and follow accessibility settings."></picture></p>

<!-- lang-selector:start -->
<p align="center"><a href="README.md">English</a> · <a href="README.tr.md">Türkçe</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.es.md">Español</a> · <a href="README.de.md">Deutsch</a> · <a href="README.fr.md">Français</a> · <a href="README.pt-BR.md">Português (Brasil)</a> · <a href="README.ru.md">Русский</a></p>
<!-- lang-selector:end -->

<p align="center">
<a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml"><img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI durumu"></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/releases"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-version-light.svg" alt="Son sürüm: v2.0.0"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-framework-light.svg" alt="Dil sürümü: Flutter 3.41+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/pubspec.yaml"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-language-light.svg" alt="Dil sürümü: Dart 3.11+"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/blob/main/LICENSE"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/badge-license-light.svg" alt="Lisans: MIT"></picture></a>
</p>

<p align="center">
<a href="#hızlı-başlangıç"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-tr-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-tr-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-start-tr-light.svg" alt="Başlayın"></picture></a>
<a href="https://muhittincamdali.github.io/FlutterGlass/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-tr-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-tr-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-docs-tr-light.svg" alt="Dokümantasyon"></picture></a>
<a href="https://github.com/muhittincamdali/FlutterGlass/tree/main/example"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-tr-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-tr-light.svg"><img src="https://raw.githubusercontent.com/muhittincamdali/FlutterGlass/main/.github/brand/button-examples-tr-light.svg" alt="Örnekler"></picture></a>
</p>

> Bu belge İngilizce README'nin çevirisidir. İkisi arasında fark varsa güncel olan İngilizce sürümdür.

<!-- brand:end -->
FlutterGlass, arkasında kayan her şeyi bulanıklaştıran ve renklendiren cam görünümlü widget'lardan oluşan bir Flutter paketidir: paneller, kartlar, düğmeler, bir app bar, bir navigasyon çubuğu ve bir alt sayfa (bottom sheet) içerir. iOS'un yarı saydam görünümünü isteyen ancak okunabilir metinden ve erişilebilirlik desteğinden vazgeçmek istemeyen uygulamalar için tasarlanmıştır. Kullanıcı daha fazla kontrast istediğinde yüzey opak hale gelir, bir kontrast yardımcısı verilen bir arka plan üzerinde metnin okunabilir kalması için ne kadar renk tonu gerektiğini hesaplar ve bir stildeki her sayı renderer'a ulaşmadan önce sınırlandırılır. Paket yalnızca Flutter'a bağımlıdır; örnek uygulama bir iOS simülatöründe çalıştırılır ve macOS için derlenir.

## Öne çıkanlar

- **Tasarımdan gelen okunabilirlik** — `GlassContrast`, arka plandan örneklediğiniz her renk üzerinde metninize 4.5:1 oranı sağlayan en düşük ton opaklığını bulmak için WCAG 2.2 formüllerini kullanır.
- **Erişilebilirlik ayarlarını izler** — iOS'ta **Kontrastı Artır** ayarı açıkken cam opak olur; **Hareketi Azalt** açıkken düğme basışları ve stil değişiklikleri animasyonu durdurur.
- **Üç kalite düzeyi** — tam cam, bulanıklıksız (arka plan okunmaz) azaltılmış bir düzey ve opak bir düzey; widget başına ya da tüm uygulama için ayarlanır.
- **Paylaşılan arka plan okumaları** — bir `GlassGroup` içindeki yüzeyler Flutter'ın `BackdropGroup` sınıfını kullanır; böylece Impeller arkalarındaki ekranı yüzey başına bir kez yerine tek bir kez kopyalar.
- **Her girdiye karşı güvenli** — bir `GlassStyle` içindeki NaN, sonsuz ve negatif değerler geçerli aralığa çekilir ve bulanıklık üst sınırla kısıtlanır; böylece bir kaydırıcı ya da animasyon taşması kareyi bozamaz.
- **Altta Material** — çubuklar Flutter'ın `AppBar` ve `NavigationBar` widget'larını sarar; böylece semantics, klavye işleme ve temalama cam olmadan nasıl çalışıyorsa öyle çalışır.

## Hızlı başlangıç

**1. Paketi ekleyin**

```sh
flutter pub add "flutter_glass@{git: {url: https://github.com/muhittincamdali/FlutterGlass.git, ref: v2.0.0}}"
```

[Flutter](https://docs.flutter.dev/install) 3.41 veya üstü gerekir.

**2. Modülü içe aktarın**

```dart
import 'package:flutter_glass/flutter_glass.dart';
```

**3. Kullanın**

Renkli bir şeyin üzerine bir `GlassCard` yerleştirin; bu, eksiksiz bir uygulamadır:

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

Cam, arkasındakini bulanıklaştırır; bu yüzden düz beyaz bir ekranda soluk bir kutu gibi görünür: altta bir görsel, bir gradyan ya da kayan içerik bulundurun.

## Kurulum

Paket bu depodan kurulur. `pubspec.yaml` içinde:

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: v2.0.0
```

Ardından `flutter pub get` komutunu çalıştırın. `ref` için bir etiket (tag) kullanın; böylece `main` üzerindeki sonraki bir değişiklik derlemenizi etkilemez.

## Kullanım

### Bir yüzeyi biçimlendirme

`GlassSurface` yapı taşıdır; `GlassCard` iç boşluk ve isteğe bağlı bir dokunma ekler. Hazır bir ayardan başlayın ve ihtiyacınız olanı değiştirin:

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

Hazır ayarlar `GlassStyle.light` (varsayılan), `dark`, `clear` ve `frosted` değerleridir. `corners: GlassCorners.circular` ayarlamadığınız sürece köşeler iOS'taki gibi sürekli eğrilidir.

### İçeriğin çubukların altında kaymasını sağlama

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

Navigasyon çubuğu, ana ekran göstergesinin üstünde hap biçiminde yüzer; `floating: false` ise alt kenarın tamamına yayılır.

### Açık ve koyu modu temalama

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

Bir `GlassThemeData` yoksa cam, temanın parlaklığına göre açık ya da koyu hazır ayarı seçer.

### Metni okunabilir tutma

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  // The lightest and most saturated colors that can appear behind the glass.
  backdrop: const [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)],
);
```

`legibleStyle`, beyaz metin örneklenen her renk üzerinde 4.5:1 oranına ulaşana kadar ton opaklığını artırır. `GlassContrast.minimumTintOpacity` sayının kendisini döndürür; hiçbir opaklık yetmiyorsa null döndürür.

### Ne kadar cam çizileceğini seçme

```dart
GlassThemeData(
  fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
)
```

`auto` tam cam çizer ve platform yüksek kontrast bildirdiğinde opak düzeye geçer. `GlassFidelity.reduced` bulanıklığı bırakır ancak yarı saydam bir ton tutar; uzun listeler ya da eski cihazlar içindir.

### Cam bir sayfa gösterme

```dart
final choice = await showGlassModalBottomSheet<String>(
  context: context,
  builder: (context) => ListTile(
    title: const Text('Share'),
    onTap: () => Navigator.pop(context, 'share'),
  ),
);
```

## Ekran görüntüleri

[Örnek uygulama](example), bir iPhone 18 Pro simülatöründe (iOS 27). Bulanıklığı Impeller, uygulamanın kodla çizdiği bir arka plan üzerinde işler.

| Yüzeyler                                                                                                                      | Yüzeyler, koyu                                                | Kontroller                                                                                     | Kontrast                                                                                         | Sayfa                                                                          |
| ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| ![Çizgili mavi bir arka plan üzerinde cam hazır ayarları, kalite düzeyleri ve köşe stilleri](docs/screenshots/surfaces.png) | ![Aynı ekran, koyu camla](docs/screenshots/surfaces-dark.png) | ![Cam düğmeler, animasyonlu bir yüzey ve bir hava durumu kartı](docs/screenshots/controls.png) | ![En kötü kontrast oranını bildiren bir ton opaklığı kaydırıcısı](docs/screenshots/contrast.png) | ![Kontroller ekranının üzerinde cam bir alt sayfa](docs/screenshots/sheet.png) |

[`scripts/screenshots.sh`](scripts/screenshots.sh) örneği derler ve bu ekran görüntülerini alır. Örneği kendiniz çalıştırmak için:

```sh
cd example
flutter run
```

## Dokümantasyon

[API başvurusu](https://muhittincamdali.github.io/FlutterGlass/), `lib/` içindeki yorumlardan `dart doc` ile oluşturulur ve aşağıdaki rehberleri içerir.

## Rehberler

- [Başlarken](doc/guides/getting-started.md) — bir kart, çubuklar, hazır ayarlar, bir tema ve bir sayfa, adım adım.
- [Erişilebilirlik ve kontrast](doc/guides/accessibility.md) — kalite düzeyleri, kontrast hesabı ve kontrollerin duyurduğu bilgiler.
- [Performans](doc/guides/performance.md) — bir arka plan bulanıklığının maliyeti ve `GlassGroup` ile `GlassFidelity.reduced` bunu nasıl azaltır.

## Gereksinimler

| Araç zinciri | En düşük sürüm |
| --------- | --------------- |
| Flutter   | 3.41            |
| Dart      | 3.11            |

CI en son kararlı Flutter sürümünde çalışır; testler Flutter 3.41.5 üzerinde de geçer.

## Mimari

- `lib/src/style/` — `GlassStyle`; `copyWith`, `lerp` ve `sanitized` içeren değiştirilemez bir değerdir ve çizimden önce her sayıyı sınırlandırır.
- `lib/src/theme/` — `GlassThemeData` (bir `ThemeExtension`), `GlassTheme` (bir `InheritedTheme`) ve `ResolvedGlass`; temayı, platformun erişilebilirlik bayraklarını ve bir widget'ın kendi ayarlarını çizilecek sonuca dönüştürür.
- `lib/src/rendering/` — ton, kenar ışığı ve gölge için çizicilerdir; gölge kırpılır, böylece camın içinden asla görünmez.
- `lib/src/widgets/` — `GlassSurface` (kırpma, `BackdropFilter`, çizicilar), `GlassGroup`, `AnimatedGlassSurface` ve bunların üzerine kurulan kontroller ile çubuklar.
- `lib/src/contrast/` — `GlassContrast`; sınırlı girdili saf fonksiyonlar.
- `example/` — galeri uygulaması; bu checkout'a `path: ..` ile bağımlıdır.

Kontrolleri yerelde çalıştırın:

```sh
flutter analyze && flutter test
cd example && flutter analyze && flutter test
```

## Yol haritası

- Impeller'ın `ImageFilter.shader` desteklediği yerlerde fragment shader ile çizilen bir kırılma efekti; yedek olarak mevcut bulanıklık kalır.
- Sınırlı bulanıklık; sınırlı bir `ImageFilterConfig.blur`, kaydırılan listelerde doğru alanı örneklediğinde.
- `SegmentedButton`, `Switch` ve `SearchBar` için cam sürümleri.

## Katkıda bulunma

Katkılarınızı bekliyoruz. Pull request açmadan önce [katkı rehberini](https://github.com/muhittincamdali/FlutterGlass/blob/main/CONTRIBUTING.md) ve [davranış kurallarını](https://github.com/muhittincamdali/.github/blob/main/CODE_OF_CONDUCT.md) okuyun. Güvenlik açıklarını [güvenlik politikasında](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md) anlatıldığı gibi gizli olarak bildirin.

## Lisans

MIT lisansıyla yayımlanmıştır. Ayrıntılar için [LICENSE](LICENSE) dosyasına bakın.
