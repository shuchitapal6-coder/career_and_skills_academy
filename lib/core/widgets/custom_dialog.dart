import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'custom_button.dart';

enum DialogType { success, error, warning, info, confirmation }

class AppDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogType type;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? content;

  const AppDialog({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final iconColor = _iconColor(theme);
    final bgColor = iconColor.withOpacity(.12);

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            CircleAvatar(
              radius: 32,
              backgroundColor: bgColor,
              child: Icon(
                _icon(),
                size: 32,
                color: iconColor,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 10),

            content ??
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(.7),
                  ),
                ),

            const SizedBox(height: 24),


            Row(
              children: [

                if(cancelText != null)
                  Expanded(
                    child: CustomButton(
                      height: 45,
                      title: cancelText!,
                   isOutlined: true,

                      onTap: onCancel,
                    ),
                  ),


                if(cancelText != null)
                  const SizedBox(width: 12),


                Expanded(
                  child: CustomButton(
                    height: 45,
                    title: confirmText ?? "OK",
                    onTap: onConfirm,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }



  IconData _icon() {
    switch(type){

      case DialogType.success:
        return Icons.check_circle_outline;

      case DialogType.error:
        return Icons.error_outline;

      case DialogType.warning:
        return Icons.warning_amber_rounded;

      case DialogType.info:
        return Icons.info_outline;

      case DialogType.confirmation:
        return Icons.help_outline;
    }
  }



  Color _iconColor(ThemeData theme){

    switch(type){

      case DialogType.success:
        return AppColors.success;

      case DialogType.error:
        return AppColors.error;

      case DialogType.warning:
        return AppColors.warning;

      case DialogType.info:
        return theme.colorScheme.primary;

      case DialogType.confirmation:
        return theme.colorScheme.primary;
    }
  }
}

class DialogService {
  DialogService._();

  static Future<void> show({
    required String title,
    required String message,
    DialogType type = DialogType.info,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    final Widget? content,
  }) {
    return Get.dialog(
      AppDialog(

        title: title,
        message: message,
        type: type,
        confirmText: confirmText,
        cancelText: cancelText,

        onConfirm:
            onConfirm ??
            () {
              Get.back();
            },
        onCancel:
            onCancel ??
            () {
              Get.back();
            },
      ),
      barrierDismissible: barrierDismissible,
    );
  }
}
