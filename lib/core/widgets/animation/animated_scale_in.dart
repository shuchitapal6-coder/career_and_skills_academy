import 'package:flutter/material.dart';

class TweenScaleAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const TweenScaleAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0.8, end: 1),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value.clamp(0, 1),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}