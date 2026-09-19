import 'dart:ui';

class AcademicCourse {
  final String id;
  final String title;
  final String image;
  final VoidCallback? onTap;

  const AcademicCourse({
    required this.id,
    required this.title,
    required this.image,
    this.onTap,
  });
}