import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';

class CustomOtpField extends StatefulWidget {
  final TextEditingController controller;
  final int length;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onCompleted;
  final String? errorText;
  final bool enabled;

  const CustomOtpField({
    super.key,
    required this.controller,
    this.length = 6,
    this.focusNode,
    this.onChanged,
    this.onCompleted,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();

    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onChanged(String value) {
    widget.onChanged?.call(value);

    if (value.length == widget.length) {
      widget.onCompleted?.call();
    }
  }

  void _openKeyboard() {
    if (!widget.enabled) return;

    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final otp = widget.controller.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter OTP',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 10),

        Stack(
          children: [
            GestureDetector(
              onTap: _openKeyboard,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: List.generate(
                  widget.length,
                      (index) {
                    final hasValue = index < otp.length;
                    final isActive =
                        index == otp.length && _focusNode.hasFocus;

                    return Expanded(
                      child: Container(
                        height: 52,
                        margin: EdgeInsets.only(
                          right: index == widget.length - 1 ? 0 : 8,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isActive
                                ? AppColors.primary
                                : widget.errorText != null
                                ? AppColors.error
                                : AppColors.borderColor,
                            width: isActive ? 1.5 : 1,
                          ),
                        ),
                        child: Text(
                          hasValue ? otp[index] : '',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0,
                child: TextFormField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  keyboardType: TextInputType.number,
                  maxLength: widget.length,
                  autofocus: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(widget.length),
                  ],
                  onChanged: _onChanged,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
            ),
          ],
        ),

        if (widget.errorText != null &&
            widget.errorText!.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 6,
              left: 4,
            ),
            child: Text(
              widget.errorText!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
      ],
    );
  }
}