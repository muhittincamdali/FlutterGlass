import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/gallery.dart';

/// Opens the gallery's glass bottom sheet.
Future<void> showGallerySheet(BuildContext context) {
  return showGlassModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Share photo', style: Theme.of(sheetContext).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text('The sheet is glass too: the page behind it stays visible through the blur.'),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GlassButton(onPressed: () => Navigator.pop(sheetContext), child: const Text('Cancel')),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GlassButton.prominent(onPressed: () => Navigator.pop(sheetContext), child: const Text('Share')),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// Buttons, a selectable animated surface and the bottom sheet.
class ControlsTab extends StatefulWidget {
  /// Creates the tab.
  const ControlsTab({super.key});

  @override
  State<ControlsTab> createState() => _ControlsTabState();
}

class _ControlsTabState extends State<ControlsTab> {
  int _presses = 0;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final base = GlassTheme.styleOf(context);
    return GalleryList(
      children: [
        const SectionTitle('GlassButton'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            GlassButton(
              key: const Key('press-button'),
              onPressed: () => setState(() => _presses++),
              child: Text('Pressed $_presses×'),
            ),
            GlassButton.prominent(
              onPressed: () => showGallerySheet(context),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.ios_share), SizedBox(width: 8), Text('Open sheet')],
              ),
            ),
            const GlassButton(onPressed: null, child: Text('Disabled')),
            GlassButton(
              onPressed: () {},
              semanticLabel: 'Favorite',
              padding: EdgeInsets.zero,
              child: const Icon(Icons.favorite_border),
            ),
          ],
        ),
        const SectionTitle('AnimatedGlassSurface'),
        GestureDetector(
          key: const Key('animated-surface'),
          onTap: () => setState(() => _selected = !_selected),
          child: AnimatedGlassSurface(
            height: 96,
            alignment: Alignment.center,
            style: _selected ? base.copyWith(tint: colors.primary, tintOpacity: 0.55, blurSigma: 28) : base,
            child: Text(
              _selected ? 'Selected: tap to clear' : 'Tap to select',
              style: TextStyle(fontWeight: FontWeight.w600, color: _selected ? colors.onPrimary : colors.onSurface),
            ),
          ),
        ),
        const SectionTitle('GlassCard'),
        GlassCard(
          onTap: () => showGallerySheet(context),
          semanticLabel: 'Weather in Istanbul',
          child: const Row(
            children: [
              Icon(Icons.wb_sunny_outlined, size: 36),
              SizedBox(width: 16),
              Expanded(child: Text('Istanbul\nSunny, 21°', style: TextStyle(fontSize: 16))),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ],
    );
  }
}
