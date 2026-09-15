import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const xs = Radius.circular(8);
  static const sm = Radius.circular(12);
  static const md = Radius.circular(16);
  static const lg = Radius.circular(20);
  static const xl = Radius.circular(24);

  static const border8 = BorderRadius.all(xs);
  static const border12 = BorderRadius.all(sm);
  static const border16 = BorderRadius.all(md);
  static const border20 = BorderRadius.all(lg);
  static const border24 = BorderRadius.all(xl);
}