# Contributing

Thanks for taking the time to improve FlutterGlass.

## Reporting bugs

Open an issue with:

- the widget and the `GlassStyle` or `GlassThemeData` you used,
- what you expected and what you saw (a screenshot helps: glass bugs are usually visual),
- `flutter --version`, the platform and device or simulator, and whether Impeller is on.

Report security issues privately as described in the
[security policy](https://github.com/muhittincamdali/.github/blob/main/SECURITY.md).

## Pull requests

1. Fork the repository and branch from `main`.
2. Keep each pull request focused on one change.
3. Run the checks:

   ```sh
   dart format --output=none --set-exit-if-changed .
   flutter analyze
   flutter test
   cd example && flutter analyze && flutter test
   ```

4. Add or update a test for every change in behaviour: values and clamping in `test/style/`,
   contrast math in `test/contrast/`, theme resolution in `test/theme/`, painters in
   `test/rendering/` and widgets in `test/widgets/`.
5. If you change a code sample in `README.md`, change its copy in `test/readme_test.dart`.
6. If a change is visible in the example, run `scripts/screenshots.sh` on a Mac with Xcode and
   commit the new images in `docs/screenshots/`.
7. Add a line under "Unreleased" in `CHANGELOG.md`.

## Code style

- Follow [Effective Dart](https://dart.dev/effective-dart); `analysis_options.yaml` enables the
  extra lints the package uses, and lines are up to 120 characters.
- Document every public member with `///` comments; `dart doc` fails on unresolved references.
- Accept any number in public APIs and clamp it before painting, as `GlassStyle.sanitized` does;
  bound the size of every list a function iterates.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/)
  (`feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `ci:`, `chore:`).
