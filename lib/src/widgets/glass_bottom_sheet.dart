import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '../core/glass_theme.dart';

/// Configuration for glass bottom sheet appearance.
class GlassBottomSheetConfig {
  /// The blur intensity.
  final double blurSigma;

  /// The tint color overlay.
  final Color tintColor;

  /// Border color.
  final Color borderColor;

  /// Border width.
  final double borderWidth;

  /// Border radius.
  final BorderRadius borderRadius;

  /// Handle bar color.
  final Color handleColor;

  /// Handle bar width.
  final double handleWidth;

  /// Handle bar height.
  final double handleHeight;

  /// Whether to show handle.
  final bool showHandle;

  /// Gradient colors.
  final List<Color>? gradientColors;

  /// Shadow configuration.
  final BoxShadow? shadow;

  /// Creates a [GlassBottomSheetConfig].
  const GlassBottomSheetConfig({
    this.blurSigma = 20.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(20)),
    this.handleColor = const Color(0x66FFFFFF),
    this.handleWidth = 40.0,
    this.handleHeight = 4.0,
    this.showHandle = true,
    this.gradientColors,
    this.shadow,
  });

  /// Creates a light theme configuration.
  factory GlassBottomSheetConfig.light() {
    return const GlassBottomSheetConfig(
      blurSigma: 25.0,
      tintColor: Color(0x77FFFFFF),
      borderColor: Color(0x33FFFFFF),
      handleColor: Color(0x44000000),
    );
  }

  /// Creates a dark theme configuration.
  factory GlassBottomSheetConfig.dark() {
    return const GlassBottomSheetConfig(
      blurSigma: 30.0,
      tintColor: Color(0x44000000),
      borderColor: Color(0x22FFFFFF),
      handleColor: Color(0x66FFFFFF),
    );
  }

  /// Creates a prominent configuration.
  factory GlassBottomSheetConfig.prominent() {
    return const GlassBottomSheetConfig(
      blurSigma: 35.0,
      tintColor: Color(0x22FFFFFF),
      borderColor: Color(0x55FFFFFF),
      borderWidth: 1.5,
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      shadow: BoxShadow(
        color: Color(0x44000000),
        blurRadius: 20,
        offset: Offset(0, -5),
      ),
    );
  }

  /// Creates a copy with modified properties.
  GlassBottomSheetConfig copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    Color? handleColor,
    double? handleWidth,
    double? handleHeight,
    bool? showHandle,
    List<Color>? gradientColors,
    BoxShadow? shadow,
  }) {
    return GlassBottomSheetConfig(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      handleColor: handleColor ?? this.handleColor,
      handleWidth: handleWidth ?? this.handleWidth,
      handleHeight: handleHeight ?? this.handleHeight,
      showHandle: showHandle ?? this.showHandle,
      gradientColors: gradientColors ?? this.gradientColors,
      shadow: shadow ?? this.shadow,
    );
  }

  /// Linear interpolation between two configs.
  static GlassBottomSheetConfig lerp(
    GlassBottomSheetConfig? a,
    GlassBottomSheetConfig? b,
    double t,
  ) {
    if (a == null && b == null) return const GlassBottomSheetConfig();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassBottomSheetConfig(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
      handleColor: Color.lerp(a.handleColor, b.handleColor, t) ?? a.handleColor,
      handleWidth:
          lerpDouble(a.handleWidth, b.handleWidth, t) ?? a.handleWidth,
      handleHeight:
          lerpDouble(a.handleHeight, b.handleHeight, t) ?? a.handleHeight,
      showHandle: t < 0.5 ? a.showHandle : b.showHandle,
    );
  }
}

/// A bottom sheet with a frosted glass effect.
///
/// Example:
/// ```dart
/// showGlassBottomSheet(
///   context: context,
///   builder: (context) => GlassBottomSheet(
///     child: Column(
///       children: [
///         ListTile(title: Text('Option 1')),
///         ListTile(title: Text('Option 2')),
///       ],
///     ),
///   ),
/// );
/// ```
class GlassBottomSheet extends StatelessWidget {
  /// The content of the bottom sheet.
  final Widget child;

  /// Override blur sigma from the theme.
  final double? blurSigma;

  /// Override tint color from the theme.
  final Color? tintColor;

  /// Border radius for the sheet.
  final BorderRadius? borderRadius;

  /// Configuration for the bottom sheet.
  final GlassBottomSheetConfig? config;

  /// Minimum height of the sheet.
  final double? minHeight;

  /// Maximum height of the sheet.
  final double? maxHeight;

  /// Initial height of the sheet.
  final double? initialHeight;

  /// Padding around the content.
  final EdgeInsets? padding;

  /// Whether to show the handle.
  final bool? showHandle;

  /// Custom handle widget.
  final Widget? handle;

  /// Called when the sheet is closed.
  final VoidCallback? onClose;

  /// Background color behind the blur (for semi-transparent effect).
  final Color? backgroundColor;

  /// Creates a [GlassBottomSheet].
  const GlassBottomSheet({
    super.key,
    required this.child,
    this.blurSigma,
    this.tintColor,
    this.borderRadius,
    this.config,
    this.minHeight,
    this.maxHeight,
    this.initialHeight,
    this.padding,
    this.showHandle,
    this.handle,
    this.onClose,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final effectiveConfig = config ?? const GlassBottomSheetConfig();
    final sigma = blurSigma ?? effectiveConfig.blurSigma;
    final tint = tintColor ?? effectiveConfig.tintColor;
    final radius = borderRadius ?? effectiveConfig.borderRadius;
    final effectiveShowHandle = showHandle ?? effectiveConfig.showHandle;

    Widget handleWidget = handle ??
        (effectiveShowHandle
            ? _GlassHandle(
                color: effectiveConfig.handleColor,
                width: effectiveConfig.handleWidth,
                height: effectiveConfig.handleHeight,
              )
            : const SizedBox.shrink());

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          constraints: BoxConstraints(
            minHeight: minHeight ?? 0,
            maxHeight: maxHeight ?? double.infinity,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? tint,
            gradient: effectiveConfig.gradientColors != null
                ? LinearGradient(
                    colors: effectiveConfig.gradientColors!,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
            borderRadius: radius,
            border: Border(
              top: BorderSide(
                color: effectiveConfig.borderColor,
                width: effectiveConfig.borderWidth,
              ),
              left: BorderSide(
                color: effectiveConfig.borderColor,
                width: effectiveConfig.borderWidth,
              ),
              right: BorderSide(
                color: effectiveConfig.borderColor,
                width: effectiveConfig.borderWidth,
              ),
            ),
            boxShadow:
                effectiveConfig.shadow != null ? [effectiveConfig.shadow!] : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              handleWidget,
              Flexible(
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(16),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Internal handle widget for bottom sheet.
class _GlassHandle extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const _GlassHandle({
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}

/// Shows a modal glass bottom sheet.
///
/// Example:
/// ```dart
/// showGlassBottomSheet(
///   context: context,
///   builder: (context) => Column(
///     mainAxisSize: MainAxisSize.min,
///     children: [
///       ListTile(title: Text('Share')),
///       ListTile(title: Text('Delete')),
///     ],
///   ),
/// );
/// ```
Future<T?> showGlassBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  GlassBottomSheetConfig? config,
  Color? barrierColor,
  bool isDismissible = true,
  bool enableDrag = true,
  bool isScrollControlled = false,
  double? initialHeight,
  double? maxHeight,
  bool useSafeArea = true,
  AnimationController? transitionAnimationController,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.5),
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isScrollControlled: isScrollControlled,
    transitionAnimationController: transitionAnimationController,
    builder: (context) {
      Widget sheet = GlassBottomSheet(
        config: config,
        maxHeight: maxHeight,
        initialHeight: initialHeight,
        child: builder(context),
      );

      if (useSafeArea) {
        sheet = SafeArea(child: sheet);
      }

      return sheet;
    },
  );
}

/// A draggable glass bottom sheet with snap points.
class DraggableGlassBottomSheet extends StatefulWidget {
  /// The content builder.
  final ScrollableWidgetBuilder builder;

  /// Initial child size (0.0 to 1.0).
  final double initialChildSize;

  /// Minimum child size (0.0 to 1.0).
  final double minChildSize;

  /// Maximum child size (0.0 to 1.0).
  final double maxChildSize;

  /// Snap points.
  final List<double>? snapSizes;

  /// Whether to snap.
  final bool snap;

  /// Whether to expand.
  final bool expand;

  /// Configuration.
  final GlassBottomSheetConfig? config;

  /// Scroll controller.
  final ScrollController? scrollController;

  /// Called when dragged.
  final void Function(double extent)? onDrag;

  /// Creates a [DraggableGlassBottomSheet].
  const DraggableGlassBottomSheet({
    super.key,
    required this.builder,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    this.snapSizes,
    this.snap = true,
    this.expand = true,
    this.config,
    this.scrollController,
    this.onDrag,
  });

  @override
  State<DraggableGlassBottomSheet> createState() =>
      _DraggableGlassBottomSheetState();
}

class _DraggableGlassBottomSheetState extends State<DraggableGlassBottomSheet> {
  late DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
    _controller.addListener(_onDrag);
  }

  @override
  void dispose() {
    _controller.removeListener(_onDrag);
    _controller.dispose();
    super.dispose();
  }

  void _onDrag() {
    widget.onDrag?.call(_controller.size);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = widget.config ?? const GlassBottomSheetConfig();

    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      snap: widget.snap,
      snapSizes: widget.snapSizes,
      expand: widget.expand,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: effectiveConfig.borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: effectiveConfig.blurSigma,
              sigmaY: effectiveConfig.blurSigma,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: effectiveConfig.tintColor,
                borderRadius: effectiveConfig.borderRadius,
                border: Border(
                  top: BorderSide(
                    color: effectiveConfig.borderColor,
                    width: effectiveConfig.borderWidth,
                  ),
                ),
              ),
              child: Column(
                children: [
                  if (effectiveConfig.showHandle)
                    _GlassHandle(
                      color: effectiveConfig.handleColor,
                      width: effectiveConfig.handleWidth,
                      height: effectiveConfig.handleHeight,
                    ),
                  Expanded(
                    child: widget.builder(context, scrollController),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A persistent glass bottom sheet that can be minimized.
class PersistentGlassBottomSheet extends StatefulWidget {
  /// The content of the sheet.
  final Widget child;

  /// The minimized content.
  final Widget? minimizedChild;

  /// Collapsed height.
  final double collapsedHeight;

  /// Expanded height.
  final double expandedHeight;

  /// Initial expanded state.
  final bool initiallyExpanded;

  /// Configuration.
  final GlassBottomSheetConfig? config;

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Called when expanded state changes.
  final ValueChanged<bool>? onExpansionChanged;

  /// Creates a [PersistentGlassBottomSheet].
  const PersistentGlassBottomSheet({
    super.key,
    required this.child,
    this.minimizedChild,
    this.collapsedHeight = 80,
    this.expandedHeight = 400,
    this.initiallyExpanded = false,
    this.config,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.onExpansionChanged,
  });

  @override
  State<PersistentGlassBottomSheet> createState() =>
      _PersistentGlassBottomSheetState();
}

class _PersistentGlassBottomSheetState extends State<PersistentGlassBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
      value: _isExpanded ? 1.0 : 0.0,
    );
    _heightAnimation = Tween<double>(
      begin: widget.collapsedHeight,
      end: widget.expandedHeight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    widget.onExpansionChanged?.call(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = widget.config ?? const GlassBottomSheetConfig();

    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (context, child) {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: _heightAnimation.value,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (details.primaryVelocity! < -200) {
                  if (!_isExpanded) _toggle();
                } else if (details.primaryVelocity! > 200) {
                  if (_isExpanded) _toggle();
                }
              }
            },
            child: ClipRRect(
              borderRadius: effectiveConfig.borderRadius,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: effectiveConfig.blurSigma,
                  sigmaY: effectiveConfig.blurSigma,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: effectiveConfig.tintColor,
                    borderRadius: effectiveConfig.borderRadius,
                    border: Border(
                      top: BorderSide(
                        color: effectiveConfig.borderColor,
                        width: effectiveConfig.borderWidth,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (effectiveConfig.showHandle)
                        _GlassHandle(
                          color: effectiveConfig.handleColor,
                          width: effectiveConfig.handleWidth,
                          height: effectiveConfig.handleHeight,
                        ),
                      Expanded(
                        child: AnimatedCrossFade(
                          duration: widget.duration,
                          crossFadeState: _isExpanded
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: widget.child,
                          secondChild: widget.minimizedChild ??
                              const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A glass action sheet for iOS-style action menus.
class GlassActionSheet extends StatelessWidget {
  /// The title of the action sheet.
  final Widget? title;

  /// The message of the action sheet.
  final Widget? message;

  /// The actions to display.
  final List<GlassActionSheetAction> actions;

  /// The cancel action.
  final GlassActionSheetAction? cancelAction;

  /// Configuration.
  final GlassBottomSheetConfig? config;

  /// Creates a [GlassActionSheet].
  const GlassActionSheet({
    super.key,
    this.title,
    this.message,
    required this.actions,
    this.cancelAction,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = config ?? const GlassBottomSheetConfig();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: effectiveConfig.blurSigma,
                  sigmaY: effectiveConfig.blurSigma,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: effectiveConfig.tintColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: effectiveConfig.borderColor,
                      width: effectiveConfig.borderWidth,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null || message != null)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              if (title != null)
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  child: title!,
                                ),
                              if (title != null && message != null)
                                const SizedBox(height: 4),
                              if (message != null)
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 13,
                                  ),
                                  child: message!,
                                ),
                            ],
                          ),
                        ),
                      if (title != null || message != null)
                        Divider(
                          height: 1,
                          color: effectiveConfig.borderColor,
                        ),
                      ...actions.asMap().entries.map((entry) {
                        final index = entry.key;
                        final action = entry.value;
                        return Column(
                          children: [
                            _GlassActionButton(action: action),
                            if (index < actions.length - 1)
                              Divider(
                                height: 1,
                                color: effectiveConfig.borderColor,
                              ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            if (cancelAction != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: effectiveConfig.blurSigma,
                    sigmaY: effectiveConfig.blurSigma,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: effectiveConfig.tintColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: effectiveConfig.borderColor,
                        width: effectiveConfig.borderWidth,
                      ),
                    ),
                    child: _GlassActionButton(
                      action: cancelAction!,
                      isCancelButton: true,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// An action for [GlassActionSheet].
class GlassActionSheetAction {
  /// The label of the action.
  final String label;

  /// The icon of the action.
  final IconData? icon;

  /// Whether this is a destructive action.
  final bool isDestructive;

  /// Whether this action is disabled.
  final bool isDisabled;

  /// The callback when tapped.
  final VoidCallback? onTap;

  /// Creates a [GlassActionSheetAction].
  const GlassActionSheetAction({
    required this.label,
    this.icon,
    this.isDestructive = false,
    this.isDisabled = false,
    this.onTap,
  });
}

/// Internal action button widget.
class _GlassActionButton extends StatelessWidget {
  final GlassActionSheetAction action;
  final bool isCancelButton;

  const _GlassActionButton({
    required this.action,
    this.isCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = action.isDestructive
        ? Colors.red.shade300
        : action.isDisabled
            ? Colors.white38
            : Colors.white;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: action.isDisabled ? null : action.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (action.icon != null) ...[
                Icon(action.icon, color: textColor, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                action.label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight:
                      isCancelButton ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows a glass action sheet.
Future<T?> showGlassActionSheet<T>({
  required BuildContext context,
  Widget? title,
  Widget? message,
  required List<GlassActionSheetAction> actions,
  GlassActionSheetAction? cancelAction,
  GlassBottomSheetConfig? config,
  Color? barrierColor,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.5),
    builder: (context) {
      return GlassActionSheet(
        title: title,
        message: message,
        actions: actions,
        cancelAction: cancelAction,
        config: config,
      );
    },
  );
}
