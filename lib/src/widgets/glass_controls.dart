import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../style/glass_style.dart';
import '../theme/glass_theme.dart';
import 'glass_surface.dart';

/// A [GlassSurface] with padding and, when [onTap] or [onLongPress] is set, an
/// ink ripple clipped to its shape.
class GlassCard extends StatelessWidget {
  /// Creates a glass card.
  const GlassCard({
    super.key,
    required this.child,
    this.style,
    this.fidelity,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.onTap,
    this.onLongPress,
    this.semanticLabel,
  });

  /// The card's content.
  final Widget child;

  /// See [GlassSurface.style].
  final GlassStyle? style;

  /// See [GlassSurface.fidelity].
  final GlassFidelity? fidelity;

  /// Space between the edge of the card and [child].
  final EdgeInsetsGeometry padding;

  /// Space around the card.
  final EdgeInsetsGeometry? margin;

  /// Called when the card is tapped. The card is then announced as a button.
  final VoidCallback? onTap;

  /// Called when the card is long-pressed.
  final VoidCallback? onLongPress;

  /// A label that screen readers announce for the whole card.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final interactive = onTap != null || onLongPress != null;
    Widget content = Padding(padding: padding, child: child);
    if (interactive) {
      content = Material(
        type: MaterialType.transparency,
        child: InkWell(onTap: onTap, onLongPress: onLongPress, child: content),
      );
    }
    Widget card = GlassSurface(style: style, fidelity: fidelity, child: content);
    if (semanticLabel != null || interactive) {
      card = Semantics(container: true, button: onTap != null, label: semanticLabel, child: card);
    }
    if (margin != null) {
      card = Padding(padding: margin!, child: card);
    }
    return card;
  }
}

/// A button made of glass, at least 48 × 48 logical pixels.
///
/// It shrinks slightly while pressed (instantly when the platform asks to
/// reduce motion), takes keyboard focus, activates with Enter or Space, and is
/// announced as a disabled button when [onPressed] is null.
class GlassButton extends StatefulWidget {
  /// Creates a glass button.
  const GlassButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.fidelity,
    this.foregroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
  }) : _prominent = false;

  /// Creates a glass button tinted with the theme's primary color, for the
  /// main action of a screen.
  const GlassButton.prominent({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.fidelity,
    this.foregroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
  }) : _prominent = true;

  /// Called when the button is activated. Null disables the button.
  final VoidCallback? onPressed;

  /// The label, usually a [Text], an [Icon] or a [Row] of both.
  final Widget child;

  /// See [GlassSurface.style].
  final GlassStyle? style;

  /// See [GlassSurface.fidelity].
  final GlassFidelity? fidelity;

  /// The color of text and icons. Null uses `onSurface`, or `onPrimary` for
  /// [GlassButton.prominent].
  final Color? foregroundColor;

  /// Space around [child].
  final EdgeInsetsGeometry padding;

  /// An optional focus node.
  final FocusNode? focusNode;

  /// Whether the button takes focus when first built.
  final bool autofocus;

  /// A label for screen readers when [child] has none, such as an icon.
  final String? semanticLabel;

  final bool _prominent;

  /// The scale of a pressed button.
  static const double pressedScale = 0.96;

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final enabled = widget.onPressed != null;
    var glass = widget.style ?? GlassTheme.styleOf(context);
    if (widget._prominent) {
      glass = glass.copyWith(tint: colors.primary, tintOpacity: math.max(0.72, glass.tintOpacity));
    }
    glass = glass.copyWith(borderRadius: const BorderRadius.all(Radius.circular(kMinInteractiveDimension)));
    final foreground = widget.foregroundColor ?? (widget._prominent ? colors.onPrimary : colors.onSurface);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    final label = IconTheme.merge(
      data: IconThemeData(color: foreground, size: 20),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: foreground, fontWeight: FontWeight.w600),
        child: widget.child,
      ),
    );
    final surface = GlassSurface(
      style: glass,
      fidelity: widget.fidelity,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.onPressed,
          onHighlightChanged: (value) => setState(() => _pressed = value),
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: kMinInteractiveDimension, minHeight: kMinInteractiveDimension),
            child: Padding(
              padding: widget.padding,
              child: Center(widthFactor: 1, heightFactor: 1, child: label),
            ),
          ),
        ),
      ),
    );
    return Semantics(
      container: true,
      button: true,
      enabled: enabled,
      label: widget.semanticLabel,
      child: AnimatedScale(
        scale: _pressed && enabled ? GlassButton.pressedScale : 1,
        duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Opacity(opacity: enabled ? 1 : 0.5, child: surface),
      ),
    );
  }
}
