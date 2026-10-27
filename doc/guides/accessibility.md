# Accessibility and contrast

Translucent surfaces are hard to read for people with low vision, and the text
on them changes contrast as content scrolls behind it. FlutterGlass handles
this in three places: the fidelity level, a contrast calculation and
accessible controls.

## Fidelity: how much glass to draw

Every glass widget has a `fidelity`, taken from the theme when it is not set:

| Fidelity                | Draws                                                        | Backdrop read |
| ----------------------- | ------------------------------------------------------------ | ------------- |
| `GlassFidelity.full`    | Blur, saturation, tint, rim and shadow                       | Yes           |
| `GlassFidelity.reduced` | Tint of at least 0.82 opacity, rim and shadow, no blur       | No            |
| `GlassFidelity.opaque`  | The tint composited over a solid color, rim and shadow       | No            |
| `GlassFidelity.auto`    | `full`, or `opaque` when the platform asks for more contrast | Depends       |

`auto` is the default. It reads `MediaQuery.highContrastOf`, which is true when
the iOS **Increase Contrast** setting is on. Set a fidelity for the whole app
to offer your own "reduce transparency" switch:

```dart
ThemeData(
  extensions: [
    GlassThemeData(
      fidelity: reduceTransparency ? GlassFidelity.opaque : GlassFidelity.auto,
      // The solid color behind opaque glass; null uses ColorScheme.surface.
      fallbackColor: const Color(0xFFF2F6FB),
    ),
  ],
)
```

`reducedTintOpacity` in `GlassThemeData` sets the floor for reduced glass.

## Check the contrast of text on glass

`GlassContrast` implements the WCAG 2.2 relative luminance and contrast ratio.
Because the backdrop moves, give it a sample of the colors that can appear
behind the glass — the brightest and darkest areas of your image or gradient —
and ask for the tint opacity that keeps the text readable over all of them:

```dart
const backdrop = [Color(0xFFEAF4FF), Color(0xFF64D2FF), Color(0xFFFF9F0A)];

final opacity = GlassContrast.minimumTintOpacity(
  foreground: Colors.white,
  tint: const Color(0xFF04111F),
  backdrop: backdrop,
  targetRatio: GlassContrast.aa, // 4.5:1 for body text
);
// null means no tint opacity reaches the target with these colors.
```

`legibleStyle` applies the result to a style and never lowers its tint:

```dart
final style = GlassContrast.legibleStyle(
  GlassStyle.dark,
  foreground: Colors.white,
  backdrop: backdrop,
);
```

The calculation is done in 1/255 steps, the precision of an 8-bit alpha
channel, and checks every step instead of assuming the ratio grows with the
opacity, because it does not when tint and backdrop differ in hue. It accepts
up to `GlassContrast.maxBackdropSamples` (4096) colors and throws an
`ArgumentError` for an empty sample or a target outside 1–21. The ratio covers
the tint over the unblurred colors; blur only mixes the sampled colors, so a
sample that includes the extremes is a safe bound.

`GlassContrast.aaLarge` (3:1) applies to large text and to icons and control
outlines, `GlassContrast.aaa` (7:1) to the stricter level.

## Controls

- `GlassButton` is at least 48 × 48 logical pixels, the minimum tap target of
  both the Android and the iOS guidelines; the tests check both.
- It takes keyboard focus and activates with Enter and Space.
- It is announced as a button with its enabled state; give an icon-only button
  a `semanticLabel`.
- Its press animation, and `AnimatedGlassSurface`, are instant when
  `MediaQuery.disableAnimationsOf` is true (the iOS **Reduce Motion** setting,
  the Android **Remove animations** setting).
- `GlassCard` with `onTap` is announced as a button; `semanticLabel` gives the
  whole card one label.
- `GlassNavigationBar` and `GlassAppBar` are the Material widgets underneath,
  so their semantics and keyboard handling are unchanged.
