import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/glass_theme.dart';

/// An app bar with a frosted glass effect.
///
/// Can be used as a regular app bar or integrated into a [CustomScrollView]
/// as a sliver-compatible widget.
class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The primary title widget.
  final Widget? title;

  /// A widget displayed before the title (usually a back button).
  final Widget? leading;

  /// A list of action widgets displayed after the title.
  final List<Widget>? actions;

  /// Whether the leading widget should be automatically implied.
  final bool automaticallyImplyLeading;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// The height of the app bar.
  final double toolbarHeight;

  /// The elevation shadow intensity.
  final double? elevation;

  /// Creates a [GlassAppBar].
  const GlassAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.blurSigma,
    this.tintColor,
    this.centerTitle = true,
    this.toolbarHeight = 56.0,
    this.elevation,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final sigma = blurSigma ?? theme.blurSigma;
    final tint = tintColor ?? theme.tintColor;
    final topPadding = MediaQuery.of(context).padding.top;

    final effectiveLeading = leading ??
        (automaticallyImplyLeading && Navigator.canPop(context)
            ? const BackButton(color: Colors.white)
            : null);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          height: toolbarHeight + topPadding,
          padding: EdgeInsets.only(top: topPadding),
          decoration: BoxDecoration(
            color: tint,
            border: Border(
              bottom: BorderSide(
                color: theme.borderColor,
                width: theme.borderWidth,
              ),
            ),
          ),
          child: NavigationToolbar(
            leading: effectiveLeading,
            middle: title != null
                ? DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    child: title!,
                  )
                : null,
            trailing: actions != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  )
                : null,
            centerMiddle: centerTitle,
          ),
        ),
      ),
    );
  }
}
