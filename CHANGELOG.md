# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2026-10-27

Version 2.0.0 is a rewrite. The 1.x sources did not pass `flutter analyze` on Flutter 3.41 or
3.47 (53 errors, most of them in the tests), so none of their API could be used; it has been
removed rather than kept for compatibility.

### Added

- `GlassStyle`, an immutable value for blur, tint, saturation, corners, rim light and shadows,
  with `copyWith`, `lerp`, value equality and the presets `light`, `dark`, `clear` and
  `frosted`. `sanitized()` maps NaN, infinite and negative numbers into range and caps the blur
  at 64, the rim at 8 px, corner radii at 1000 and the shadows at four.
- `GlassThemeData` (a `ThemeExtension`) and `GlassTheme` (an `InheritedTheme`), with the light
  or dark preset chosen from the theme's brightness when no style is set.
- `GlassFidelity`: `full`, `reduced` (no blur, tint of at least 0.82) and `opaque`; `auto` turns
  opaque when `MediaQuery.highContrastOf` is true.
- `GlassContrast`: WCAG 2.2 relative luminance and contrast ratio, `minimumTintOpacity` over a
  sample of backdrop colors (at most 4096) and `legibleStyle`.
- `GlassSurface`, `GlassGroup` (shared backdrop reads through `BackdropGroup`) and
  `AnimatedGlassSurface`, which does not animate when the platform asks to reduce motion.
- `GlassButton` and `GlassButton.prominent`, at least 48 × 48, focusable, keyboard-activated and
  announced with their enabled state; `GlassCard` with an optional tap and long press.
- `GlassAppBar`, `GlassNavigationBar` (floating or full width; an out-of-range index selects the
  nearest destination) and `showGlassModalBottomSheet`.
- An example gallery app for iOS, Android and macOS, `scripts/screenshots.sh`, three guides
  and an API reference built with `dart doc`.

### Removed

- Every 1.x widget, effect, animation and theme class.

## [1.0.0] - 2026-02-03

- First release.

[Unreleased]: https://github.com/muhittincamdali/FlutterGlass/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/muhittincamdali/FlutterGlass/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/muhittincamdali/FlutterGlass/releases/tag/v1.0.0
