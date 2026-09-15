import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF07345B);
  static const Color primaryDark = Color(0xFF06233E);
  static const Color primaryLight = Color(0xFF0B5C8E);

  static const Color secondary = Color(0xFFF39A1E);
  static const Color secondaryDark = Color(0xFFD77E08);

  static const Color accentGlow = Color(0xFF2D8BC0);
  static const Color academyGold = Color(0xFFFFB52E);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  static const Color dividerColor = Color(0xFFE3EAF0);
  static const Color shadow = Color(0x1A000000);
  static const Color iconSecondary = Color(0xFF647D98);

  static const LinearGradient mainBgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      primary,
      primaryLight,
      secondary,
    ],
  );
  static const LinearGradient cardGlowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x140B5C8E),
      Color(0x14F39A1E),
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF39A1E),
      Color(0xFFFFB52E),
    ],
  );

  static const Color scaffoldBg = Color(0xFFF7F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardColor = surface;
  static const Color containerBg = Color(0xFFF0F5F9);

  static const Color darkScaffoldBg = Color(0xFF061B2D);
  static const Color darkSurface = Color(0xFF0A304A);
  static const Color darkCardColor = darkSurface;
  static const Color darkContainer = Color(0xFF103D5A);

  static const Color textPrimary = Color(0xFF102A43);
  static const Color textSecondary = Color(0xFF627D98);
  static const Color textHint = Color(0xFF9FB3C8);

  static const Color darkTextPrimary = Color(0xFFF5F9FC);
  static const Color darkTextSecondary = Color(0xFFB8C9D9);
  static const Color darkTextHint = Color(0xFF7892A8);

  static const Color borderColor = Color(0xFFD9E2EC);
  static const Color darkBorder = Color(0xFF1C4058);
  static const Color glowBorder = Color(0x662D8BC0);

  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);
  static const Color info = Color(0xFF2563EB);

  static List<BoxShadow> emeraldGlowShadow = [
    BoxShadow(
      color: secondary.withOpacity(0.28),
      blurRadius: 18,
      spreadRadius: 1,
      offset: const Offset(0, 5),
    ),
  ];

  static List<BoxShadow> cyanGlowShadow = [
    BoxShadow(
      color: primaryLight.withOpacity(0.25),
      blurRadius: 22,
      spreadRadius: 1,
      offset: const Offset(0, 6),
    ),
  ];
}