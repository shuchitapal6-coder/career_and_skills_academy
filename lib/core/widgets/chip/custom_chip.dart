import 'package:flutter/material.dart';


class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chipTheme = theme.chipTheme;

    return ChoiceChip(
      selected: isSelected,
      onSelected: (_) => onTap(),
      showCheckmark: false,

      backgroundColor: chipTheme.backgroundColor,
      selectedColor: chipTheme.selectedColor,

      side: BorderSide(
        color: isSelected
            ? theme.colorScheme.primary
            : (chipTheme.side?.color ?? theme.dividerColor),
        width: isSelected ? 1.5 : 1,
      ),

      shape: chipTheme.shape,

      padding: chipTheme.padding ??
          const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),

      labelStyle: (isSelected
          ? chipTheme.secondaryLabelStyle
          : chipTheme.labelStyle)
          ?.copyWith(
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface,
        fontWeight: FontWeight.w400,
      ),

      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,

      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && !isSelected) ...[
            Icon(
              icon,
              size: 16,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}