# Performance

A backdrop blur is one of the more expensive things Flutter draws. This guide
explains where the cost comes from and the four settings that reduce it.

## What a glass surface costs

With `GlassFidelity.full` and a blur above 0, each `GlassSurface` contains a
`BackdropFilter`. To draw it, the engine copies the part of the screen behind
the surface, blurs the copy and draws the tint and the child over it. The blur
is a Gaussian kernel whose size grows with the sigma, and the copy breaks the
GPU's render pass. Several surfaces mean several copies.

Everything else a surface draws — tint, rim, shadow — is an ordinary path and
costs about as much as a `DecoratedBox`.

## 1. Share one backdrop with GlassGroup

On Impeller, `BackdropFilter`s that share a backdrop key are drawn from one
copy of the screen. `GlassGroup` provides the key to every `GlassSurface`
below it:

```dart
GlassGroup(
  child: ListView(
    children: [
      for (final item in items) GlassCard(child: Text(item.title)),
    ],
  ),
)
```

Surfaces in one group must not overlap each other: they all see the backdrop
as it was before any of them was drawn. Keep bars that content scrolls under
(`GlassAppBar`, `GlassNavigationBar`) outside the group, as the example app
does, so they still see the cards passing behind them.

## 2. Lower the blur

`blurSigma` is capped at `GlassStyle.maxBlurSigma` (64). A sigma between 12 and
30 already hides the detail of most backgrounds; `GlassStyle.clear` uses 6.

`saturation: 1` removes the color filter that runs after the blur.

## 3. Turn the blur off where it is not seen

`GlassFidelity.reduced` keeps the tint, rim and shadow but drops the
`BackdropFilter`, so it costs no backdrop copy. Use it for:

- long lists where many surfaces are on screen at once,
- surfaces over a flat or slowly changing background, where the blur is barely
  visible,
- low-end devices, chosen once at startup:

```dart
GlassThemeData(fidelity: lowEndDevice ? GlassFidelity.reduced : GlassFidelity.auto)
```

A `blurSigma` of 0 skips the `BackdropFilter` too, at any fidelity.

## Measure

Profile on a device, not the simulator, with `flutter run --profile` and the
DevTools performance view. The raster thread's frame time is the number a
backdrop blur changes; compare it with and without `GlassGroup` or
`GlassFidelity.reduced` on the screens that use the most glass.
