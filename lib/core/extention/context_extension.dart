import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get width => screenSize.width;
  double get height => screenSize.height;

  bool get isMobile => width < 600;

  bool get isTablet => width >= 600 && width < 1024;

  bool get isDesktop => width >= 1024;

  double wp(double percent) => width * percent;

  double hp(double percent) => height * percent;
}