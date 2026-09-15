import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();

  /// Main brand gradient
  /// Use for splash, hero sections, primary CTA areas.
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF07345B),
      Color(0xFF0B5C8E),
    ],
  );

  /// Premium brand gradient
  /// Navy → Blue → subtle Orange
  static const LinearGradient brand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF07345B),
      Color(0xFF0B5C8E),
      Color(0xFFF39A1E),
    ],
    stops: [
      0.0,
      0.72,
      1.0,
    ],
  );

  /// Orange CTA gradient
  static const LinearGradient orange = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF39A1E),
      Color(0xFFFFB52E),
    ],
  );

  /// Hero/banner gradient
  static const LinearGradient hero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF062D4F),
      Color(0xFF0B5C8E),
    ],
  );

  /// App bar gradient
  static const LinearGradient appBar = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF07345B),
      Color(0xFF0B5C8E),
    ],
  );

  /// Soft blue background
  static const LinearGradient softBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF5F9FC),
      Color(0xFFEAF3F9),
    ],
  );

  /// Course card gradient
  static const LinearGradient course = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0B5C8E),
      Color(0xFF07345B),
    ],
  );

  /// Dark theme background
  static const LinearGradient dark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF061B2D),
      Color(0xFF0A304A),
    ],
  );

  /// Image overlay
  static const LinearGradient imageOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0xCC061B2D),
    ],
  );
}