import 'dart:io';

import 'package:flutter/material.dart';

class CircleProfileWidget extends StatelessWidget {
  final String? imageUrl;
  final String? assetImage;
  final File? fileImage;

  final double radius;
  final double borderWidth;
  final Color? borderColor;
  final IconData fallbackIcon;
  final BoxFit fit;

  const CircleProfileWidget({
    super.key,
    this.imageUrl,
    this.assetImage,
    this.fileImage,
    this.radius = 45,
    this.borderWidth = 2,
    this.borderColor,
    this.fallbackIcon = Icons.person,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: radius * 2,
      height: radius * 2,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? colorScheme.primary,
          width: borderWidth,
        ),
      ),
      child: ClipOval(
        child: _buildImage(context),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (fileImage != null) {
      return Image.file(
        fileImage!,
        fit: fit,
      );
    }

    if (assetImage != null && assetImage!.isNotEmpty) {
      return Image.asset(
        assetImage!,
        fit: fit,
      );
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        fit: fit,
        loadingBuilder: (
            context,
            child,
            loadingProgress,
            ) {
          if (loadingProgress == null) return child;

          return Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) {
          return _fallback(context);
        },
      );
    }

    return _fallback(context);
  }

  Widget _fallback(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surface,
      child: Center(
        child: Icon(
          fallbackIcon,
          size: radius * .8,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}