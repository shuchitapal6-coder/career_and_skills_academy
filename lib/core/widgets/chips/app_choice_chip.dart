import 'package:flutter/material.dart';

class AppChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipTheme = Theme.of(context).chipTheme;

    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),

      selectedColor: chipTheme.selectedColor,
      backgroundColor: chipTheme.backgroundColor,
      shape: chipTheme.shape,

      labelStyle: selected
          ? chipTheme.secondaryLabelStyle
          : chipTheme.labelStyle,

      side: chipTheme.side,
      padding: chipTheme.padding,
    );
  }
}