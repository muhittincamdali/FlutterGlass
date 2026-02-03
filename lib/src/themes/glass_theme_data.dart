import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Complete theme data for glass effects.
///
/// This provides a comprehensive theming system for all glass widgets
/// in the FlutterGlass package.
class GlassThemeData {
  /// The default blur sigma.
  final double blurSigma;

  /// The tint color for glass effects.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The default border radius.
  final BorderRadius borderRadius;

  /// Shadow configuration.
  final BoxShadow? shadow;

  /// Card theme data.
  final GlassCardThemeData cardTheme;

  /// Button theme data.
  final GlassButtonThemeData buttonTheme;

  /// App bar theme data.
  final GlassAppBarThemeData appBarTheme;

  /// Navigation bar theme data.
  final GlassNavigationBarThemeData navigationBarTheme;

  /// Bottom sheet theme data.
  final GlassBottomSheetThemeData bottomSheetTheme;

  /// Text field theme data.
  final GlassTextFieldThemeData textFieldTheme;

  /// Dialog theme data.
  final GlassDialogThemeData dialogTheme;

  /// Tooltip theme data.
  final GlassTooltipThemeData tooltipTheme;

  /// Chip theme data.
  final GlassChipThemeData chipTheme;

  /// Slider theme data.
  final GlassSliderThemeData sliderTheme;

  /// Switch theme data.
  final GlassSwitchThemeData switchTheme;

  /// Animation configuration.
  final GlassAnimationThemeData animationTheme;

  /// Creates a [GlassThemeData].
  const GlassThemeData({
    this.blurSigma = 15.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.5,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.shadow,
    this.cardTheme = const GlassCardThemeData(),
    this.buttonTheme = const GlassButtonThemeData(),
    this.appBarTheme = const GlassAppBarThemeData(),
    this.navigationBarTheme = const GlassNavigationBarThemeData(),
    this.bottomSheetTheme = const GlassBottomSheetThemeData(),
    this.textFieldTheme = const GlassTextFieldThemeData(),
    this.dialogTheme = const GlassDialogThemeData(),
    this.tooltipTheme = const GlassTooltipThemeData(),
    this.chipTheme = const GlassChipThemeData(),
    this.sliderTheme = const GlassSliderThemeData(),
    this.switchTheme = const GlassSwitchThemeData(),
    this.animationTheme = const GlassAnimationThemeData(),
  });

  /// Creates a light theme.
  factory GlassThemeData.light() {
    return const GlassThemeData(
      blurSigma: 20.0,
      tintColor: Color(0x66FFFFFF),
      borderColor: Color(0x33FFFFFF),
      borderWidth: 1.0,
      cardTheme: GlassCardThemeData(
        tintColor: Color(0x77FFFFFF),
        borderColor: Color(0x44FFFFFF),
      ),
      buttonTheme: GlassButtonThemeData(
        tintColor: Color(0x55FFFFFF),
        textColor: Color(0xFF333333),
      ),
    );
  }

  /// Creates a dark theme.
  factory GlassThemeData.dark() {
    return const GlassThemeData(
      blurSigma: 25.0,
      tintColor: Color(0x33000000),
      borderColor: Color(0x22FFFFFF),
      borderWidth: 0.5,
      cardTheme: GlassCardThemeData(
        tintColor: Color(0x44000000),
        borderColor: Color(0x22FFFFFF),
      ),
      buttonTheme: GlassButtonThemeData(
        tintColor: Color(0x33FFFFFF),
        textColor: Color(0xFFFFFFFF),
      ),
    );
  }

  /// Creates a vibrant theme with colorful accents.
  factory GlassThemeData.vibrant() {
    return const GlassThemeData(
      blurSigma: 30.0,
      tintColor: Color(0x22FFFFFF),
      borderColor: Color(0x55FFFFFF),
      borderWidth: 1.5,
      cardTheme: GlassCardThemeData(
        tintColor: Color(0x33FFFFFF),
        borderColor: Color(0x44FFFFFF),
        gradientColors: [
          Color(0x22FF6B6B),
          Color(0x224ECDC4),
        ],
      ),
    );
  }

  /// Creates a frosted theme with heavy blur.
  factory GlassThemeData.frosted() {
    return const GlassThemeData(
      blurSigma: 40.0,
      tintColor: Color(0x55FFFFFF),
      borderColor: Color(0x33FFFFFF),
      borderWidth: 1.0,
    );
  }

  /// Creates a subtle theme with minimal effects.
  factory GlassThemeData.subtle() {
    return const GlassThemeData(
      blurSigma: 8.0,
      tintColor: Color(0x22FFFFFF),
      borderColor: Color(0x22FFFFFF),
      borderWidth: 0.5,
    );
  }

  /// Creates a copy with modified properties.
  GlassThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    BoxShadow? shadow,
    GlassCardThemeData? cardTheme,
    GlassButtonThemeData? buttonTheme,
    GlassAppBarThemeData? appBarTheme,
    GlassNavigationBarThemeData? navigationBarTheme,
    GlassBottomSheetThemeData? bottomSheetTheme,
    GlassTextFieldThemeData? textFieldTheme,
    GlassDialogThemeData? dialogTheme,
    GlassTooltipThemeData? tooltipTheme,
    GlassChipThemeData? chipTheme,
    GlassSliderThemeData? sliderTheme,
    GlassSwitchThemeData? switchTheme,
    GlassAnimationThemeData? animationTheme,
  }) {
    return GlassThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      shadow: shadow ?? this.shadow,
      cardTheme: cardTheme ?? this.cardTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      appBarTheme: appBarTheme ?? this.appBarTheme,
      navigationBarTheme: navigationBarTheme ?? this.navigationBarTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      textFieldTheme: textFieldTheme ?? this.textFieldTheme,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      tooltipTheme: tooltipTheme ?? this.tooltipTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      sliderTheme: sliderTheme ?? this.sliderTheme,
      switchTheme: switchTheme ?? this.switchTheme,
      animationTheme: animationTheme ?? this.animationTheme,
    );
  }

  /// Linear interpolation between two themes.
  static GlassThemeData lerp(GlassThemeData? a, GlassThemeData? b, double t) {
    if (a == null && b == null) return const GlassThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
      cardTheme: GlassCardThemeData.lerp(a.cardTheme, b.cardTheme, t),
      buttonTheme: GlassButtonThemeData.lerp(a.buttonTheme, b.buttonTheme, t),
      appBarTheme: GlassAppBarThemeData.lerp(a.appBarTheme, b.appBarTheme, t),
      navigationBarTheme: GlassNavigationBarThemeData.lerp(
          a.navigationBarTheme, b.navigationBarTheme, t),
      bottomSheetTheme: GlassBottomSheetThemeData.lerp(
          a.bottomSheetTheme, b.bottomSheetTheme, t),
      textFieldTheme:
          GlassTextFieldThemeData.lerp(a.textFieldTheme, b.textFieldTheme, t),
      dialogTheme: GlassDialogThemeData.lerp(a.dialogTheme, b.dialogTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlassThemeData &&
        other.blurSigma == blurSigma &&
        other.tintColor == tintColor &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode {
    return Object.hash(
      blurSigma,
      tintColor,
      borderColor,
      borderWidth,
      borderRadius,
    );
  }
}

/// Theme data for glass cards.
class GlassCardThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The border radius.
  final BorderRadius borderRadius;

  /// The padding.
  final EdgeInsets padding;

  /// Gradient colors.
  final List<Color>? gradientColors;

  /// Shadow.
  final BoxShadow? shadow;

  /// Hover tint color.
  final Color? hoverTintColor;

  /// Pressed tint color.
  final Color? pressedTintColor;

  /// Creates a [GlassCardThemeData].
  const GlassCardThemeData({
    this.blurSigma = 15.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.5,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.padding = const EdgeInsets.all(16),
    this.gradientColors,
    this.shadow,
    this.hoverTintColor,
    this.pressedTintColor,
  });

  /// Creates a copy with modified properties.
  GlassCardThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    List<Color>? gradientColors,
    BoxShadow? shadow,
    Color? hoverTintColor,
    Color? pressedTintColor,
  }) {
    return GlassCardThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      gradientColors: gradientColors ?? this.gradientColors,
      shadow: shadow ?? this.shadow,
      hoverTintColor: hoverTintColor ?? this.hoverTintColor,
      pressedTintColor: pressedTintColor ?? this.pressedTintColor,
    );
  }

  /// Linear interpolation.
  static GlassCardThemeData lerp(
      GlassCardThemeData? a, GlassCardThemeData? b, double t) {
    if (a == null && b == null) return const GlassCardThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassCardThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
      padding: EdgeInsets.lerp(a.padding, b.padding, t) ?? a.padding,
    );
  }
}

/// Theme data for glass buttons.
class GlassButtonThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The border radius.
  final BorderRadius borderRadius;

  /// The text color.
  final Color textColor;

  /// The text style.
  final TextStyle? textStyle;

  /// The padding.
  final EdgeInsets padding;

  /// Hover tint color.
  final Color hoverTintColor;

  /// Pressed tint color.
  final Color pressedTintColor;

  /// Disabled tint color.
  final Color disabledTintColor;

  /// Disabled text color.
  final Color disabledTextColor;

  /// Icon color.
  final Color iconColor;

  /// Icon size.
  final double iconSize;

  /// Creates a [GlassButtonThemeData].
  const GlassButtonThemeData({
    this.blurSigma = 15.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.5,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.textColor = Colors.white,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.hoverTintColor = const Color(0x44FFFFFF),
    this.pressedTintColor = const Color(0x22FFFFFF),
    this.disabledTintColor = const Color(0x11FFFFFF),
    this.disabledTextColor = const Color(0x66FFFFFF),
    this.iconColor = Colors.white,
    this.iconSize = 20.0,
  });

  /// Creates a copy with modified properties.
  GlassButtonThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    Color? textColor,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Color? hoverTintColor,
    Color? pressedTintColor,
    Color? disabledTintColor,
    Color? disabledTextColor,
    Color? iconColor,
    double? iconSize,
  }) {
    return GlassButtonThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      textColor: textColor ?? this.textColor,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
      hoverTintColor: hoverTintColor ?? this.hoverTintColor,
      pressedTintColor: pressedTintColor ?? this.pressedTintColor,
      disabledTintColor: disabledTintColor ?? this.disabledTintColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  /// Linear interpolation.
  static GlassButtonThemeData lerp(
      GlassButtonThemeData? a, GlassButtonThemeData? b, double t) {
    if (a == null && b == null) return const GlassButtonThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassButtonThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
      textColor: Color.lerp(a.textColor, b.textColor, t) ?? a.textColor,
      padding: EdgeInsets.lerp(a.padding, b.padding, t) ?? a.padding,
    );
  }
}

/// Theme data for glass app bars.
class GlassAppBarThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The title text style.
  final TextStyle titleTextStyle;

  /// The toolbar height.
  final double toolbarHeight;

  /// Icon color.
  final Color iconColor;

  /// Actions icon color.
  final Color actionsIconColor;

  /// Creates a [GlassAppBarThemeData].
  const GlassAppBarThemeData({
    this.blurSigma = 20.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x33FFFFFF),
    this.borderWidth = 0.5,
    this.titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    this.toolbarHeight = 56.0,
    this.iconColor = Colors.white,
    this.actionsIconColor = Colors.white,
  });

  /// Creates a copy with modified properties.
  GlassAppBarThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    TextStyle? titleTextStyle,
    double? toolbarHeight,
    Color? iconColor,
    Color? actionsIconColor,
  }) {
    return GlassAppBarThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      iconColor: iconColor ?? this.iconColor,
      actionsIconColor: actionsIconColor ?? this.actionsIconColor,
    );
  }

  /// Linear interpolation.
  static GlassAppBarThemeData lerp(
      GlassAppBarThemeData? a, GlassAppBarThemeData? b, double t) {
    if (a == null && b == null) return const GlassAppBarThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassAppBarThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      toolbarHeight:
          lerpDouble(a.toolbarHeight, b.toolbarHeight, t) ?? a.toolbarHeight,
    );
  }
}

/// Theme data for glass navigation bars.
class GlassNavigationBarThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The height.
  final double height;

  /// Selected item color.
  final Color selectedItemColor;

  /// Unselected item color.
  final Color unselectedItemColor;

  /// Indicator color.
  final Color? indicatorColor;

  /// Label style.
  final TextStyle? labelStyle;

  /// Selected label style.
  final TextStyle? selectedLabelStyle;

  /// Icon size.
  final double iconSize;

  /// Creates a [GlassNavigationBarThemeData].
  const GlassNavigationBarThemeData({
    this.blurSigma = 20.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 0.5,
    this.height = 80.0,
    this.selectedItemColor = Colors.white,
    this.unselectedItemColor = const Color(0x99FFFFFF),
    this.indicatorColor,
    this.labelStyle,
    this.selectedLabelStyle,
    this.iconSize = 24.0,
  });

  /// Creates a copy with modified properties.
  GlassNavigationBarThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    double? height,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? indicatorColor,
    TextStyle? labelStyle,
    TextStyle? selectedLabelStyle,
    double? iconSize,
  }) {
    return GlassNavigationBarThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      height: height ?? this.height,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      labelStyle: labelStyle ?? this.labelStyle,
      selectedLabelStyle: selectedLabelStyle ?? this.selectedLabelStyle,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  /// Linear interpolation.
  static GlassNavigationBarThemeData lerp(
      GlassNavigationBarThemeData? a, GlassNavigationBarThemeData? b, double t) {
    if (a == null && b == null) return const GlassNavigationBarThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassNavigationBarThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      height: lerpDouble(a.height, b.height, t) ?? a.height,
      selectedItemColor:
          Color.lerp(a.selectedItemColor, b.selectedItemColor, t) ??
              a.selectedItemColor,
      unselectedItemColor:
          Color.lerp(a.unselectedItemColor, b.unselectedItemColor, t) ??
              a.unselectedItemColor,
    );
  }
}

/// Theme data for glass bottom sheets.
class GlassBottomSheetThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The border radius.
  final BorderRadius borderRadius;

  /// Handle color.
  final Color handleColor;

  /// Handle width.
  final double handleWidth;

  /// Handle height.
  final double handleHeight;

  /// Whether to show handle.
  final bool showHandle;

  /// Creates a [GlassBottomSheetThemeData].
  const GlassBottomSheetThemeData({
    this.blurSigma = 20.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(20)),
    this.handleColor = const Color(0x66FFFFFF),
    this.handleWidth = 40.0,
    this.handleHeight = 4.0,
    this.showHandle = true,
  });

  /// Creates a copy with modified properties.
  GlassBottomSheetThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    Color? handleColor,
    double? handleWidth,
    double? handleHeight,
    bool? showHandle,
  }) {
    return GlassBottomSheetThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      handleColor: handleColor ?? this.handleColor,
      handleWidth: handleWidth ?? this.handleWidth,
      handleHeight: handleHeight ?? this.handleHeight,
      showHandle: showHandle ?? this.showHandle,
    );
  }

  /// Linear interpolation.
  static GlassBottomSheetThemeData lerp(
      GlassBottomSheetThemeData? a, GlassBottomSheetThemeData? b, double t) {
    if (a == null && b == null) return const GlassBottomSheetThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassBottomSheetThemeData(
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
    );
  }
}

/// Theme data for glass text fields.
class GlassTextFieldThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The focused border color.
  final Color focusedBorderColor;

  /// The border width.
  final double borderWidth;

  /// The border radius.
  final BorderRadius borderRadius;

  /// The text style.
  final TextStyle textStyle;

  /// The hint text style.
  final TextStyle hintStyle;

  /// The label style.
  final TextStyle labelStyle;

  /// Cursor color.
  final Color cursorColor;

  /// Selection color.
  final Color selectionColor;

  /// Content padding.
  final EdgeInsets contentPadding;

  /// Creates a [GlassTextFieldThemeData].
  const GlassTextFieldThemeData({
    this.blurSigma = 10.0,
    this.tintColor = const Color(0x22FFFFFF),
    this.borderColor = const Color(0x33FFFFFF),
    this.focusedBorderColor = const Color(0x66FFFFFF),
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.textStyle = const TextStyle(color: Colors.white),
    this.hintStyle = const TextStyle(color: Color(0x99FFFFFF)),
    this.labelStyle = const TextStyle(color: Color(0xCCFFFFFF)),
    this.cursorColor = Colors.white,
    this.selectionColor = const Color(0x44FFFFFF),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  /// Creates a copy with modified properties.
  GlassTextFieldThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    Color? focusedBorderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    Color? cursorColor,
    Color? selectionColor,
    EdgeInsets? contentPadding,
  }) {
    return GlassTextFieldThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      cursorColor: cursorColor ?? this.cursorColor,
      selectionColor: selectionColor ?? this.selectionColor,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }

  /// Linear interpolation.
  static GlassTextFieldThemeData lerp(
      GlassTextFieldThemeData? a, GlassTextFieldThemeData? b, double t) {
    if (a == null && b == null) return const GlassTextFieldThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassTextFieldThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      focusedBorderColor:
          Color.lerp(a.focusedBorderColor, b.focusedBorderColor, t) ??
              a.focusedBorderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
    );
  }
}

/// Theme data for glass dialogs.
class GlassDialogThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border width.
  final double borderWidth;

  /// The border radius.
  final BorderRadius borderRadius;

  /// Title text style.
  final TextStyle titleStyle;

  /// Content text style.
  final TextStyle contentStyle;

  /// Content padding.
  final EdgeInsets contentPadding;

  /// Barrier color.
  final Color barrierColor;

  /// Creates a [GlassDialogThemeData].
  const GlassDialogThemeData({
    this.blurSigma = 25.0,
    this.tintColor = const Color(0x44FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.titleStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    this.contentStyle = const TextStyle(
      color: Color(0xCCFFFFFF),
      fontSize: 16,
    ),
    this.contentPadding = const EdgeInsets.all(24),
    this.barrierColor = const Color(0x88000000),
  });

  /// Creates a copy with modified properties.
  GlassDialogThemeData copyWith({
    double? blurSigma,
    Color? tintColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    EdgeInsets? contentPadding,
    Color? barrierColor,
  }) {
    return GlassDialogThemeData(
      blurSigma: blurSigma ?? this.blurSigma,
      tintColor: tintColor ?? this.tintColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      titleStyle: titleStyle ?? this.titleStyle,
      contentStyle: contentStyle ?? this.contentStyle,
      contentPadding: contentPadding ?? this.contentPadding,
      barrierColor: barrierColor ?? this.barrierColor,
    );
  }

  /// Linear interpolation.
  static GlassDialogThemeData lerp(
      GlassDialogThemeData? a, GlassDialogThemeData? b, double t) {
    if (a == null && b == null) return const GlassDialogThemeData();
    if (a == null) return b!;
    if (b == null) return a;

    return GlassDialogThemeData(
      blurSigma: lerpDouble(a.blurSigma, b.blurSigma, t) ?? a.blurSigma,
      tintColor: Color.lerp(a.tintColor, b.tintColor, t) ?? a.tintColor,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t) ?? a.borderColor,
      borderWidth:
          lerpDouble(a.borderWidth, b.borderWidth, t) ?? a.borderWidth,
      borderRadius:
          BorderRadius.lerp(a.borderRadius, b.borderRadius, t) ?? a.borderRadius,
      barrierColor:
          Color.lerp(a.barrierColor, b.barrierColor, t) ?? a.barrierColor,
    );
  }
}

/// Theme data for glass tooltips.
class GlassTooltipThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border radius.
  final BorderRadius borderRadius;

  /// Text style.
  final TextStyle textStyle;

  /// Padding.
  final EdgeInsets padding;

  /// Creates a [GlassTooltipThemeData].
  const GlassTooltipThemeData({
    this.blurSigma = 10.0,
    this.tintColor = const Color(0x77000000),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 12),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });
}

/// Theme data for glass chips.
class GlassChipThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// The tint color.
  final Color tintColor;

  /// The border color.
  final Color borderColor;

  /// The border radius.
  final BorderRadius borderRadius;

  /// Selected tint color.
  final Color selectedTintColor;

  /// Text style.
  final TextStyle textStyle;

  /// Padding.
  final EdgeInsets padding;

  /// Creates a [GlassChipThemeData].
  const GlassChipThemeData({
    this.blurSigma = 10.0,
    this.tintColor = const Color(0x33FFFFFF),
    this.borderColor = const Color(0x44FFFFFF),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.selectedTintColor = const Color(0x55FFFFFF),
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });
}

/// Theme data for glass sliders.
class GlassSliderThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// Track tint color.
  final Color trackTintColor;

  /// Active track color.
  final Color activeTrackColor;

  /// Thumb color.
  final Color thumbColor;

  /// Track height.
  final double trackHeight;

  /// Thumb radius.
  final double thumbRadius;

  /// Creates a [GlassSliderThemeData].
  const GlassSliderThemeData({
    this.blurSigma = 5.0,
    this.trackTintColor = const Color(0x33FFFFFF),
    this.activeTrackColor = const Color(0x88FFFFFF),
    this.thumbColor = Colors.white,
    this.trackHeight = 4.0,
    this.thumbRadius = 10.0,
  });
}

/// Theme data for glass switches.
class GlassSwitchThemeData {
  /// The blur sigma.
  final double blurSigma;

  /// Track tint color when off.
  final Color trackOffColor;

  /// Track tint color when on.
  final Color trackOnColor;

  /// Thumb color.
  final Color thumbColor;

  /// Track width.
  final double trackWidth;

  /// Track height.
  final double trackHeight;

  /// Creates a [GlassSwitchThemeData].
  const GlassSwitchThemeData({
    this.blurSigma = 5.0,
    this.trackOffColor = const Color(0x33FFFFFF),
    this.trackOnColor = const Color(0x88FFFFFF),
    this.thumbColor = Colors.white,
    this.trackWidth = 50.0,
    this.trackHeight = 30.0,
  });
}

/// Theme data for glass animations.
class GlassAnimationThemeData {
  /// Default animation duration.
  final Duration defaultDuration;

  /// Fast animation duration.
  final Duration fastDuration;

  /// Slow animation duration.
  final Duration slowDuration;

  /// Default curve.
  final Curve defaultCurve;

  /// Entrance curve.
  final Curve entranceCurve;

  /// Exit curve.
  final Curve exitCurve;

  /// Creates a [GlassAnimationThemeData].
  const GlassAnimationThemeData({
    this.defaultDuration = const Duration(milliseconds: 300),
    this.fastDuration = const Duration(milliseconds: 150),
    this.slowDuration = const Duration(milliseconds: 500),
    this.defaultCurve = Curves.easeInOut,
    this.entranceCurve = Curves.easeOut,
    this.exitCurve = Curves.easeIn,
  });
}
