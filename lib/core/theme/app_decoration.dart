import 'package:flutter/material.dart';

import 'app_radius.dart';
import 'app_shadow.dart';

class AppDecorations {
  AppDecorations._();

  static BoxDecoration cardDecoration(
      BuildContext context, {
        Color? color,
        BorderRadius? radius,
      }) {
    final theme = Theme.of(context);

    return BoxDecoration(
      color: color ?? theme.colorScheme.surface,
      borderRadius: radius ?? AppRadius.border16,
      border: Border.all(
        color: theme.dividerColor.withOpacity(0.1),
      ),
      boxShadow:
      theme.brightness == Brightness.dark ? [] : AppShadow.card,
    );
  }

  static BoxDecoration elevatedCard(BuildContext context) {
    final theme = Theme.of(context);

    return BoxDecoration(
      color: theme.cardColor,
      borderRadius: AppRadius.border20,
      boxShadow:
      theme.brightness == Brightness.dark
          ? []
          : AppShadow.elevated,
    );
  }

  static BoxDecoration primaryCard(BuildContext context) {
    final theme = Theme.of(context);

    return BoxDecoration(
      color: theme.colorScheme.primary,
      borderRadius: AppRadius.border20,
    );
  }

  static BoxDecoration bottomSheet(BuildContext context) {
    final theme = Theme.of(context);

    return BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: const BorderRadius.vertical(
        top: AppRadius.xl,
      ),
      boxShadow:
      theme.brightness == Brightness.dark
          ? []
          : AppShadow.elevated,
    );
  }

  static BoxDecoration outlined(
      BuildContext context,
      ) {
    final theme = Theme.of(context);

    return BoxDecoration(
      color: theme.cardColor,
      borderRadius: AppRadius.border16,
      border: Border.all(
        color: theme.dividerColor,
      ),
    );
  }
}
