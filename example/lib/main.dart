import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/gallery.dart';

/// The screen the app opens on: `/`, `/controls`, `/contrast` or `/sheet`.
/// The screenshot script sets it with `--dart-define=INITIAL_ROUTE=…`.
const String initialRoute = String.fromEnvironment('INITIAL_ROUTE', defaultValue: '/');

void main() {
  runApp(const GlassGalleryApp(initialRoute: initialRoute));
}

/// The FlutterGlass gallery: surfaces, controls and a contrast checker.
class GlassGalleryApp extends StatelessWidget {
  /// Creates the gallery, opened on [initialRoute].
  const GlassGalleryApp({super.key, this.initialRoute = '/'});

  /// See [GalleryRoute.parse].
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF0A84FF);
    return MaterialApp(
      title: 'FlutterGlass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        extensions: const [GlassThemeData(style: GlassStyle.light)],
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        extensions: const [GlassThemeData(style: GlassStyle.dark)],
      ),
      home: GalleryPage(route: GalleryRoute.parse(initialRoute)),
    );
  }
}
