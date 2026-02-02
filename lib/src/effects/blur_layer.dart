import 'dart:ui';

import 'package:flutter/material.dart';

/// A stackable blur layer that can be combined with other layers
/// to create depth and multi-pass blur effects.
///
/// Place multiple [BlurLayer] widgets in a [Stack] to build
/// complex frosted glass compositions.
class BlurLayer extends StatelessWidget {
  /// The gaussian blur sigma.
  final double sigma;

  /// A tint color applied over the blurred area.
  final Color? tint;

  /// Saturation multiplier applied to the backdrop.
  ///
  /// Values greater than 1.0 increase saturation, less than 1.0 decrease it.
  final double saturation;

  /// Opacity of this blur layer.
  final double opacity;

  /// An optional child to render on top of the blur.
  final Widget? child;

  /// Creates a [BlurLayer].
  const BlurLayer({
    super.key,
    this.sigma = 10.0,
    this.tint,
    this.saturation = 1.0,
    this.opacity = 1.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: _buildFilter(),
            child: Container(
              color: tint ?? Colors.transparent,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  ImageFilter _buildFilter() {
    final blur = ImageFilter.blur(
      sigmaX: sigma,
      sigmaY: sigma,
    );

    if (saturation == 1.0) {
      return blur;
    }

    // Apply a color matrix to adjust saturation.
    final s = saturation;
    final sr = 0.2126 * (1 - s);
    final sg = 0.7152 * (1 - s);
    final sb = 0.0722 * (1 - s);

    final matrix = <double>[
      sr + s, sg, sb, 0, 0,
      sr, sg + s, sb, 0, 0,
      sr, sg, sb + s, 0, 0,
      0, 0, 0, 1, 0,
    ];

    return ImageFilter.compose(
      outer: ImageFilter.matrix(
        Float64List.fromList([
          matrix[0], matrix[1], matrix[2], 0,
          matrix[5], matrix[6], matrix[7], 0,
          matrix[10], matrix[11], matrix[12], 0,
          0, 0, 0, 1,
        ]),
      ),
      inner: blur,
    );
  }
}

/// Preset blur intensities for common use cases.
enum BlurIntensity {
  /// Subtle blur, sigma 5.
  light(5.0),

  /// Medium blur, sigma 15.
  medium(15.0),

  /// Heavy blur, sigma 30.
  heavy(30.0),

  /// Extreme blur, sigma 50.
  extreme(50.0);

  /// The sigma value for this intensity.
  final double sigma;

  const BlurIntensity(this.sigma);
}
