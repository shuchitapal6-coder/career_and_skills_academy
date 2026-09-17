import 'package:flutter/material.dart';

class ActivityItem {
  final String subject;
  final int count;
  final IconData icon;

  const ActivityItem({
    required this.subject,
    required this.count,
    required this.icon,
  });
}