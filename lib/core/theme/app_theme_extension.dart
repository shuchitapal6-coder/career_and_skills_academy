import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Gradient primaryGradient;
  final Gradient secondaryGradient;
  final Gradient cardGradient;
  final Gradient surfaceGradient;

  const AppThemeExtension({
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.cardGradient,
    required this.surfaceGradient,
  });

  // ============================================================
  // LIGHT THEME
  // ============================================================

  static const AppThemeExtension light = AppThemeExtension(
    primaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.primary, AppColors.primaryLight],
    ),

    secondaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.secondary, AppColors.primary],
    ),

    cardGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.surface, AppColors.cardColor],
    ),

    surfaceGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.surface, AppColors.scaffoldBg],
    ),
  );

  // ============================================================
  // DARK THEME
  // ============================================================

  static const AppThemeExtension dark = AppThemeExtension(
    primaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.primaryLight, AppColors.primary],
    ),

    secondaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.secondary, AppColors.primaryLight],
    ),

    cardGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.darkCardColor, AppColors.darkSurface],
    ),

    surfaceGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.darkSurface, AppColors.darkScaffoldBg],
    ),
  );

  // ============================================================
  // COPY WITH
  // ============================================================

  @override
  AppThemeExtension copyWith({
    Gradient? primaryGradient,
    Gradient? secondaryGradient,
    Gradient? cardGradient,
    Gradient? surfaceGradient,
  }) {
    return AppThemeExtension(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      cardGradient: cardGradient ?? this.cardGradient,
      surfaceGradient: surfaceGradient ?? this.surfaceGradient,
    );
  }

  // ============================================================
  // LERP
  // ============================================================

  @override
  AppThemeExtension lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      primaryGradient:
          Gradient.lerp(primaryGradient, other.primaryGradient, t) ??
          primaryGradient,

      secondaryGradient:
          Gradient.lerp(secondaryGradient, other.secondaryGradient, t) ??
          secondaryGradient,

      cardGradient:
          Gradient.lerp(cardGradient, other.cardGradient, t) ?? cardGradient,

      surfaceGradient:
          Gradient.lerp(surfaceGradient, other.surfaceGradient, t) ??
          surfaceGradient,
    );
  }
}
