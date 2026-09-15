import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(T?)? validator;

  const CustomDropdownField({
    super.key,
    this.label,
    this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// LABEL
          if (label != null) ...[
            Text(
              label!,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
          ],

          /// DROPDOWN FIELD
          FormField<T>(
            initialValue: value,
            validator: validator,
            builder: (FormFieldState<T> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: theme.inputDecorationTheme.fillColor ??
                          theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: state.hasError
                            ? theme.colorScheme.error
                            : theme.dividerColor.withOpacity(0.2),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<T>(
                        value: value,
                        isExpanded: true,
                        dropdownColor: theme.colorScheme.surface,
                        hint: Text(
                          hint ?? "Select ${label?.toLowerCase() ?? 'option'}",
                          style: TextStyle(
                            color: theme.hintColor,
                            fontSize: 14,
                          ),
                        ),
                        icon: Icon(
                          suffixIcon ?? Icons.keyboard_arrow_down_rounded,
                          color: theme.iconTheme.color,
                        ),

                        /// SELECTED ITEM DISPLAY IN BAR
                        selectedItemBuilder: (BuildContext context) {
                          return items.map((DropdownMenuItem<T> item) {
                            return Row(
                              children: [
                                if (prefixIcon != null) ...[
                                  Icon(
                                    prefixIcon,
                                    size: 20,
                                    color: theme.iconTheme.color,
                                  ),
                                  const SizedBox(width: 10),
                                ],
                                Expanded(
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      color: theme.colorScheme.onSurface,
                                      fontSize: 14,
                                    ),
                                    child: item.child,
                                  ),
                                ),
                              ],
                            );
                          }).toList();
                        },

                        items: items,
                        onChanged: (T? newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  /// ERROR MESSAGE
                  if (state.hasError) ...[
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        state.errorText ?? '',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}