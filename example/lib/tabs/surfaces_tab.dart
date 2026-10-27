import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/gallery.dart';

/// The presets, the three fidelity levels and the two corner styles.
class SurfacesTab extends StatelessWidget {
  /// Creates the tab.
  const SurfacesTab({super.key});

  static const _presets = {
    'light': GlassStyle.light,
    'clear': GlassStyle.clear,
    'frosted': GlassStyle.frosted,
    'dark': GlassStyle.dark,
  };

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return GalleryList(
      children: [
        GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GlassSurface', style: text.titleLarge),
              const SizedBox(height: 6),
              const Text(
                'Blur, saturation, tint, a rim light and a shadow that stays '
                'outside the shape. Scroll to see the backdrop move under it.',
              ),
            ],
          ),
        ),
        const SectionTitle('Presets'),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.6,
          children: [
            for (final entry in _presets.entries)
              GlassSurface(
                style: entry.value,
                alignment: Alignment.center,
                child: Text(
                  'GlassStyle.${entry.key}',
                  style: TextStyle(fontWeight: FontWeight.w600, color: _labelColor(context, entry.value)),
                ),
              ),
          ],
        ),
        const SectionTitle('Fidelity'),
        const Row(
          children: [
            Expanded(child: _FidelitySample(GlassFidelity.full)),
            SizedBox(width: 12),
            Expanded(child: _FidelitySample(GlassFidelity.reduced)),
            SizedBox(width: 12),
            Expanded(child: _FidelitySample(GlassFidelity.opaque)),
          ],
        ),
        const SectionTitle('Corners'),
        const Row(
          children: [
            Expanded(
              child: GlassSurface(
                height: 96,
                alignment: Alignment.center,
                style: GlassStyle(borderRadius: BorderRadius.all(Radius.circular(32))),
                child: Text('continuous'),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: GlassSurface(
                height: 96,
                alignment: Alignment.center,
                style: GlassStyle(borderRadius: BorderRadius.all(Radius.circular(32)), corners: GlassCorners.circular),
                child: Text('circular'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// White or near-black, whichever reads better on [style] over the backdrop's
/// base color.
Color _labelColor(BuildContext context, GlassStyle style) {
  const ink = Color(0xFF04111F);
  final base = Theme.of(context).brightness == Brightness.dark ? const Color(0xFF0A2A52) : const Color(0xFFEAF4FF);
  final surface = Color.alphaBlend(style.effectiveTint, base);
  final white = GlassContrast.contrastRatio(Colors.white, surface);
  return white >= GlassContrast.contrastRatio(ink, surface) ? Colors.white : ink;
}

class _FidelitySample extends StatelessWidget {
  const _FidelitySample(this.fidelity);

  final GlassFidelity fidelity;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      fidelity: fidelity,
      height: 88,
      alignment: Alignment.center,
      child: Text(fidelity.name, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
