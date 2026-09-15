import 'package:flutter/material.dart';



class TweenFadeSlide extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final Curve curve;

  const TweenFadeSlide({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.beginOffset = const Offset(0, 20),
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0.0, end: 1.0),
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              beginOffset.dx * (1 - value),
              beginOffset.dy * (1 - value),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class TweenScaleFade extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const TweenScaleFade({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0.95, end: 1.0),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: ((scale - 0.95) / 0.05).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class TweenImageZoom extends StatelessWidget {
  final Widget child;

  const TweenImageZoom({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 700),
      tween: Tween(begin: 1.1, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}