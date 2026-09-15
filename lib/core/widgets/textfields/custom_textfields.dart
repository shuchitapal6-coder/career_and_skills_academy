import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;

  final String? label;
  final IconData? icon;
  final String? hint;

  final TextInputType keyboardType;
  final TextInputAction? textInputAction;

  final bool readOnly;
  final bool enabled;
  final int maxLines;
  final int? maxlength;
  final bool? obscureText;

  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  final String? Function(String?)? validator;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final Widget? suffix;
  final VoidCallback? onSuffixTap;

  final String? prefixText;
  final String? errorText;

  final List<TextInputFormatter>? inputFormatters;

  final FocusNode? focusNode;

  final Color? fillColor;

  const CustomTextFiled({
    super.key,
    required this.controller,
    this.label,
    this.icon,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxlength,
    this.obscureText,
    this.onTap,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.onSuffixTap,
    this.prefixText,
    this.errorText,
    this.inputFormatters,
    this.focusNode,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 6,
              left: 4,
            ),
            child: Text(
              _formatLabel(label!),
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          readOnly: readOnly,
          maxLength: maxlength,
          maxLines: maxLines,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            counterText: '',
            hintText: hint,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textHint,
            ),
            errorText: errorText?.trim().isEmpty == true
                ? null
                : errorText,
            filled: true,
            fillColor: fillColor ?? theme.colorScheme.surface,
            prefixIcon: _buildPrefix(),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            suffixIcon: _buildSuffix(),
            icon: icon != null
                ? Icon(
              icon,
              color: AppColors.iconSecondary,
            )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),
            border: _border(
              AppColors.borderColor,
            ),
            enabledBorder: _border(
              AppColors.borderColor,
            ),
            focusedBorder: _border(
              AppColors.primary,
              width: 1.5,
            ),
            errorBorder: _border(
              AppColors.error,
            ),
            focusedErrorBorder: _border(
              AppColors.error,
              width: 1.5,
            ),
            disabledBorder: _border(
              AppColors.borderColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget? _buildPrefix() {
    if (prefixText != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        child: Text(
          prefixText!,
          style: const TextStyle(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    if (prefixIcon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Icon(
          prefixIcon,
          color: AppColors.iconSecondary,
        ),
      );
    }

    return null;
  }

  Widget? _buildSuffix() {
    if (suffix != null) {
      return suffix;
    }

    if (suffixIcon != null) {
      return GestureDetector(
        onTap: onSuffixTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Icon(
            suffixIcon,
            color: AppColors.iconSecondary,
          ),
        ),
      );
    }

    return null;
  }

  OutlineInputBorder _border(
      Color color, {
        double width = 1,
      }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  String _formatLabel(String text) {
    final formatted = text.replaceAll('_', ' ').trim();

    if (formatted.isEmpty) {
      return '';
    }

    return formatted[0].toUpperCase() + formatted.substring(1);
  }
}