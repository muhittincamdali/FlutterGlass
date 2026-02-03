import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// Animation presets for glass effects.
enum GlassAnimationPreset {
  /// Fade in animation.
  fadeIn,

  /// Fade out animation.
  fadeOut,

  /// Scale up animation.
  scaleUp,

  /// Scale down animation.
  scaleDown,

  /// Slide from left.
  slideLeft,

  /// Slide from right.
  slideRight,

  /// Slide from top.
  slideTop,

  /// Slide from bottom.
  slideBottom,

  /// Blur in animation.
  blurIn,

  /// Blur out animation.
  blurOut,

  /// Morph animation.
  morph,

  /// Bounce animation.
  bounce,

  /// Elastic animation.
  elastic,

  /// Spring animation.
  spring,

  /// Pulse animation.
  pulse,

  /// Shake animation.
  shake,

  /// Rotate animation.
  rotate,

  /// Flip animation.
  flip,
}

/// Configuration for glass animations.
class GlassAnimationConfig {
  /// The animation duration.
  final Duration duration;

  /// The animation curve.
  final Curve curve;

  /// The animation delay.
  final Duration delay;

  /// Whether to repeat the animation.
  final bool repeat;

  /// Whether to reverse the animation.
  final bool reverse;

  /// The repeat count (null for infinite).
  final int? repeatCount;

  /// Spring damping for physics-based animations.
  final double springDamping;

  /// Spring stiffness for physics-based animations.
  final double springStiffness;

  /// Creates a [GlassAnimationConfig].
  const GlassAnimationConfig({
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.delay = Duration.zero,
    this.repeat = false,
    this.reverse = false,
    this.repeatCount,
    this.springDamping = 0.7,
    this.springStiffness = 180.0,
  });

  /// Creates a fast animation config.
  factory GlassAnimationConfig.fast() {
    return const GlassAnimationConfig(
      duration: Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
  }

  /// Creates a slow animation config.
  factory GlassAnimationConfig.slow() {
    return const GlassAnimationConfig(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  /// Creates a bouncy animation config.
  factory GlassAnimationConfig.bouncy() {
    return const GlassAnimationConfig(
      duration: Duration(milliseconds: 500),
      curve: Curves.elasticOut,
    );
  }

  /// Creates a spring animation config.
  factory GlassAnimationConfig.spring() {
    return const GlassAnimationConfig(
      duration: Duration(milliseconds: 400),
      springDamping: 0.6,
      springStiffness: 200.0,
    );
  }

  /// Creates a copy with modified properties.
  GlassAnimationConfig copyWith({
    Duration? duration,
    Curve? curve,
    Duration? delay,
    bool? repeat,
    bool? reverse,
    int? repeatCount,
    double? springDamping,
    double? springStiffness,
  }) {
    return GlassAnimationConfig(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      delay: delay ?? this.delay,
      repeat: repeat ?? this.repeat,
      reverse: reverse ?? this.reverse,
      repeatCount: repeatCount ?? this.repeatCount,
      springDamping: springDamping ?? this.springDamping,
      springStiffness: springStiffness ?? this.springStiffness,
    );
  }
}

/// A controller for glass animations.
class GlassAnimationController extends ChangeNotifier {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TickerProvider vsync;
  GlassAnimationConfig _config;

  /// The current animation value.
  double get value => _animation.value;

  /// Whether the animation is running.
  bool get isAnimating => _controller.isAnimating;

  /// Whether the animation is completed.
  bool get isCompleted => _controller.isCompleted;

  /// Whether the animation is dismissed.
  bool get isDismissed => _controller.isDismissed;

  /// Creates a [GlassAnimationController].
  GlassAnimationController({
    required this.vsync,
    GlassAnimationConfig? config,
  }) : _config = config ?? const GlassAnimationConfig() {
    _controller = AnimationController(
      duration: _config.duration,
      vsync: vsync,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: _config.curve,
    );
    _controller.addListener(notifyListeners);
  }

  /// Updates the configuration.
  void updateConfig(GlassAnimationConfig config) {
    _config = config;
    _controller.duration = config.duration;
    _animation = CurvedAnimation(
      parent: _controller,
      curve: config.curve,
    );
  }

  /// Starts the animation forward.
  Future<void> forward({double? from}) async {
    if (_config.delay != Duration.zero) {
      await Future.delayed(_config.delay);
    }
    return _controller.forward(from: from);
  }

  /// Starts the animation backward.
  Future<void> reverse({double? from}) {
    return _controller.reverse(from: from);
  }

  /// Resets the animation.
  void reset() {
    _controller.reset();
  }

  /// Animates to a specific value.
  Future<void> animateTo(double target, {Duration? duration, Curve? curve}) {
    return _controller.animateTo(
      target,
      duration: duration,
      curve: curve ?? _config.curve,
    );
  }

  /// Repeats the animation.
  void repeat({bool reverse = false}) {
    _controller.repeat(reverse: reverse);
  }

  /// Stops the animation.
  void stop() {
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// An animated glass container.
class AnimatedGlassContainer extends StatefulWidget {
  /// The child widget.
  final Widget child;

  /// The animation preset.
  final GlassAnimationPreset preset;

  /// The animation configuration.
  final GlassAnimationConfig? config;

  /// Whether to play the animation on mount.
  final bool playOnMount;

  /// Called when the animation completes.
  final VoidCallback? onComplete;

  /// Blur sigma for blur animations.
  final double blurSigma;

  /// Tint color.
  final Color tintColor;

  /// Border radius.
  final BorderRadius borderRadius;

  /// Creates an [AnimatedGlassContainer].
  const AnimatedGlassContainer({
    super.key,
    required this.child,
    required this.preset,
    this.config,
    this.playOnMount = true,
    this.onComplete,
    this.blurSigma = 15.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderRadius = BorderRadius.zero,
  });

  @override
  State<AnimatedGlassContainer> createState() => _AnimatedGlassContainerState();
}

class _AnimatedGlassContainerState extends State<AnimatedGlassContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    final config = widget.config ?? const GlassAnimationConfig();

    _controller = AnimationController(
      duration: config.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: config.curve,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
        if (config.repeat) {
          if (config.reverse) {
            _controller.reverse();
          } else {
            _controller.reset();
            _controller.forward();
          }
        }
      } else if (status == AnimationStatus.dismissed && config.repeat) {
        _controller.forward();
      }
    });

    if (widget.playOnMount) {
      Future.delayed(config.delay, () {
        if (mounted) _controller.forward();
      });
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
        return _buildAnimatedChild(_animation.value);
      },
    );
  }

  Widget _buildAnimatedChild(double value) {
    switch (widget.preset) {
      case GlassAnimationPreset.fadeIn:
        return Opacity(
          opacity: value,
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.fadeOut:
        return Opacity(
          opacity: 1.0 - value,
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.scaleUp:
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.scaleDown:
        return Transform.scale(
          scale: 1.0 + (1.0 - value) * 0.2,
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.slideLeft:
        return Transform.translate(
          offset: Offset((1.0 - value) * 100, 0),
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.slideRight:
        return Transform.translate(
          offset: Offset((value - 1.0) * 100, 0),
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.slideTop:
        return Transform.translate(
          offset: Offset(0, (1.0 - value) * 100),
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.slideBottom:
        return Transform.translate(
          offset: Offset(0, (value - 1.0) * 100),
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.blurIn:
        return _buildBlurredGlassChild((1.0 - value) * 20);

      case GlassAnimationPreset.blurOut:
        return _buildBlurredGlassChild(value * 20);

      case GlassAnimationPreset.morph:
        return _buildMorphedGlassChild(value);

      case GlassAnimationPreset.bounce:
        final bounceValue = math.sin(value * math.pi * 2) * (1.0 - value) * 0.2;
        return Transform.translate(
          offset: Offset(0, bounceValue * 50),
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.elastic:
        final elasticValue = math.pow(2, -10 * value) *
            math.sin((value - 0.1) * 5 * math.pi) +
            1;
        return Transform.scale(
          scale: elasticValue.toDouble(),
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.spring:
        return Transform.scale(
          scale: value,
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.pulse:
        final pulseValue = 1.0 + math.sin(value * math.pi * 2) * 0.05;
        return Transform.scale(
          scale: pulseValue,
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.shake:
        final shakeValue = math.sin(value * math.pi * 8) * (1.0 - value) * 10;
        return Transform.translate(
          offset: Offset(shakeValue, 0),
          child: _buildGlassChild(),
        );

      case GlassAnimationPreset.rotate:
        return Transform.rotate(
          angle: value * math.pi * 2,
          child: Opacity(
            opacity: value,
            child: _buildGlassChild(),
          ),
        );

      case GlassAnimationPreset.flip:
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value * math.pi),
          alignment: Alignment.center,
          child: _buildGlassChild(),
        );
    }
  }

  Widget _buildGlassChild() {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurSigma,
          sigmaY: widget.blurSigma,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.tintColor,
            borderRadius: widget.borderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }

  Widget _buildBlurredGlassChild(double extraBlur) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurSigma + extraBlur,
          sigmaY: widget.blurSigma + extraBlur,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.tintColor,
            borderRadius: widget.borderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }

  Widget _buildMorphedGlassChild(double value) {
    final borderRadius = BorderRadius.circular(
      widget.borderRadius.topLeft.x * (1.0 + math.sin(value * math.pi) * 0.5),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurSigma,
          sigmaY: widget.blurSigma,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.tintColor,
            borderRadius: borderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// A glass transition animation builder.
class GlassTransition extends StatelessWidget {
  /// The child widget.
  final Widget child;

  /// The animation.
  final Animation<double> animation;

  /// The slide offset.
  final Offset slideOffset;

  /// The scale factor.
  final double scaleFactor;

  /// Whether to fade.
  final bool fade;

  /// Blur intensity.
  final double blurSigma;

  /// Creates a [GlassTransition].
  const GlassTransition({
    super.key,
    required this.child,
    required this.animation,
    this.slideOffset = Offset.zero,
    this.scaleFactor = 1.0,
    this.fade = true,
    this.blurSigma = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        Widget result = child;

        if (slideOffset != Offset.zero) {
          result = Transform.translate(
            offset: Offset(
              slideOffset.dx * (1.0 - animation.value),
              slideOffset.dy * (1.0 - animation.value),
            ),
            child: result,
          );
        }

        if (scaleFactor != 1.0) {
          final scale = 1.0 + (scaleFactor - 1.0) * (1.0 - animation.value);
          result = Transform.scale(
            scale: scale,
            child: result,
          );
        }

        if (fade) {
          result = Opacity(
            opacity: animation.value,
            child: result,
          );
        }

        if (blurSigma > 0) {
          final blur = blurSigma * (1.0 - animation.value);
          result = ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: result,
          );
        }

        return result;
      },
    );
  }
}

/// A page route with glass transition.
class GlassPageRoute<T> extends PageRouteBuilder<T> {
  /// Creates a [GlassPageRoute].
  GlassPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    GlassAnimationPreset preset = GlassAnimationPreset.fadeIn,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          settings: settings,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return _buildTransition(preset, animation, curve, child);
          },
        );

  static Widget _buildTransition(
    GlassAnimationPreset preset,
    Animation<double> animation,
    Curve curve,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    switch (preset) {
      case GlassAnimationPreset.fadeIn:
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );

      case GlassAnimationPreset.scaleUp:
        return ScaleTransition(
          scale: curvedAnimation,
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );

      case GlassAnimationPreset.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case GlassAnimationPreset.slideRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case GlassAnimationPreset.slideTop:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case GlassAnimationPreset.slideBottom:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      default:
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
    }
  }
}

/// A staggered glass animation for lists.
class StaggeredGlassAnimation extends StatefulWidget {
  /// The children to animate.
  final List<Widget> children;

  /// The animation preset.
  final GlassAnimationPreset preset;

  /// The stagger delay between items.
  final Duration staggerDelay;

  /// The item animation duration.
  final Duration itemDuration;

  /// The animation curve.
  final Curve curve;

  /// Whether to play on mount.
  final bool playOnMount;

  /// Creates a [StaggeredGlassAnimation].
  const StaggeredGlassAnimation({
    super.key,
    required this.children,
    this.preset = GlassAnimationPreset.fadeIn,
    this.staggerDelay = const Duration(milliseconds: 50),
    this.itemDuration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.playOnMount = true,
  });

  @override
  State<StaggeredGlassAnimation> createState() =>
      _StaggeredGlassAnimationState();
}

class _StaggeredGlassAnimationState extends State<StaggeredGlassAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _initAnimations();

    if (widget.playOnMount) {
      _playStaggeredAnimation();
    }
  }

  void _initAnimations() {
    _controllers = List.generate(
      widget.children.length,
      (index) => AnimationController(
        duration: widget.itemDuration,
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      );
    }).toList();
  }

  Future<void> _playStaggeredAnimation() async {
    for (var i = 0; i < _controllers.length; i++) {
      await Future.delayed(widget.staggerDelay);
      if (mounted) {
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.children.length, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return _buildAnimatedItem(
              widget.children[index],
              _animations[index].value,
            );
          },
        );
      }),
    );
  }

  Widget _buildAnimatedItem(Widget child, double value) {
    switch (widget.preset) {
      case GlassAnimationPreset.fadeIn:
        return Opacity(
          opacity: value,
          child: child,
        );

      case GlassAnimationPreset.slideLeft:
        return Transform.translate(
          offset: Offset((1.0 - value) * 50, 0),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );

      case GlassAnimationPreset.scaleUp:
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );

      default:
        return Opacity(
          opacity: value,
          child: child,
        );
    }
  }
}

/// A hero animation with glass effect.
class GlassHero extends StatelessWidget {
  /// The hero tag.
  final Object tag;

  /// The child widget.
  final Widget child;

  /// Blur sigma during flight.
  final double flightBlurSigma;

  /// Tint color during flight.
  final Color flightTintColor;

  /// Creates a [GlassHero].
  const GlassHero({
    super.key,
    required this.tag,
    required this.child,
    this.flightBlurSigma = 10.0,
    this.flightTintColor = const Color(0x22FFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final progress = animation.value;
            final blur = flightBlurSigma * math.sin(progress * math.pi);

            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(
                  decoration: BoxDecoration(
                    color: flightTintColor.withValues(
                      alpha: flightTintColor.a * math.sin(progress * math.pi),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: child,
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}

/// An implicit glass animation widget.
class AnimatedGlass extends ImplicitlyAnimatedWidget {
  /// The child widget.
  final Widget? child;

  /// Blur sigma.
  final double blurSigma;

  /// Tint color.
  final Color tintColor;

  /// Border radius.
  final BorderRadius borderRadius;

  /// Border color.
  final Color borderColor;

  /// Border width.
  final double borderWidth;

  /// Creates an [AnimatedGlass].
  const AnimatedGlass({
    super.key,
    this.child,
    required this.blurSigma,
    required this.tintColor,
    this.borderRadius = BorderRadius.zero,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    super.duration = const Duration(milliseconds: 300),
    super.curve = Curves.easeInOut,
    super.onEnd,
  });

  @override
  ImplicitlyAnimatedWidgetState<AnimatedGlass> createState() =>
      _AnimatedGlassState();
}

class _AnimatedGlassState extends ImplicitlyAnimatedWidgetState<AnimatedGlass> {
  Tween<double>? _blurSigmaTween;
  ColorTween? _tintColorTween;
  BorderRadiusTween? _borderRadiusTween;
  ColorTween? _borderColorTween;
  Tween<double>? _borderWidthTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _blurSigmaTween = visitor(
      _blurSigmaTween,
      widget.blurSigma,
      (value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;

    _tintColorTween = visitor(
      _tintColorTween,
      widget.tintColor,
      (value) => ColorTween(begin: value as Color),
    ) as ColorTween?;

    _borderRadiusTween = visitor(
      _borderRadiusTween,
      widget.borderRadius,
      (value) => BorderRadiusTween(begin: value as BorderRadius),
    ) as BorderRadiusTween?;

    _borderColorTween = visitor(
      _borderColorTween,
      widget.borderColor,
      (value) => ColorTween(begin: value as Color),
    ) as ColorTween?;

    _borderWidthTween = visitor(
      _borderWidthTween,
      widget.borderWidth,
      (value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    final blurSigma = _blurSigmaTween?.evaluate(animation) ?? widget.blurSigma;
    final tintColor = _tintColorTween?.evaluate(animation) ?? widget.tintColor;
    final borderRadius =
        _borderRadiusTween?.evaluate(animation) ?? widget.borderRadius;
    final borderColor =
        _borderColorTween?.evaluate(animation) ?? widget.borderColor;
    final borderWidth =
        _borderWidthTween?.evaluate(animation) ?? widget.borderWidth;

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          decoration: BoxDecoration(
            color: tintColor,
            borderRadius: borderRadius,
            border: borderWidth > 0
                ? Border.all(color: borderColor, width: borderWidth)
                : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
