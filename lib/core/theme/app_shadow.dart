import 'package:flutter/material.dart';

class AppShadow {
  AppShadow._();

  static const Color lightShadow = Color(0x12000000);

  static List<BoxShadow> card = const [
    BoxShadow(
      color: lightShadow,
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];

  static List<BoxShadow> elevated = const [
    BoxShadow(
      color: lightShadow,
      blurRadius: 18,
      offset: Offset(0, 8),
    ),
  ];
}