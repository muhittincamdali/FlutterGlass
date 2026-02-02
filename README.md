# FlutterGlass 🪟✨

A premium glassmorphism UI toolkit for Flutter — beautiful frosted glass effects, aurora backgrounds, morphing animations, and production-ready glass widgets.

[![Pub Version](https://img.shields.io/pub/v/flutter_glass)](https://pub.dev/packages/flutter_glass)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.16+-02569B?logo=flutter)](https://flutter.dev)

---

## Why FlutterGlass?

Most glassmorphism packages give you a blurred container and call it a day. FlutterGlass ships a complete design system — themed glass widgets, multi-layer frost effects, aurora gradient backgrounds, shimmer highlights, and morphing card animations. Everything is composable, customizable, and built for production.

---

## Features

| Category | What You Get |
|----------|-------------|
| **Core Theme** | `GlassTheme` — centralized configuration for blur, tint, opacity, border radius |
| **Frost Effects** | `FrostedGlass` — multi-pass gaussian blur with tint overlay |
| **Blur Layer** | `BlurLayer` — stackable blur with saturation and luminosity controls |
| **Aurora Background** | `AuroraBackground` — animated gradient mesh backdrop |
| **Glass Card** | `GlassCard` — the bread-and-butter container widget |
| **Glass Button** | `GlassButton` — tap-responsive frosted button with ink ripple |
| **Glass TextField** | `GlassTextField` — input field with glass styling |
| **Navigation Bar** | `GlassNavigationBar` — bottom nav with frosted backdrop |
| **App Bar** | `GlassAppBar` — sliver-compatible glass app bar |
| **Bottom Sheet** | `GlassBottomSheet` — modal sheet with glass treatment |
| **Morphing Card** | `MorphingCard` — hero-style expand/collapse animation |
| **Shimmer** | `ShimmerGlass` — animated highlight sweep |
| **Custom Painter** | `GlassPainter` — low-level canvas utilities for custom glass effects |

---

## Quick Start

### Installation

```yaml
dependencies:
  flutter_glass: ^1.0.0
```

```bash
flutter pub get
```

### Wrap Your App with GlassTheme

```dart
import 'package:flutter_glass/flutter_glass.dart';

void main() {
  runApp(
    GlassTheme(
      data: GlassThemeData(
        blurSigma: 20.0,
        tintColor: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        borderColor: Colors.white.withOpacity(0.2),
      ),
      child: const MyApp(),
    ),
  );
}
```

### Drop in a GlassCard

```dart
GlassCard(
  padding: const EdgeInsets.all(24),
  child: Column(
    children: [
      const Text(
        'Welcome',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        'This card has a frosted glass effect.',
        style: TextStyle(color: Colors.white70),
      ),
    ],
  ),
)
```

### Aurora Background

```dart
AuroraBackground(
  colors: [
    Color(0xFF6448FE),
    Color(0xFF5FC6FF),
    Color(0xFFFEC85B),
    Color(0xFFFF7EB3),
  ],
  speed: 0.8,
  child: Center(
    child: GlassCard(
      child: Text('Floating on aurora'),
    ),
  ),
)
```

---

## Widget Catalog

### GlassCard

The most versatile widget. Supports custom blur, tint, border, and shadow.

```dart
GlassCard(
  blurSigma: 25,
  tintColor: Colors.blue.withOpacity(0.08),
  borderRadius: BorderRadius.circular(20),
  elevation: 4,
  child: const Padding(
    padding: EdgeInsets.all(20),
    child: Text('Customized Glass'),
  ),
)
```

### GlassButton

```dart
GlassButton(
  onPressed: () => print('tapped'),
  icon: Icons.send,
  label: 'Send Message',
)
```

### GlassTextField

```dart
GlassTextField(
  controller: _controller,
  hintText: 'Type something...',
  prefixIcon: Icons.search,
  onSubmitted: (value) => _search(value),
)
```

### GlassNavigationBar

```dart
GlassNavigationBar(
  currentIndex: _selectedIndex,
  onTap: (index) => setState(() => _selectedIndex = index),
  items: const [
    GlassNavItem(icon: Icons.home, label: 'Home'),
    GlassNavItem(icon: Icons.explore, label: 'Explore'),
    GlassNavItem(icon: Icons.person, label: 'Profile'),
  ],
)
```

### GlassAppBar

```dart
GlassAppBar(
  title: const Text('Settings'),
  leading: const BackButton(),
  actions: [
    IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
)
```

### GlassBottomSheet

```dart
showGlassBottomSheet(
  context: context,
  builder: (context) => GlassBottomSheet(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Choose an option'),
        const SizedBox(height: 16),
        GlassButton(label: 'Option A', onPressed: () {}),
        const SizedBox(height: 8),
        GlassButton(label: 'Option B', onPressed: () {}),
      ],
    ),
  ),
);
```

---

## Animations

### MorphingCard

Expand a card into a full-screen detail view with a smooth hero-style morph.

```dart
MorphingCard(
  collapsed: const GlassCard(
    child: ListTile(
      title: Text('Tap to expand'),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  ),
  expanded: const Scaffold(
    body: Center(child: Text('Expanded Detail')),
  ),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOutCubic,
)
```

### ShimmerGlass

Add a moving highlight across any glass surface.

```dart
ShimmerGlass(
  baseColor: Colors.white.withOpacity(0.05),
  highlightColor: Colors.white.withOpacity(0.15),
  child: GlassCard(
    child: SizedBox(height: 120, width: double.infinity),
  ),
)
```

---

## Advanced Usage

### Custom GlassPainter

Build your own glass shapes by extending `GlassPainter`:

```dart
class DiamondGlass extends GlassPainter {
  @override
  void paintGlass(Canvas canvas, Size size, GlassThemeData theme) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    drawGlassPath(canvas, size, path, theme);
  }
}
```

### Multiple Blur Layers

Stack `BlurLayer` widgets for depth:

```dart
Stack(
  children: [
    BlurLayer(sigma: 40, saturation: 1.2),
    BlurLayer(sigma: 15, tint: Colors.purple.withOpacity(0.05)),
    FrostedGlass(child: myContent),
  ],
)
```

### Theme Overrides per Widget

Every widget accepts optional overrides that take priority over the inherited `GlassTheme`:

```dart
GlassCard(
  blurSigma: 30, // overrides theme
  tintColor: Colors.red.withOpacity(0.1), // overrides theme
  child: Text('Red tinted card'),
)
```

---

## Architecture

```
lib/
├── flutter_glass.dart            # barrel export
└── src/
    ├── core/
    │   └── glass_theme.dart       # InheritedWidget theme
    ├── effects/
    │   ├── frosted_glass.dart     # gaussian blur + tint
    │   ├── blur_layer.dart        # stackable blur
    │   └── aurora_background.dart # animated gradient mesh
    ├── widgets/
    │   ├── glass_card.dart        # container
    │   ├── glass_button.dart      # button
    │   ├── glass_text_field.dart  # input
    │   ├── glass_navigation_bar.dart
    │   ├── glass_app_bar.dart
    │   └── glass_bottom_sheet.dart
    ├── animations/
    │   ├── morphing_card.dart     # expand/collapse
    │   └── shimmer_glass.dart     # highlight sweep
    └── utils/
        └── glass_painter.dart     # canvas helpers
```

---

## Requirements

- Flutter 3.16+
- Dart 3.2+
- iOS 13+ / Android API 21+ / Web / macOS / Windows / Linux

---

## Performance Notes

- Blur is GPU-accelerated via `BackdropFilter` — no bitmap copies
- Aurora animation uses `CustomPainter` with `shouldRepaint` optimization
- Shimmer uses a single `AnimationController` shared across the tree
- All widgets are `const`-constructable where possible

---

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please follow [Conventional Commits](https://www.conventionalcommits.org/) for commit messages.

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## Author

**Muhittin Camdali**
- GitHub: [@muhittincamdali](https://github.com/muhittincamdali)

---

> Built with ❤️ and a lot of blur.
