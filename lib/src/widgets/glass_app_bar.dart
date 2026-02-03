import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../core/glass_theme.dart';

/// Configuration for glass app bar appearance.
class GlassAppBarConfig {
  /// The blur intensity.
  final double blurSigma;

  /// The tint color overlay.
  final Color tintColor;

  /// Border color.
  final Color borderColor;

  /// Border width.
  final double borderWidth;

  /// Gradient colors for advanced effects.
  final List<Color>? gradientColors;

  /// Whether to show subtle noise texture.
  final bool showNoise;

  /// Noise opacity.
  final double noiseOpacity;

  /// Shadow configuration.
  final BoxShadow? shadow;

  /// Creates a [GlassAppBarConfig].
  const GlassAppBarConfig({
    this.blurSigma = 15.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x33FFFFFF),
    this.borderWidth = 0.5,
    this.gradientColors,
    this.showNoise = false,
    this.noiseOpacity = 0.02,
    this.shadow,
  });

  /// Creates a light theme configuration.
  factory GlassAppBarConfig.light() {
    return const GlassAppBarConfig(
      blurSigma: 20.0,
      tintColor: Color(0x66FFFFFF),
      borderColor: Color(0x33FFFFFF),
      borderWidth: 1.0,
    );
  }

  /// Creates a dark theme configuration.
  factory GlassAppBarConfig.dark() {
    return const GlassAppBarConfig(
      blurSigma: 25.0,
      tintColor: Color(0x33000000),
      borderColor: Color(0x22FFFFFF),
      borderWidth: 0.5,
    );
  }

  /// Creates a vibrant configuration with gradients.
  factory GlassAppBarConfig.vibrant() {
    return const GlassAppBarConfig(
      blurSigma: 30.0,
      tintColor: Color(0x22FFFFFF),
      borderColor: Color(0x44FFFFFF),
      borderWidth: 1.0,
      gradientColors: [
        Color(0x22FF6B6B),
        Color(0x224ECDC4),
        Color(0x22A855F7),
      ],
    );
  }

  /// Creates a copy with modified properties.
  GlassAppBarConfig copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    List<Color>? gradientColors,
    bool? showNoise,
    double? noiseOpacity,
    BoxShadow? shadow,
  }) {
    return GlassAppBarConfig(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      gradientColors: gradientColors ?? this.gradientColors,
      showNoise: showNoise ?? this.showNoise,
      noiseOpacity: noiseOpacity ?? this.noiseOpacity,
      shadow: shadow ?? this.shadow,
    );
  }

  /// Linear interpolation between two configs.
  static GlassAppBarConfig lerp(
    GlassAppBarConfig? a,
    GlassAppBarConfig? b,
    double t,
  ) {
    if (a == null && b == null) return const GlassAppBarConfig();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassAppBarConfig(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      showNoise: t < 0.5 ? a.showNoise : b.showNoise,
      noiseOpacity:
          lerpDouble(a.noiseOpacity, b.noiseOpacity, t) ?? a.noiseOpacity,
    );
  }
}

/// An app bar with a frosted glass effect.
///
/// Can be used as a regular app bar or integrated into a [CustomScrollView]
/// as a sliver-compatible widget.
///
/// Example:
/// ```dart
/// GlassAppBar(
///   title: Text('My App'),
///   actions: [
///     IconButton(
///       icon: Icon(Icons.settings),
///       onPressed: () {},
///     ),
///   ],
/// )
/// ```
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

  /// Custom configuration.
  final GlassAppBarConfig? config;

  /// The flex space widget (for sliver use).
  final Widget? flexibleSpace;

  /// Bottom widget (typically a TabBar).
  final PreferredSizeWidget? bottom;

  /// System UI overlay style.
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// Callback when leading is tapped.
  final VoidCallback? onLeadingTap;

  /// Title text style.
  final TextStyle? titleTextStyle;

  /// Title spacing.
  final double? titleSpacing;

  /// Leading width.
  final double? leadingWidth;

  /// Background widget behind the glass effect.
  final Widget? background;

  /// Whether to clip the content.
  final bool clipBehavior;

  /// Shape of the app bar.
  final ShapeBorder? shape;

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
    this.config,
    this.flexibleSpace,
    this.bottom,
    this.systemOverlayStyle,
    this.onLeadingTap,
    this.titleTextStyle,
    this.titleSpacing,
    this.leadingWidth,
    this.background,
    this.clipBehavior = true,
    this.shape,
  });

  /// Creates a large title style app bar.
  factory GlassAppBar.large({
    Key? key,
    required String title,
    Widget? leading,
    List<Widget>? actions,
    GlassAppBarConfig? config,
    VoidCallback? onLeadingTap,
  }) {
    return GlassAppBar(
      key: key,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      leading: leading,
      actions: actions,
      config: config,
      toolbarHeight: 72.0,
      onLeadingTap: onLeadingTap,
    );
  }

  /// Creates a transparent app bar.
  factory GlassAppBar.transparent({
    Key? key,
    Widget? title,
    Widget? leading,
    List<Widget>? actions,
    VoidCallback? onLeadingTap,
  }) {
    return GlassAppBar(
      key: key,
      title: title,
      leading: leading,
      actions: actions,
      config: const GlassAppBarConfig(
        blurSigma: 0,
        tintColor: Colors.transparent,
        borderColor: Colors.transparent,
        borderWidth: 0,
      ),
      onLeadingTap: onLeadingTap,
    );
  }

  /// Creates a search-focused app bar.
  factory GlassAppBar.search({
    Key? key,
    required TextEditingController controller,
    String hintText = 'Search...',
    ValueChanged<String>? onChanged,
    VoidCallback? onClear,
    GlassAppBarConfig? config,
  }) {
    return GlassAppBar(
      key: key,
      title: _GlassSearchField(
        controller: controller,
        hintText: hintText,
        onChanged: onChanged,
        onClear: onClear,
      ),
      config: config,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(toolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final effectiveConfig = config ?? const GlassAppBarConfig();
    final sigma = blurSigma ?? effectiveConfig.blurSigma;
    final tint = tintColor ?? effectiveConfig.tintColor;
    final topPadding = MediaQuery.of(context).padding.top;

    final effectiveLeading = leading ??
        (automaticallyImplyLeading && Navigator.canPop(context)
            ? _GlassBackButton(onTap: onLeadingTap)
            : null);

    final effectiveTitleStyle = titleTextStyle ??
        const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        );

    Widget content = Container(
      height: preferredSize.height + topPadding,
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        children: [
          Expanded(
            child: NavigationToolbar(
              leading: effectiveLeading,
              middle: title != null
                  ? DefaultTextStyle(
                      style: effectiveTitleStyle,
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
              middleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
            ),
          ),
          if (bottom != null) bottom!,
        ],
      ),
    );

    if (flexibleSpace != null) {
      content = Stack(
        fit: StackFit.passthrough,
        children: [
          flexibleSpace!,
          content,
        ],
      );
    }

    Widget glassEffect = ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          decoration: BoxDecoration(
            color: tint,
            gradient: effectiveConfig.gradientColors != null
                ? LinearGradient(
                    colors: effectiveConfig.gradientColors!,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            border: Border(
              bottom: BorderSide(
                color: effectiveConfig.borderColor,
                width: effectiveConfig.borderWidth,
              ),
            ),
            boxShadow: effectiveConfig.shadow != null
                ? [effectiveConfig.shadow!]
                : null,
          ),
          child: content,
        ),
      ),
    );

    if (background != null) {
      glassEffect = Stack(
        fit: StackFit.passthrough,
        children: [
          background!,
          glassEffect,
        ],
      );
    }

    if (systemOverlayStyle != null) {
      glassEffect = AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemOverlayStyle!,
        child: glassEffect,
      );
    }

    if (shape != null) {
      glassEffect = PhysicalShape(
        clipper: ShapeBorderClipper(shape: shape!),
        color: Colors.transparent,
        child: glassEffect,
      );
    }

    return glassEffect;
  }
}

/// Internal search field widget for search app bar.
class _GlassSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const _GlassSearchField({
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withValues(alpha: 0.7),
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                  onPressed: () {
                    controller.clear();
                    onClear?.call();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

/// Internal back button with glass styling.
class _GlassBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _GlassBackButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: onTap ?? () => Navigator.of(context).pop(),
    );
  }
}

/// A sliver-compatible glass app bar for use in CustomScrollView.
///
/// This provides the same glass effect but works within a scroll view,
/// supporting collapsing and expanding behaviors.
class SliverGlassAppBar extends StatelessWidget {
  /// The title widget.
  final Widget? title;

  /// The leading widget.
  final Widget? leading;

  /// Action widgets.
  final List<Widget>? actions;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// The expanded height when fully visible.
  final double? expandedHeight;

  /// The collapsed height.
  final double? collapsedHeight;

  /// Whether to automatically imply leading.
  final bool automaticallyImplyLeading;

  /// The flexible space background.
  final Widget? flexibleSpace;

  /// Whether the app bar should stretch.
  final bool stretch;

  /// Stretch trigger offset.
  final double stretchTriggerOffset;

  /// Called when stretch is triggered.
  final AsyncCallback? onStretchTrigger;

  /// Whether the app bar should snap.
  final bool snap;

  /// Whether the app bar is floating.
  final bool floating;

  /// Whether the app bar is pinned.
  final bool pinned;

  /// Glass configuration.
  final GlassAppBarConfig? config;

  /// Creates a [SliverGlassAppBar].
  const SliverGlassAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.expandedHeight,
    this.collapsedHeight,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.snap = false,
    this.floating = false,
    this.pinned = true,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GlassTheme.of(context);
    final effectiveConfig = config ?? const GlassAppBarConfig();

    return SliverAppBar(
      title: title,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      automaticallyImplyLeading: automaticallyImplyLeading,
      stretch: stretch,
      stretchTriggerOffset: stretchTriggerOffset,
      onStretchTrigger: onStretchTrigger,
      snap: snap,
      floating: floating,
      pinned: pinned,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: _SliverGlassBackground(
        config: effectiveConfig,
        child: flexibleSpace,
      ),
    );
  }
}

/// Internal glass background for sliver app bar.
class _SliverGlassBackground extends StatelessWidget {
  final GlassAppBarConfig config;
  final Widget? child;

  const _SliverGlassBackground({
    required this.config,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: config.blurSigma,
              sigmaY: config.blurSigma,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: config.tintColor,
                gradient: config.gradientColors != null
                    ? LinearGradient(
                        colors: config.gradientColors!,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

/// Animated glass app bar that transitions smoothly.
class AnimatedGlassAppBar extends StatefulWidget {
  /// The title widget.
  final Widget? title;

  /// The leading widget.
  final Widget? leading;

  /// Action widgets.
  final List<Widget>? actions;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// Initial configuration.
  final GlassAppBarConfig initialConfig;

  /// Target configuration to animate to.
  final GlassAppBarConfig targetConfig;

  /// Whether to animate to target.
  final bool animateToTarget;

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Creates an [AnimatedGlassAppBar].
  const AnimatedGlassAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    required this.initialConfig,
    required this.targetConfig,
    this.animateToTarget = false,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedGlassAppBar> createState() => _AnimatedGlassAppBarState();
}

class _AnimatedGlassAppBarState extends State<AnimatedGlassAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    if (widget.animateToTarget) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(AnimatedGlassAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animateToTarget != oldWidget.animateToTarget) {
      if (widget.animateToTarget) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final config = GlassAppBarConfig.lerp(
          widget.initialConfig,
          widget.targetConfig,
          _animation.value,
        );

        return GlassAppBar(
          title: widget.title,
          leading: widget.leading,
          actions: widget.actions,
          centerTitle: widget.centerTitle,
          config: config,
        );
      },
    );
  }
}

/// A scrollable-aware glass app bar that changes appearance on scroll.
class ScrollAwareGlassAppBar extends StatefulWidget {
  /// The scroll controller to listen to.
  final ScrollController scrollController;

  /// The title widget.
  final Widget? title;

  /// The leading widget.
  final Widget? leading;

  /// Action widgets.
  final List<Widget>? actions;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// Config when at top of scroll.
  final GlassAppBarConfig? topConfig;

  /// Config when scrolled.
  final GlassAppBarConfig? scrolledConfig;

  /// Scroll threshold to trigger config change.
  final double scrollThreshold;

  /// Creates a [ScrollAwareGlassAppBar].
  const ScrollAwareGlassAppBar({
    super.key,
    required this.scrollController,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.topConfig,
    this.scrolledConfig,
    this.scrollThreshold = 50.0,
  });

  @override
  State<ScrollAwareGlassAppBar> createState() => _ScrollAwareGlassAppBarState();
}

class _ScrollAwareGlassAppBarState extends State<ScrollAwareGlassAppBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final isScrolled = widget.scrollController.offset > widget.scrollThreshold;
    if (isScrolled != _isScrolled) {
      setState(() {
        _isScrolled = isScrolled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final topConfig = widget.topConfig ??
        const GlassAppBarConfig(
          blurSigma: 0,
          tintColor: Colors.transparent,
        );

    final scrolledConfig = widget.scrolledConfig ??
        const GlassAppBarConfig(
          blurSigma: 20,
          tintColor: Color(0x44FFFFFF),
        );

    return AnimatedGlassAppBar(
      title: widget.title,
      leading: widget.leading,
      actions: widget.actions,
      centerTitle: widget.centerTitle,
      initialConfig: topConfig,
      targetConfig: scrolledConfig,
      animateToTarget: _isScrolled,
    );
  }
}
