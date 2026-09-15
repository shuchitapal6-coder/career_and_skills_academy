import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  final double size;
  final double iconSize;

  final Color? backgroundColor;
  final Color? iconColor;

  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  final EdgeInsets padding;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 48,
    this.iconSize = 22,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius = 14,
    this.boxShadow,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.secondary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor ?? AppColors.secondary,
          ),
        ),
      ),
    );
  }
}