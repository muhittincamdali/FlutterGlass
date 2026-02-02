import 'package:flutter/material.dart';

/// A card that morphs between a collapsed and expanded state
/// with a smooth hero-style animation.
///
/// When tapped in its collapsed state, it expands to fill the screen
/// (or a custom target size) and displays the [expanded] widget.
/// Tapping again or using the system back gesture collapses it.
class MorphingCard extends StatefulWidget {
  /// The widget shown in the collapsed state.
  final Widget collapsed;

  /// The widget shown in the expanded state.
  final Widget expanded;

  /// The duration of the morph animation.
  final Duration duration;

  /// The animation curve.
  final Curve curve;

  /// Optional tag for hero animation matching.
  final Object? heroTag;

  /// Whether tapping the collapsed card triggers expansion.
  final bool tapToExpand;

  /// Callback when the card begins expanding.
  final VoidCallback? onExpand;

  /// Callback when the card finishes collapsing.
  final VoidCallback? onCollapse;

  /// The border radius in the collapsed state.
  final BorderRadius collapsedBorderRadius;

  /// The border radius in the expanded state.
  final BorderRadius expandedBorderRadius;

  /// The background color of the scrim overlay.
  final Color scrimColor;

  /// Creates a [MorphingCard].
  const MorphingCard({
    super.key,
    required this.collapsed,
    required this.expanded,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOutCubic,
    this.heroTag,
    this.tapToExpand = true,
    this.onExpand,
    this.onCollapse,
    this.collapsedBorderRadius = const BorderRadius.all(Radius.circular(16)),
    this.expandedBorderRadius = BorderRadius.zero,
    this.scrimColor = const Color(0x80000000),
  });

  @override
  State<MorphingCard> createState() => _MorphingCardState();
}

class _MorphingCardState extends State<MorphingCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final GlobalKey _cardKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  Rect? _startRect;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
      reverseCurve: widget.curve.flipped,
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    final renderBox =
        _cardKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    _startRect = position & renderBox.size;

    widget.onExpand?.call();

    _overlayEntry = OverlayEntry(
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        final endRect = Offset.zero & screenSize;

        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final t = _animation.value;
            final currentRect = Rect.lerp(_startRect!, endRect, t)!;
            final currentRadius = BorderRadius.lerp(
              widget.collapsedBorderRadius,
              widget.expandedBorderRadius,
              t,
            )!;

            return Stack(
              children: [
                // Scrim
                Positioned.fill(
                  child: GestureDetector(
                    onTap: collapse,
                    child: ColoredBox(
                      color: widget.scrimColor.withOpacity(
                        widget.scrimColor.opacity * t,
                      ),
                    ),
                  ),
                ),
                // Morphing card
                Positioned.fromRect(
                  rect: currentRect,
                  child: ClipRRect(
                    borderRadius: currentRadius,
                    child: Material(
                      color: Colors.transparent,
                      child: t < 0.5 ? widget.collapsed : widget.expanded,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _controller.forward();
  }

  void collapse() {
    widget.onCollapse?.call();
    _controller.reverse().then((_) => _removeOverlay());
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _cardKey,
      onTap: widget.tapToExpand ? expand : null,
      child: widget.collapsed,
    );
  }
}
