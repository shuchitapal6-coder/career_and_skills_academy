
import 'package:get/get.dart';


import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../data/modal/explore_courses_model.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:career_and_skills_academy/core/widgets/custom_scafold.dart';

import '../controller/explore_courses_controller.dart';

class ExploreCourses extends GetView<ExploreCoursesController> {
  const ExploreCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: 'Academic Courses',
      showBackButton: true,
      body: SafeArea(
        child: Obx(
              () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.courses.isEmpty) {
              return SizedBox();
            }

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                12,
                14,
                12,
                24,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.courses.length,
              separatorBuilder: (_, __) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                final course = controller.courses[index];

                return TweenFadeSlide(

                  child: _CourseBanner(
                    course: course,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
class _CourseBanner extends StatelessWidget {
  final AcademicCourse course;

  const _CourseBanner({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: course.onTap,
      borderRadius: AppRadius.border16,
      child: Container(
        decoration: AppDecorations.cardDecoration(
          context,
          radius: AppRadius.border16,
        ),
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: 2.1,
          child: Image.asset(
            course.image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return const Center(
                child: Icon(Icons.image_not_supported_outlined),
              );
            },
          ),
        ),
      ),
    );
  }
}

