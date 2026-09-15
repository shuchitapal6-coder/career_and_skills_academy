import 'package:flutter/cupertino.dart';

class DrawerItemModel {
  final IconData icon;
  final String title;
  final String? subTitle;
  final String? badge;
  final bool isSwitch;
  final VoidCallback? onTap;

  DrawerItemModel({
    required this.icon,
    required this.title,
    this.subTitle,
    this.badge,
    this.isSwitch = false,
    this.onTap,
  });
}