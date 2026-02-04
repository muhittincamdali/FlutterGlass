<p align="center">
  <img src="assets/logo.png" alt="FlutterGlass" width="200"/>
</p>

<h1 align="center">FlutterGlass</h1>

<p align="center">
  <strong>🧊 Premium glassmorphism & aurora UI kit for Flutter</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.24-blue.svg" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.5-blue.svg" alt="Dart"/>
</p>

---

## Why FlutterGlass?

Glassmorphism is beautiful but hard to implement correctly. **FlutterGlass** provides production-ready glass effects with performance optimizations.

```dart
// Frosted glass card
GlassCard(
  blur: 10,
  opacity: 0.2,
  child: Text('Beautiful glass effect'),
)

// Aurora background
AuroraBackground(
  colors: [Colors.purple, Colors.blue, Colors.teal],
  child: content,
)
```

## Features

| Feature | Description |
|---------|-------------|
| 🧊 **Glass Effects** | Blur, frost, tint |
| 🌈 **Aurora** | Animated gradient backgrounds |
| ✨ **Glow** | Neon and soft glows |
| 🎨 **Gradients** | Mesh and radial gradients |
| 📱 **Adaptive** | iOS/Android optimized |
| ⚡ **Performant** | GPU-accelerated |

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
  onPressed: () {},
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
    GlassNavItem(icon: Icons.profile, label: 'Profile'),
  ],
  currentIndex: 0,
  onTap: (index) {},
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
    body: content,
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
  child: content,
)
```

## Customization

```dart
GlassCard(
  // Blur intensity
  blur: 15,
  
  // Background opacity
  opacity: 0.1,
  
  // Tint color
  tint: Colors.blue,
  
  // Border
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
)
```

## Performance

```dart
// Enable caching for static glass
GlassCard(
  cacheExtent: true,
  child: staticContent,
)

// Reduce blur for low-end devices
GlassCard(
  blur: Platform.isAndroid ? 5 : 10,
)
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT License
