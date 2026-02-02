import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// A navigation item for [GlassNavigationBar].
class GlassNavItem {
  /// The icon for this item.
  final IconData icon;

  /// The label displayed below the icon.
  final String label;

  /// An optional active icon variant.
  final IconData? activeIcon;

  /// Creates a [GlassNavItem].
  const GlassNavItem({
    required this.icon,
    required this.label,
    this.activeIcon,
  });
}

/// A bottom navigation bar with a frosted glass appearance.
///
/// Displays a row of [GlassNavItem]s with smooth transitions between
/// active and inactive states.
class GlassNavigationBar extends StatelessWidget {
  /// The navigation items to display.
  final List<GlassNavItem> items;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Called when an item is tapped.
  final ValueChanged<int> onTap;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// The color of the active item.
  final Color activeColor;

  /// The color of inactive items.
  final Color inactiveColor;

  /// The height of the navigation bar.
  final double height;

  /// Whether to show labels below icons.
  final bool showLabels;

  /// Creates a [GlassNavigationBar].
  const GlassNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.blurSigma,
    this.tintColor,
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0x99FFFFFF),
    this.height = 72,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = blurSigma ?? theme.blurSigma;
    final tint = tintColor ?? theme.tintColor;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          height: height + bottomPadding,
          padding: EdgeInsets.only(bottom: bottomPadding),
          decoration: BoxDecoration(
            color: tint,
            border: Border(
              top: BorderSide(
                color: theme.borderColor,
                width: theme.borderWidth,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = index == currentIndex;
              final color = isActive ? activeColor : inactiveColor;
              final icon = isActive && item.activeIcon != null
                  ? item.activeIcon!
                  : item.icon;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isActive
                              ? activeColor.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: color, size: 24),
                      ),
                      if (showLabels) ...[
                        const SizedBox(height: 2),
                        Text(
                          item.label,
                          style: TextStyle(
                            color: color,
                            fontSize: 11,
                            fontWeight:
                                isActive ? FontWeight.w600 : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
