import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  final double height;
  final double? width;

  final bool isLoading;
  final bool enabled;

  final bool isOutlined;
  final bool isTextButton;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final EdgeInsetsGeometry? padding;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  /// 🌈 Optional Linear Gradient (Overrides `backgroundColor` when enabled)
  final Gradient? gradient;

  final double borderRadius;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 50,
    this.width,
    this.isLoading = false,
    this.enabled = true,
    this.isOutlined = false,
    this.isTextButton = false,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.gradient,
    this.borderRadius = 14,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final bool isInteractive = enabled && !isLoading;

    // Resolve foreground/text color dynamically
    final Color buttonFg = foregroundColor ??
        (isOutlined || isTextButton
            ? colors.primary
            : (gradient != null ? Colors.white : colors.onPrimary));

    // Resolve background color dynamically
    final Color buttonBg = backgroundColor ??
        (isOutlined || isTextButton ? Colors.transparent : colors.primary);

    // Resolve border color dynamically
    final Color border = borderColor ?? (isOutlined ? colors.primary : Colors.transparent);

    Widget buildButtonChild() {
      if (isLoading) {
        return SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: buttonFg,
          ),
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            IconTheme(
              data: IconThemeData(color: buttonFg, size: 20),
              child: prefixIcon!,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge?.copyWith(
                color: isInteractive
                    ? buttonFg
                    : theme.disabledColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          if (suffixIcon != null) ...[
            const SizedBox(width: 8),
            IconTheme(
              data: IconThemeData(color: buttonFg, size: 20),
              child: suffixIcon!,
            ),
          ],
        ],
      );
    }

// ✅ CORRECT:
    final OutlinedBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: isOutlined ? BorderSide(color: border, width: 1.5) : BorderSide.none,
    );

    // ============================================================
    // GRADIENT BUTTON RENDER
    // ============================================================
    if (gradient != null && !isOutlined && !isTextButton) {
      return Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: isInteractive ? gradient : null,
          color: isInteractive ? null : theme.disabledColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: isInteractive && !isOutlined
              ? [
            BoxShadow(
              color: gradient!.colors.first.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isInteractive ? onTap : null,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 18),
              child: Center(child: buildButtonChild()),
            ),
          ),
        ),
      );
    }

    // ============================================================
    // STANDARD BUTTON STYLES (Elevated, Outlined, Text)
    // ============================================================
    final ButtonStyle style = ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(width ?? double.infinity, height)),
      padding: WidgetStatePropertyAll(
        padding ?? const EdgeInsets.symmetric(horizontal: 18),
      ),
      shape: WidgetStatePropertyAll(buttonShape),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return isOutlined || isTextButton
              ? Colors.transparent
              : theme.disabledColor.withOpacity(0.12);
        }
        return buttonBg;
      }),
      foregroundColor: WidgetStatePropertyAll(buttonFg),
      elevation: WidgetStatePropertyAll(isOutlined || isTextButton ? 0 : 1),
    );

    if (isTextButton) {
      return SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: isInteractive ? onTap : null,
          style: style,
          child: buildButtonChild(),
        ),
      );
    }

    if (isOutlined) {
      return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: isInteractive ? onTap : null,
          style: style,
          child: buildButtonChild(),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: isInteractive ? onTap : null,
        style: style,
        child: buildButtonChild(),
      ),
    );
  }
}