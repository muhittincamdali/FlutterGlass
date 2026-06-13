import 'dart:ui';
import 'package:flutter/material.dart';

/// The Visual Signature of the World-Class Flutter Portfolio.
/// 
/// Provides a high-fidelity glassmorphism effect with custom blur,
/// tint, and border highlighting.
class LiquidGlass extends StatelessWidget {
  const LiquidGlass({
    super.key,
    required this.child,
    this.blur = 20.0,
    this.opacity = 0.1,
    this.borderRadius = 24.0,
    this.tintColor = Colors.white,
  });

  final Widget child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final Color tintColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: tintColor.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: tintColor.withValues(alpha: 0.2),
              width: 0.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A flagship demo view for visual proof in Flutter
class VisualProofShowcase extends StatelessWidget {
  const VisualProofShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          const _AuroraBackground(),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Flutter Mastery',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                LiquidGlass(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome_rounded,
                          size: 80,
                          color: Colors.white,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Native Performance\nZero Dependencies',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'World-Class Design Standard 2026',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AuroraBackground extends StatelessWidget {
  const _AuroraBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF007AFF),
            Color(0xFF5856D6),
            Color(0xFFFF2D55),
            Color(0xFFFF9500),
          ],
        ),
      ),
    );
  }
}
