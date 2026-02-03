import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/glass_theme.dart';

/// Configuration for glass navigation bar appearance.
class GlassNavigationBarConfig {
  /// The blur intensity.
  final double blurSigma;

  /// The tint color overlay.
  final Color tintColor;

  /// Border color.
  final Color borderColor;

  /// Border width.
  final double borderWidth;

  /// Height of the navigation bar.
  final double height;

  /// Border radius.
  final BorderRadius? borderRadius;

  /// Selected item color.
  final Color selectedColor;

  /// Unselected item color.
  final Color unselectedColor;

  /// Background color for selected indicator.
  final Color? indicatorColor;

  /// Indicator shape.
  final ShapeBorder? indicatorShape;

  /// Label behavior.
  final NavigationDestinationLabelBehavior labelBehavior;

  /// Gradient colors.
  final List<Color>? gradientColors;

  /// Shadow.
  final BoxShadow? shadow;

  /// Icon size.
  final double iconSize;

  /// Selected icon size.
  final double selectedIconSize;

  /// Label style.
  final TextStyle? labelStyle;

  /// Selected label style.
  final TextStyle? selectedLabelStyle;

  /// Creates a [GlassNavigationBarConfig].
  const GlassNavigationBarConfig({
    this.blurSigma = 20.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.5,
    this.height = 80.0,
    this.borderRadius,
    this.selectedColor = Colors.white,
    this.unselectedColor = const Color(0x99FFFFFF),
    this.indicatorColor,
    this.indicatorShape,
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysShow,
    this.gradientColors,
    this.shadow,
    this.iconSize = 24.0,
    this.selectedIconSize = 24.0,
    this.labelStyle,
    this.selectedLabelStyle,
  });

  /// Creates a light theme configuration.
  factory GlassNavigationBarConfig.light() {
    return const GlassNavigationBarConfig(
      blurSigma: 25.0,
      tintColor: Color(0x77FFFFFF),
      borderColor: Color(0x33FFFFFF),
      selectedColor: Color(0xFF007AFF),
      unselectedColor: Color(0x99000000),
    );
  }

  /// Creates a dark theme configuration.
  factory GlassNavigationBarConfig.dark() {
    return const GlassNavigationBarConfig(
      blurSigma: 30.0,
      tintColor: Color(0x44000000),
      borderColor: Color(0x22FFFFFF),
      selectedColor: Color(0xFF0A84FF),
      unselectedColor: Color(0x99FFFFFF),
    );
  }

  /// Creates a floating configuration with rounded corners.
  factory GlassNavigationBarConfig.floating() {
    return const GlassNavigationBarConfig(
      blurSigma: 25.0,
      tintColor: Color(0x44FFFFFF),
      borderColor: Color(0x44FFFFFF),
      borderWidth: 1.0,
      height: 70.0,
      borderRadius: BorderRadius.all(Radius.circular(35)),
      shadow: BoxShadow(
        color: Color(0x33000000),
        blurRadius: 20,
        offset: Offset(0, 5),
      ),
    );
  }

  /// Creates a pill-style configuration.
  factory GlassNavigationBarConfig.pill() {
    return const GlassNavigationBarConfig(
      blurSigma: 20.0,
      tintColor: Color(0x55FFFFFF),
      borderColor: Color(0x44FFFFFF),
      borderWidth: 1.0,
      height: 60.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      indicatorColor: Color(0x33FFFFFF),
    );
  }

  /// Creates a copy with modified properties.
  GlassNavigationBarConfig copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    double? height,
    BorderRadius? borderRadius,
    Color? selectedColor,
    Color? unselectedColor,
    Color? indicatorColor,
    ShapeBorder? indicatorShape,
    NavigationDestinationLabelBehavior? labelBehavior,
    List<Color>? gradientColors,
    BoxShadow? shadow,
    double? iconSize,
    double? selectedIconSize,
    TextStyle? labelStyle,
    TextStyle? selectedLabelStyle,
  }) {
    return GlassNavigationBarConfig(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorShape: indicatorShape ?? this.indicatorShape,
      labelBehavior: labelBehavior ?? this.labelBehavior,
      gradientColors: gradientColors ?? this.gradientColors,
      shadow: shadow ?? this.shadow,
      iconSize: iconSize ?? this.iconSize,
      selectedIconSize: selectedIconSize ?? this.selectedIconSize,
      labelStyle: labelStyle ?? this.labelStyle,
      selectedLabelStyle: selectedLabelStyle ?? this.selectedLabelStyle,
    );
  }

  /// Linear interpolation between two configs.
  static GlassNavigationBarConfig lerp(
    GlassNavigationBarConfig? a,
    GlassNavigationBarConfig? b,
    double t,
  ) {
    if (a == null && b == null) return const GlassNavigationBarConfig();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassNavigationBarConfig(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      height: lerpDouble(a.height, b.height, t) ?? a.height,
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      selectedColor:
          Color.lerp(a.selectedColor, b.selectedColor, t) ?? a.selectedColor,
      unselectedColor:
          Color.lerp(a.unselectedColor, b.unselectedColor, t) ??
              a.unselectedColor,
      indicatorColor: Color.lerp(a.indicatorColor, b.indicatorColor, t),
      iconSize: lerpDouble(a.iconSize, b.iconSize, t) ?? a.iconSize,
      selectedIconSize: lerpDouble(a.selectedIconSize, b.selectedIconSize, t) ??
          a.selectedIconSize,
    );
  }
}

/// A navigation item for the glass navigation bar.
class GlassNavigationItem {
  /// The icon to display.
  final IconData icon;

  /// The selected icon.
  final IconData? selectedIcon;

  /// The label text.
  final String label;

  /// Badge count (null means no badge).
  final int? badge;

  /// Badge color.
  final Color? badgeColor;

  /// Whether to show a dot badge.
  final bool showDot;

  /// Dot color.
  final Color? dotColor;

  /// Tooltip text.
  final String? tooltip;

  /// Whether this item is enabled.
  final bool enabled;

  /// Creates a [GlassNavigationItem].
  const GlassNavigationItem({
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.badge,
    this.badgeColor,
    this.showDot = false,
    this.dotColor,
    this.tooltip,
    this.enabled = true,
  });
}

/// A navigation bar with a frosted glass effect.
///
/// Example:
/// ```dart
/// GlassNavigationBar(
///   selectedIndex: _selectedIndex,
///   onItemSelected: (index) => setState(() => _selectedIndex = index),
///   items: [
///     GlassNavigationItem(icon: Icons.home, label: 'Home'),
///     GlassNavigationItem(icon: Icons.search, label: 'Search'),
///     GlassNavigationItem(icon: Icons.profile, label: 'Profile'),
///   ],
/// )
/// ```
class GlassNavigationBar extends StatefulWidget {
  /// The currently selected index.
  final int selectedIndex;

  /// Called when an item is selected.
  final ValueChanged<int>? onItemSelected;

  /// The navigation items.
  final List<GlassNavigationItem> items;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Configuration.
  final GlassNavigationBarConfig? config;

  /// Whether to show labels.
  final bool showLabels;

  /// Whether to show selected labels only.
  final bool showSelectedLabelsOnly;

  /// Whether to use haptic feedback.
  final bool hapticFeedback;

  /// Margin around the navigation bar.
  final EdgeInsets? margin;

  /// Padding inside the navigation bar.
  final EdgeInsets? padding;

  /// Animation duration.
  final Duration animationDuration;

  /// Animation curve.
  final Curve animationCurve;

  /// Creates a [GlassNavigationBar].
  const GlassNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.items,
    this.blurSigma,
    this.tintColor,
    this.config,
    this.showLabels = true,
    this.showSelectedLabelsOnly = false,
    this.hapticFeedback = true,
    this.margin,
    this.padding,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  });

  /// Creates a floating glass navigation bar.
  factory GlassNavigationBar.floating({
    Key? key,
    required int selectedIndex,
    required ValueChanged<int>? onItemSelected,
    required List<GlassNavigationItem> items,
    EdgeInsets? margin,
  }) {
    return GlassNavigationBar(
      key: key,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      items: items,
      config: GlassNavigationBarConfig.floating(),
      margin: margin ?? const EdgeInsets.all(16),
    );
  }

  /// Creates a pill-style glass navigation bar.
  factory GlassNavigationBar.pill({
    Key? key,
    required int selectedIndex,
    required ValueChanged<int>? onItemSelected,
    required List<GlassNavigationItem> items,
    EdgeInsets? margin,
  }) {
    return GlassNavigationBar(
      key: key,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      items: items,
      config: GlassNavigationBarConfig.pill(),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      showLabels: false,
    );
  }

  @override
  State<GlassNavigationBar> createState() => _GlassNavigationBarState();
}

class _GlassNavigationBarState extends State<GlassNavigationBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _controllers = List.generate(
      widget.items.length,
      (index) => AnimationController(
        duration: widget.animationDuration,
        vsync: this,
        value: index == widget.selectedIndex ? 1.0 : 0.0,
      ),
    );

    _animations = _controllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: widget.animationCurve,
      );
    }).toList();
  }

  @override
  void didUpdateWidget(GlassNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items.length != oldWidget.items.length) {
      for (final controller in _controllers) {
        controller.dispose();
      }
      _initAnimations();
    }

    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _controllers[oldWidget.selectedIndex].reverse();
      _controllers[widget.selectedIndex].forward();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (!widget.items[index].enabled) return;

    if (widget.hapticFeedback) {
      HapticFeedback.lightImpact();
    }

    widget.onItemSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final effectiveConfig = widget.config ?? const GlassNavigationBarConfig();
    final sigma = widget.blurSigma ?? effectiveConfig.blurSigma;
    final tint = widget.tintColor ?? effectiveConfig.tintColor;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    Widget navbar = ClipRRect(
      borderRadius: effectiveConfig.borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          height: effectiveConfig.height + bottomPadding,
          padding: EdgeInsets.only(bottom: bottomPadding),
          decoration: BoxDecoration(
            color: tint,
            gradient: effectiveConfig.gradientColors != null
                ? LinearGradient(
                    colors: effectiveConfig.gradientColors!,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: effectiveConfig.borderRadius,
            border: effectiveConfig.borderRadius != null
                ? Border.all(
                    color: effectiveConfig.borderColor,
                    width: effectiveConfig.borderWidth,
                  )
                : Border(
                    top: BorderSide(
                      color: effectiveConfig.borderColor,
                      width: effectiveConfig.borderWidth,
                    ),
                  ),
            boxShadow:
                effectiveConfig.shadow != null ? [effectiveConfig.shadow!] : null,
          ),
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.items.length, (index) {
                return Expanded(
                  child: _GlassNavigationItemWidget(
                    item: widget.items[index],
                    isSelected: index == widget.selectedIndex,
                    animation: _animations[index],
                    config: effectiveConfig,
                    onTap: () => _onItemTapped(index),
                    showLabel: widget.showLabels &&
                        (!widget.showSelectedLabelsOnly ||
                            index == widget.selectedIndex),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );

    if (widget.margin != null) {
      navbar = Padding(
        padding: widget.margin!,
        child: navbar,
      );
    }

    return navbar;
  }
}

/// Internal navigation item widget.
class _GlassNavigationItemWidget extends StatelessWidget {
  final GlassNavigationItem item;
  final bool isSelected;
  final Animation<double> animation;
  final GlassNavigationBarConfig config;
  final VoidCallback onTap;
  final bool showLabel;

  const _GlassNavigationItemWidget({
    required this.item,
    required this.isSelected,
    required this.animation,
    required this.config,
    required this.onTap,
    required this.showLabel,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? config.selectedColor : config.unselectedColor;
    final iconSize = isSelected ? config.selectedIconSize : config.iconSize;
    final icon = isSelected ? (item.selectedIcon ?? item.icon) : item.icon;

    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (animation.value * 0.1),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    icon,
                    color: color,
                    size: iconSize,
                  ),
                  if (item.badge != null)
                    Positioned(
                      right: -6,
                      top: -4,
                      child: _Badge(
                        count: item.badge!,
                        color: item.badgeColor ?? Colors.red,
                      ),
                    ),
                  if (item.showDot)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: item.dotColor ?? Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        if (showLabel) ...[
          const SizedBox(height: 4),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: (isSelected
                    ? config.selectedLabelStyle
                    : config.labelStyle) ??
                TextStyle(
                  color: color,
                  fontSize: isSelected ? 12 : 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
            child: Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );

    if (config.indicatorColor != null && isSelected) {
      content = AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: config.indicatorColor!.withValues(alpha: animation.value),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          );
        },
        child: content,
      );
    }

    Widget result = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.enabled ? onTap : null,
        customBorder: const CircleBorder(),
        child: Opacity(
          opacity: item.enabled ? 1.0 : 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: content,
          ),
        ),
      ),
    );

    if (item.tooltip != null) {
      result = Tooltip(
        message: item.tooltip!,
        child: result,
      );
    }

    return result;
  }
}

/// Internal badge widget.
class _Badge extends StatelessWidget {
  final int count;
  final Color color;

  const _Badge({
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = count > 99 ? '99+' : count.toString();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      constraints: const BoxConstraints(minWidth: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        displayText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// A rail-style glass navigation for larger screens.
class GlassNavigationRail extends StatefulWidget {
  /// The currently selected index.
  final int selectedIndex;

  /// Called when an item is selected.
  final ValueChanged<int>? onItemSelected;

  /// The navigation items.
  final List<GlassNavigationItem> items;

  /// Whether to show labels.
  final NavigationRailLabelType labelType;

  /// Leading widget.
  final Widget? leading;

  /// Trailing widget.
  final Widget? trailing;

  /// Width of the rail.
  final double? width;

  /// Extended width when expanded.
  final double? extendedWidth;

  /// Whether the rail is extended.
  final bool extended;

  /// Configuration.
  final GlassNavigationBarConfig? config;

  /// Creates a [GlassNavigationRail].
  const GlassNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.items,
    this.labelType = NavigationRailLabelType.none,
    this.leading,
    this.trailing,
    this.width,
    this.extendedWidth,
    this.extended = false,
    this.config,
  });

  @override
  State<GlassNavigationRail> createState() => _GlassNavigationRailState();
}

class _GlassNavigationRailState extends State<GlassNavigationRail>
    with SingleTickerProviderStateMixin {
  late AnimationController _extendedController;

  @override
  void initState() {
    super.initState();
    _extendedController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: widget.extended ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(GlassNavigationRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.extended != oldWidget.extended) {
      if (widget.extended) {
        _extendedController.forward();
      } else {
        _extendedController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _extendedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = widget.config ?? const GlassNavigationBarConfig();
    final railWidth = widget.width ?? 72.0;
    final extendedWidth = widget.extendedWidth ?? 256.0;

    return AnimatedBuilder(
      animation: _extendedController,
      builder: (context, child) {
        final currentWidth =
            railWidth + (_extendedController.value * (extendedWidth - railWidth));

        return ClipRRect(
          borderRadius: effectiveConfig.borderRadius ?? BorderRadius.zero,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: effectiveConfig.blurSigma,
              sigmaY: effectiveConfig.blurSigma,
            ),
            child: Container(
              width: currentWidth,
              decoration: BoxDecoration(
                color: effectiveConfig.tintColor,
                borderRadius: effectiveConfig.borderRadius,
                border: Border(
                  right: BorderSide(
                    color: effectiveConfig.borderColor,
                    width: effectiveConfig.borderWidth,
                  ),
                ),
              ),
              child: Column(
                children: [
                  if (widget.leading != null) ...[
                    const SizedBox(height: 8),
                    widget.leading!,
                    const SizedBox(height: 16),
                  ],
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        final item = widget.items[index];
                        final isSelected = index == widget.selectedIndex;

                        return _GlassRailItem(
                          item: item,
                          isSelected: isSelected,
                          extended: _extendedController.value > 0.5,
                          config: effectiveConfig,
                          labelType: widget.labelType,
                          onTap: () => widget.onItemSelected?.call(index),
                        );
                      },
                    ),
                  ),
                  if (widget.trailing != null) ...[
                    const SizedBox(height: 16),
                    widget.trailing!,
                    const SizedBox(height: 8),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Internal rail item widget.
class _GlassRailItem extends StatelessWidget {
  final GlassNavigationItem item;
  final bool isSelected;
  final bool extended;
  final GlassNavigationBarConfig config;
  final NavigationRailLabelType labelType;
  final VoidCallback onTap;

  const _GlassRailItem({
    required this.item,
    required this.isSelected,
    required this.extended,
    required this.config,
    required this.labelType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? config.selectedColor : config.unselectedColor;
    final icon = isSelected ? (item.selectedIcon ?? item.icon) : item.icon;

    final showLabel = labelType == NavigationRailLabelType.all ||
        (labelType == NavigationRailLabelType.selected && isSelected);

    Widget content;

    if (extended) {
      content = Row(
        children: [
          const SizedBox(width: 16),
          Icon(icon, color: color, size: config.iconSize),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              item.label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
        ],
      );
    } else {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: config.iconSize),
          if (showLabel) ...[
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: color,
                fontSize: 10,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected
                ? config.indicatorColor ?? config.selectedColor.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: content),
        ),
      ),
    );
  }
}
