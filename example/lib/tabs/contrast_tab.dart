import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/gallery.dart';

/// Checks white text on a dark tint against the backdrop's brightest colors.
class ContrastTab extends StatefulWidget {
  /// Creates the tab.
  const ContrastTab({super.key});

  /// Colors sampled from the light backdrop, its brightest areas first.
  static const backdropSample = [
    Color(0xFFEAF4FF),
    Color(0xFF64D2FF),
    Color(0xFF30D158),
    Color(0xFFFF9F0A),
    Color(0xFF9CC9FF),
  ];

  @override
  State<ContrastTab> createState() => _ContrastTabState();
}

class _ContrastTabState extends State<ContrastTab> {
  static const _text = Colors.white;
  static const _tint = Color(0xFF04111F);
  double _opacity = 0.2;

  GlassStyle get _style => GlassStyle.light.copyWith(tint: _tint, tintOpacity: _opacity);

  double get _worstRatio {
    final layer = _style.effectiveTint;
    return ContrastTab.backdropSample
        .map((color) => GlassContrast.contrastRatio(_text, Color.alphaBlend(layer, color)))
        .reduce((a, b) => a < b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    final ratio = _worstRatio;
    final passes = ratio >= GlassContrast.aa;
    return GalleryList(
      children: [
        GlassSurface(
          style: _style,
          padding: const EdgeInsets.all(20),
          child: const Text(
            'White text on a dark tint. Is it readable over every color behind it?',
            style: TextStyle(color: _text, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SectionTitle('Tint opacity'),
        GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: _opacity,
                label: _opacity.toStringAsFixed(2),
                onChanged: (value) => setState(() => _opacity = value),
              ),
              Text(
                'Worst contrast ${ratio.toStringAsFixed(2)}:1 — '
                '${passes ? 'passes' : 'fails'} WCAG AA (4.5:1)',
                key: const Key('ratio'),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              GlassButton.prominent(
                key: const Key('fix'),
                onPressed: passes ? null : _makeLegible,
                child: const Text('Make it legible'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _makeLegible() {
    final legible = GlassContrast.legibleStyle(_style, foreground: _text, backdrop: ContrastTab.backdropSample);
    setState(() => _opacity = legible.tintOpacity);
  }
}
