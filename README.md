<h1 align="center">FlutterGlass</h1>

<p align="center">
  <strong>🧊 Premium glassmorphism & aurora UI kit for Flutter</strong>
</p>

<p align="center">
  <a href="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml">
    <img src="https://github.com/muhittincamdali/FlutterGlass/actions/workflows/ci.yml/badge.svg" alt="CI"/>
  </a>
  <a href="https://pub.dev/packages/flutter_glass">
    <img src="https://img.shields.io/badge/pub.dev-flutter__glass-blue?style=flat-square&logo=dart" alt="pub.dev"/>
  </a>
  <img src="https://img.shields.io/badge/Flutter-3.24-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter 3.24"/>
  <img src="https://img.shields.io/badge/Dart-3.5-0175C2?style=flat-square&logo=dart&logoColor=white" alt="Dart 3.5"/>
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web-lightgrey?style=flat-square" alt="Platform"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"/>
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#components">Components</a> •
  <a href="#contributing">Contributing</a>
</p>

---

## 📋 Table of Contents

- [Why FlutterGlass?](#why-flutterglass)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Components](#components)
  - [GlassCard](#glasscard)
  - [GlassButton](#glassbutton)
  - [GlassNavBar](#glassnavbar)
  - [AuroraBackground](#aurorabackground)
  - [MeshGradient](#meshgradient)
- [Customization](#customization)
- [Performance](#performance)
- [Contributing](#contributing)
- [License](#license)
- [Star History](#-star-history)

---

## Why FlutterGlass?

Glassmorphism is beautiful but hard to implement correctly. **FlutterGlass** provides production-ready glass effects with performance optimizations and consistent look across platforms.

```dart
// Frosted glass card in seconds
GlassCard(
  blur: 10,
  opacity: 0.2,
  child: Text('Beautiful glass effect'),
)

// Stunning aurora background
AuroraBackground(
  colors: [Colors.purple, Colors.blue, Colors.teal],
  child: YourContent(),
)
```

## Features

| Feature | Description |
|---------|-------------|
| 🧊 **Glass Effects** | Blur, frost, tint with GPU acceleration |
| 🌈 **Aurora** | Animated gradient backgrounds |
| ✨ **Glow** | Neon and soft glows |
| 🎨 **Gradients** | Mesh and radial gradients |
| 📱 **Adaptive** | iOS/Android/Web optimized |
| ⚡ **Performant** | GPU-accelerated rendering |
| 🎯 **Customizable** | Every property configurable |
| 🧪 **Tested** | Comprehensive test coverage |

## Requirements

| Requirement | Version |
|-------------|---------|
| Flutter | 3.24+ |
| Dart | 3.5+ |
| iOS | 12.0+ |
| Android | API 21+ |

## Installation

### pub.dev

```yaml
dependencies:
  flutter_glass: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Git

```yaml
dependencies:
  flutter_glass:
    git:
      url: https://github.com/muhittincamdali/FlutterGlass.git
      ref: main
```

## Quick Start

```dart
import 'package:flutter_glass/flutter_glass.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuroraBackground(
      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
      child: Center(
        child: GlassCard(
          blur: 10,
          opacity: 0.2,
          borderRadius: 20,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Hello Glass!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Components

### GlassCard

```dart
GlassCard(
  blur: 10,
  opacity: 0.2,
  borderRadius: 20,
  border: GlassBorder(
    width: 1,
    color: Colors.white.withOpacity(0.3),
  ),
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Text('Glass Card'),
  ),
)
```

### GlassButton

```dart
GlassButton(
  onPressed: () => print('Pressed!'),
  blur: 5,
  child: Text('Press Me'),
)
```

### GlassNavBar

```dart
GlassNavBar(
  items: [
    GlassNavItem(icon: Icons.home, label: 'Home'),
    GlassNavItem(icon: Icons.search, label: 'Search'),
    GlassNavItem(icon: Icons.person, label: 'Profile'),
  ],
  currentIndex: 0,
  onTap: (index) => setState(() => _currentIndex = index),
)
```

### AuroraBackground

```dart
AuroraBackground(
  colors: [
    Color(0xFF667EEA),
    Color(0xFF764BA2),
    Color(0xFFF093FB),
  ],
  speed: 0.5,
  child: Scaffold(
    backgroundColor: Colors.transparent,
    body: YourContent(),
  ),
)
```

### MeshGradient

```dart
MeshGradient(
  colors: [
    [Colors.red, Colors.orange],
    [Colors.purple, Colors.blue],
  ],
  child: YourContent(),
)
```

## Customization

```dart
GlassCard(
  // Blur intensity (0-50)
  blur: 15,
  
  // Background opacity (0-1)
  opacity: 0.1,
  
  // Tint color
  tint: Colors.blue,
  
  // Border styling
  border: GlassBorder(
    width: 2,
    gradient: LinearGradient(
      colors: [Colors.white54, Colors.white10],
    ),
  ),
  
  // Shadow
  shadow: GlassShadow(
    color: Colors.black26,
    blurRadius: 20,
  ),
  
  child: YourContent(),
)
```

## Performance

```dart
// Enable caching for static glass elements
GlassCard(
  cacheExtent: true,
  child: StaticContent(),
)

// Reduce blur on low-end devices
GlassCard(
  blur: Platform.isAndroid ? 5 : 10,
  child: Content(),
)

// Use RepaintBoundary for complex layouts
RepaintBoundary(
  child: GlassCard(...),
)
```

## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

FlutterGlass is released under the MIT License. See [LICENSE](LICENSE) for details.

---

## 📈 Star History

<a href="https://star-history.com/#muhittincamdali/FlutterGlass&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=muhittincamdali/FlutterGlass&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=muhittincamdali/FlutterGlass&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=muhittincamdali/FlutterGlass&type=Date" />
 </picture>
</a>

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/muhittincamdali">Muhittin Camdali</a>
</p>
