import 'package:flutter/material.dart';



class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search...",
    this.borderRadius = 8,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon ?? const Icon(Icons.search_rounded),
        suffixIcon: suffixIcon,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
