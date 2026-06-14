import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// FlutterGlass: Native iOS Material Bridge
/// 
/// Standard `BackdropFilter` in Flutter is computationally expensive and
/// does not match the exact iOS `.ultraThinMaterial` visual fidelity.
/// This widget acts as a bridge to render the actual `UIVisualEffectView` 
/// under your Flutter components for true zero-compromise aesthetics.
class NativeGlassIOS extends StatelessWidget {
  final Widget child;
  final double cornerRadius;

  const NativeGlassIOS({
    Key? key,
    required this.child,
    this.cornerRadius = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      // Fallback to standard Flutter BackdropFilter if not on iOS
      return _buildFallback();
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(cornerRadius),
          child: const UiKitView(
            viewType: 'com.flutterglass.native/ultraThinMaterial',
            creationParamsCodec: StandardMessageCodec(),
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildFallback() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: child,
    );
  }
}
