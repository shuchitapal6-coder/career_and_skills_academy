import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';

class AppInputTextField extends StatelessWidget {
  final String label;
  final int? mxline;
  final int? maxlength;
  final TextInputType textInputType;
  final IconData? iconData;
  final IconData? endIcon;
  final bool showLabel;
  final bool isObscure;
  final GestureTapCallback? onEndIconTap;
  final TextEditingController? controller;
  final List<String>? hint;
  final String? hintText;
  final bool enable;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  /// 🔽 Dropdown / Picker / Special Fields
  final bool isDropdown;
  final List<String>? dropdownItems;
  final void Function(String?)? onDropdownChanged;
  final String? selectedValue;
  final bool isFilePicker;
  final String? fileName;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final bool isDatePicker;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Widget? prefixWidget;

  const AppInputTextField({
    super.key,
    this.label = "Input Label",
    this.iconData,
    this.controller,
    this.endIcon,
    this.hint,
    this.mxline = 1,
    this.maxlength,
    this.onEndIconTap,
    this.validator,
    this.onChanged,
    this.prefixWidget,
    this.hintText,
    this.inputFormatters,
    this.showLabel = true,
    this.isObscure = false,
    this.enable = true,
    this.textInputType = TextInputType.text,
    this.isDropdown = false,
    this.dropdownItems,
    this.onDropdownChanged,
    this.selectedValue,
    this.isFilePicker = false,
    this.fileName,
    this.onTap,
    this.suffixWidget,
    this.isDatePicker = false,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel) ...[
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
        ],

        /// ================= DROPDOWN =================
        if (isDropdown)
          GestureDetector(
            onTap: enable ? () => _showDropdownBottomSheet(context) : null,
            child: InputDecorator(
              decoration: InputDecoration(
                prefixIcon: prefixWidget,
                suffixIcon: suffixWidget ??
                    const Icon(Icons.keyboard_arrow_down_rounded),
              ),
              child: Text(
                selectedValue?.isNotEmpty == true
                    ? selectedValue!
                    : "Select ${label.toLowerCase()}",
                style: TextStyle(
                  color: selectedValue?.isNotEmpty == true
                      ? theme.colorScheme.onSurface
                      : theme.hintColor,
                ),
              ),
            ),
          )

        /// ================= FILE PICKER =================
        else if (isFilePicker)
          TextFormField(
            readOnly: true,
            controller: TextEditingController(text: fileName ?? ""),
            onTap: enable ? onTap : null,
            decoration: InputDecoration(
              hintText: "Select ${label.toLowerCase()}",
              prefixIcon: prefixWidget,
              suffixIcon: suffixWidget ?? const Icon(Icons.attach_file_rounded),
            ),
          )

        /// ================= NORMAL TEXTFIELD / DATEPICKER =================
        else
          TextFormField(
            controller: controller,
            maxLines: mxline,
            enabled: enable,
            canRequestFocus: enable && !isDatePicker,
            readOnly: isDatePicker,
            autofillHints: hint,
            obscureText: isObscure,
            keyboardType: textInputType,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            inputFormatters: inputFormatters,
            maxLength: maxlength,
            onChanged: onChanged,
            onTap: isDatePicker
                ? () async {
              DateTime initial = DateTime.now();
              if (controller?.text.isNotEmpty == true) {
                try {
                  initial = DateTime.parse(controller!.text);
                } catch (_) {}
              }

              final picked = await showDatePicker(
                context: context,
                initialDate: initial,
                firstDate: firstDate ?? DateTime(1950),
                lastDate: lastDate ?? DateTime.now(),
              );

              if (picked != null && controller != null) {
                controller!.text = DateFormat('yyyy-MM-dd').format(picked);
              }
            }
                : onTap,
            decoration: InputDecoration(
              hintText: hintText ?? "Enter ${label.toLowerCase()}",
              prefixIcon: prefixWidget,
              suffixIcon: suffixWidget ??
                  (endIcon != null
                      ? IconButton(
                    icon: Icon(endIcon),
                    onPressed: onEndIconTap,
                  )
                      : (isDatePicker
                      ? const Icon(Icons.calendar_today_rounded)
                      : null)),
            ),
          ),
      ],
    );
  }

  void _showDropdownBottomSheet(BuildContext context) {
    final searchController = TextEditingController();
    List<String> filteredItems = List.from(dropdownItems ?? []);
    final theme = Theme.of(context);

    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  label,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                /// Search Field
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search $label...",
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredItems = (dropdownItems ?? [])
                          .where((item) => item
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: filteredItems.isEmpty
                      ? const Center(child: Text("No matching data found"))
                      : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final isSelected = item == selectedValue;

                      return ListTile(
                        title: Text(item),
                        selected: isSelected,
                        trailing: isSelected
                            ? Icon(
                          Icons.check_circle,
                          color: theme.colorScheme.primary,
                        )
                            : null,
                        onTap: () {
                          onDropdownChanged?.call(item);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }
}

class BirthdayDateField extends StatelessWidget {
  final String? label;
  final bool showLabel;
  final TextEditingController controller;
  final DateTime? initialDate;

  const BirthdayDateField({
    super.key,
    this.label,
    this.showLabel = false,
    required this.controller,
    this.initialDate,
  });

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime initDate = initialDate ??
        DateTime.now().subtract(const Duration(days: 365 * 18));

    final picked = await showDialog<DateTime>(
      context: context,
      builder: (_) => AppDatePickerDialog(initialDate: initDate),
    );

    if (picked != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel && label != null) ...[
          Text(
            label!,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () => _openDatePicker(context),
          decoration: const InputDecoration(
            hintText: "Select Birthday",
            suffixIcon: Icon(Icons.cake_outlined),
          ),
        ),
      ],
    );
  }
}

class AppDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;

  const AppDatePickerDialog({super.key, required this.initialDate});

  @override
  State<AppDatePickerDialog> createState() => _AppDatePickerDialogState();
}

class _AppDatePickerDialogState extends State<AppDatePickerDialog> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: DateTime(1900),
            lastDate: DateTime.now().subtract(const Duration(days: 365 * 13)), // 13-year age restriction
            onDateChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, selectedDate),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 40),
                  ),
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}