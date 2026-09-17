import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
class DrawerItemModel {
  final String title;
  final IconData? icon;
  final String? image;
  final VoidCallback? onTap;
  final bool isSwitch;
  final String? badge;

  DrawerItemModel({
    required this.title,
    this.icon,
    this.image,
    this.onTap,
    this.isSwitch = false,
    this.badge,
  });
}