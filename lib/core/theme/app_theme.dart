
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_typography.dart';
import 'app_theme_extension.dart';

class AppTheme {
AppTheme._();

// ============================================================
// LIGHT THEME
// ============================================================

static ThemeData lightTheme = ThemeData(
useMaterial3: true,
fontFamily: AppTypography.fontFamily,
brightness: Brightness.light,

// ============================================================
// THEME EXTENSIONS
// ============================================================

extensions:   [
AppThemeExtension.light,
],

// ============================================================
// BASE
// ============================================================

primaryColor: AppColors.primary,
scaffoldBackgroundColor: AppColors.scaffoldBg,

colorScheme: const ColorScheme.light(
primary: AppColors.primary,
secondary: AppColors.secondary,
surface: AppColors.surface,
error: AppColors.error,

onPrimary: AppColors.white,
onSecondary: AppColors.white,
onSurface: AppColors.textPrimary,
onError: AppColors.white,
),

// ============================================================
// APP BAR
// ============================================================

appBarTheme: AppBarTheme(
backgroundColor: AppColors.surface,
foregroundColor: AppColors.textPrimary,
elevation: 0,
centerTitle: true,
surfaceTintColor: AppColors.transparent,

titleTextStyle: TextStyle(
color: AppColors.textPrimary,
fontSize: 19,
fontWeight: FontWeight.w700,
),

iconTheme: IconThemeData(
color: AppColors.primary,
size: 24,
),
),

// ============================================================
// NAVIGATION BAR
// ============================================================

navigationBarTheme: NavigationBarThemeData(
backgroundColor: AppColors.surface,
surfaceTintColor: AppColors.transparent,

indicatorColor: AppColors.primaryLight.withValues(
alpha: 0.12,
),

elevation: 0,
height: 68,

iconTheme: WidgetStateProperty.resolveWith(
(states) {
final isSelected =
states.contains(WidgetState.selected);

return IconThemeData(
size: isSelected ? 25 : 22,
color: isSelected
? AppColors.primary
    : AppColors.iconSecondary,
);
},
),

labelTextStyle: WidgetStateProperty.resolveWith(
(states) {
final isSelected =
states.contains(WidgetState.selected);

return TextStyle(
fontSize: 12,
fontWeight: isSelected
? FontWeight.w700
    : FontWeight.w500,
color: isSelected
? AppColors.primary
    : AppColors.textSecondary,
);
},
),
),

// ============================================================
// CARD
// ============================================================

cardTheme: CardThemeData(
color: AppColors.cardColor,
elevation: 1.5,
shadowColor: AppColors.shadow,
margin: EdgeInsets.zero,

shape: RoundedRectangleBorder(
borderRadius: AppRadius.border16,
side: const BorderSide(
color: AppColors.borderColor,
width: 0.7,
),
),
),

// ============================================================
// ELEVATED BUTTON
// ============================================================

elevatedButtonTheme: ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
backgroundColor: AppColors.primary,
foregroundColor: AppColors.white,
elevation: 0,

minimumSize: const Size(
double.infinity,
54,
),

padding: const EdgeInsets.symmetric(
horizontal: 22,
vertical: 14,
),

shape: const RoundedRectangleBorder(
borderRadius: AppRadius.border16,
),

textStyle: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.w700,
letterSpacing: 0.2,
),
),
),

// ============================================================
// OUTLINED BUTTON
// ============================================================

outlinedButtonTheme: OutlinedButtonThemeData(
style: OutlinedButton.styleFrom(
foregroundColor: AppColors.primary,

side: const BorderSide(
color: AppColors.primary,
width: 1.3,
),

minimumSize: const Size(
double.infinity,
54,
),

padding: const EdgeInsets.symmetric(
horizontal: 22,
vertical: 14,
),

shape: const RoundedRectangleBorder(
borderRadius: AppRadius.border16,
),

textStyle: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
),

// ============================================================
// TEXT BUTTON
// ============================================================

textButtonTheme: TextButtonThemeData(
style: TextButton.styleFrom(
foregroundColor: AppColors.primary,

textStyle: const TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),

shape: const RoundedRectangleBorder(
borderRadius: AppRadius.border12,
),
),
),

// ============================================================
// CHIP
// ============================================================

chipTheme: ChipThemeData(
backgroundColor: AppColors.surface,

selectedColor: AppColors.primaryLight.withValues(
alpha: 0.10,
),

disabledColor: AppColors.containerBg,

side: const BorderSide(
color: AppColors.borderColor,
width: 1,
),

shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(24),
),

labelStyle: const TextStyle(
color: AppColors.textPrimary,
fontSize: 14,
fontWeight: FontWeight.w500,
),

secondaryLabelStyle: const TextStyle(
color: AppColors.primary,
),

padding: const EdgeInsets.symmetric(
horizontal: 14,
vertical: 10,
),
),

// ============================================================
// INPUT DECORATION
// ============================================================

inputDecorationTheme: const InputDecorationTheme(
filled: true,
fillColor: AppColors.surface,

contentPadding: EdgeInsets.symmetric(
horizontal: 16,
vertical: 16,
),

hintStyle: TextStyle(
color: AppColors.textHint,
fontSize: 14,
),

labelStyle: TextStyle(
color: AppColors.textSecondary,
fontSize: 14,
),

floatingLabelStyle: TextStyle(
color: AppColors.primary,
fontWeight: FontWeight.w600,
),

border: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.borderColor,
),
),

enabledBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.borderColor,
),
),

focusedBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.primary,
width: 1.5,
),
),

errorBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.error,
),
),

focusedErrorBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.error,
width: 1.5,
),
),

prefixIconColor: AppColors.iconSecondary,
suffixIconColor: AppColors.iconSecondary,
),

// ============================================================
// ICON
// ============================================================

iconTheme: const IconThemeData(
color: AppColors.primary,
size: 24,
),

// ============================================================
// DIVIDER
// ============================================================

dividerTheme: const DividerThemeData(
color: AppColors.dividerColor,
thickness: 1,
space: 1,
),

// ============================================================
// PROGRESS
// ============================================================

progressIndicatorTheme:
const ProgressIndicatorThemeData(
color: AppColors.primary,
),

// ============================================================
// TEXT
// ============================================================

textTheme: AppTypography.textTheme.apply(
bodyColor: AppColors.textPrimary,
displayColor: AppColors.textPrimary,
),
);

// ============================================================
// DARK THEME
// ============================================================

static ThemeData darkTheme = ThemeData(
useMaterial3: true,
fontFamily: AppTypography.fontFamily,
brightness: Brightness.dark,

// ============================================================
// THEME EXTENSIONS
// ============================================================

extensions:   [
AppThemeExtension.dark,
],

// ============================================================
// BASE
// ============================================================

primaryColor: AppColors.primaryLight,
scaffoldBackgroundColor: AppColors.darkScaffoldBg,

colorScheme: const ColorScheme.dark(
primary: AppColors.primaryLight,
secondary: AppColors.secondary,
surface: AppColors.darkSurface,
error: AppColors.error,

onPrimary: AppColors.white,
onSecondary: AppColors.white,
onSurface: AppColors.darkTextPrimary,
onError: AppColors.white,
),

// ============================================================
// APP BAR
// ============================================================

appBarTheme: const AppBarTheme(
backgroundColor: AppColors.darkScaffoldBg,
foregroundColor: AppColors.darkTextPrimary,
elevation: 0,
centerTitle: true,
surfaceTintColor: AppColors.transparent,

titleTextStyle: TextStyle(
color: AppColors.darkTextPrimary,
fontSize: 19,
fontWeight: FontWeight.w700,
),

iconTheme: IconThemeData(
color: AppColors.darkTextPrimary,
size: 24,
),
),

// ============================================================
// NAVIGATION BAR
// ============================================================

navigationBarTheme: NavigationBarThemeData(
backgroundColor: AppColors.darkSurface,
surfaceTintColor: AppColors.transparent,

indicatorColor: AppColors.secondary.withValues(
alpha: 0.15,
),

elevation: 0,
height: 68,

iconTheme: WidgetStateProperty.resolveWith(
(states) {
final isSelected =
states.contains(WidgetState.selected);

return IconThemeData(
size: isSelected ? 25 : 22,
color: isSelected
? AppColors.secondary
    : AppColors.darkTextSecondary,
);
},
),

labelTextStyle: WidgetStateProperty.resolveWith(
(states) {
final isSelected =
states.contains(WidgetState.selected);

return TextStyle(
fontSize: 12,
fontWeight: isSelected
? FontWeight.w700
    : FontWeight.w500,
color: isSelected
? AppColors.secondary
    : AppColors.darkTextSecondary,
);
},
),
),

// ============================================================
// CARD
// ============================================================

cardTheme: CardThemeData(
color: AppColors.darkCardColor,
elevation: 0,
margin: EdgeInsets.zero,

shape: RoundedRectangleBorder(
borderRadius: AppRadius.border16,
side: const BorderSide(
color: AppColors.darkBorder,
width: 1,
),
),
),

// ============================================================
// ELEVATED BUTTON
// ============================================================

elevatedButtonTheme: ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
backgroundColor: AppColors.secondary,
foregroundColor: AppColors.darkScaffoldBg,
elevation: 0,

minimumSize: const Size(
double.infinity,
54,
),

padding: const EdgeInsets.symmetric(
horizontal: 22,
vertical: 14,
),

shape: const RoundedRectangleBorder(
borderRadius: AppRadius.border16,
),

textStyle: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.w700,
),
),
),

// ============================================================
// OUTLINED BUTTON
// ============================================================

outlinedButtonTheme: OutlinedButtonThemeData(
style: OutlinedButton.styleFrom(
foregroundColor: AppColors.secondary,

side: const BorderSide(
color: AppColors.secondary,
width: 1.3,
),

minimumSize: const Size(
double.infinity,
54,
),

padding: const EdgeInsets.symmetric(
horizontal: 22,
vertical: 14,
),

shape: const RoundedRectangleBorder(
borderRadius: AppRadius.border16,
),

textStyle: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
),

// ============================================================
// TEXT BUTTON
// ============================================================

textButtonTheme: TextButtonThemeData(
style: TextButton.styleFrom(
foregroundColor: AppColors.secondary,

textStyle: const TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),

shape: const RoundedRectangleBorder(
borderRadius: AppRadius.border12,
),
),
),

// ============================================================
// CHIP
// ============================================================

chipTheme: ChipThemeData(
backgroundColor: AppColors.darkCardColor,

selectedColor: AppColors.secondary.withValues(
alpha: 0.15,
),

disabledColor: AppColors.darkContainer,

side: const BorderSide(
color: AppColors.darkBorder,
width: 1,
),

shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(24),
),

labelStyle: const TextStyle(
color: AppColors.darkTextPrimary,
fontSize: 14,
fontWeight: FontWeight.w500,
),

secondaryLabelStyle: const TextStyle(
color: AppColors.secondary,
),

padding: const EdgeInsets.symmetric(
horizontal: 14,
vertical: 10,
),
),

// ============================================================
// INPUT DECORATION
// ============================================================

inputDecorationTheme: const InputDecorationTheme(
filled: true,
fillColor: AppColors.darkCardColor,

contentPadding: EdgeInsets.symmetric(
horizontal: 16,
vertical: 16,
),

hintStyle: TextStyle(
color: AppColors.darkTextHint,
fontSize: 14,
),

labelStyle: TextStyle(
color: AppColors.darkTextSecondary,
fontSize: 14,
),

floatingLabelStyle: TextStyle(
color: AppColors.secondary,
fontWeight: FontWeight.w600,
),

border: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.darkBorder,
),
),

enabledBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.darkBorder,
),
),

focusedBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.secondary,
width: 1.5,
),
),

errorBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.error,
),
),

focusedErrorBorder: OutlineInputBorder(
borderRadius: AppRadius.border12,
borderSide: BorderSide(
color: AppColors.error,
width: 1.5,
),
),

prefixIconColor: AppColors.darkTextSecondary,
suffixIconColor: AppColors.darkTextSecondary,
),

// ============================================================
// ICON
// ============================================================

iconTheme: const IconThemeData(
color: AppColors.darkTextPrimary,
size: 24,
),

// ============================================================
// DIVIDER
// ============================================================

dividerTheme: const DividerThemeData(
color: AppColors.darkBorder,
thickness: 1,
space: 1,
),

// ============================================================
// PROGRESS
// ============================================================

progressIndicatorTheme:
const ProgressIndicatorThemeData(
color: AppColors.secondary,
),

// ============================================================
// TEXT
// ============================================================

textTheme: AppTypography.textTheme.apply(
bodyColor: AppColors.darkTextPrimary,
displayColor: AppColors.darkTextPrimary,
),
);
}
