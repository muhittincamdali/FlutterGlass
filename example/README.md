# FlutterGlass example

A gallery of the FlutterGlass widgets over a colorful backdrop drawn in code:

- **Surfaces** — the four `GlassStyle` presets, the three fidelity levels and both corner styles.
- **Controls** — `GlassButton` (plain, prominent, disabled, icon), `AnimatedGlassSurface` and a
  `GlassCard` that opens the glass bottom sheet.
- **Contrast** — a tint opacity slider that shows the worst contrast of white text over the
  backdrop's colors, and a button that raises the tint with `GlassContrast.legibleStyle`.

The bars are `GlassAppBar` and `GlassNavigationBar`; the cards of each tab share one backdrop read
through `GlassGroup`.

## Run it

```sh
flutter run
```

`--dart-define=INITIAL_ROUTE=/controls` opens the app on another screen (`/contrast`, or `/sheet`
for the controls tab with the bottom sheet open). Switch the device to dark mode to see
`GlassStyle.dark`, and turn on **Increase Contrast** (iOS) to see every surface turn opaque.

## Check it

```sh
flutter analyze
flutter test
```

CI runs the same checks, and `dart format`, for every push to `main` and every pull request.
`scripts/screenshots.sh` in the repository root takes the README screenshots from this app.
