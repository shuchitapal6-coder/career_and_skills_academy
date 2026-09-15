import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';


class ExploreCoursesSection extends GetView<HomeController> {
  const ExploreCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      const ExploreCourseItem(
        title: 'Academic Courses',
        image:
        'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=800',
      ),
      const ExploreCourseItem(
        title: 'Government Exams',
        image:
        'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800',
      ),
      const ExploreCourseItem(
        title: 'Entrance Exams',
        image:
        'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=800',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Explore Courses',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: courses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final course = courses[index];

              return _ExploreCourseCard(
                course: course,
                onTap: () {
                  controller.openExploreCourse(course.title);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ExploreCourseItem {
  final String title;
  final String image;

  const ExploreCourseItem({
    required this.title,
    required this.image,
  });
}

class _ExploreCourseCard extends StatelessWidget {
  final ExploreCourseItem course;
  final VoidCallback? onTap;

  const _ExploreCourseCard({
    required this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.borderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                course.image,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (
                    context,
                    child,
                    loadingProgress,
                    ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: double.infinity,
                    color: AppColors.containerBg,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.school_rounded,
                      size: 70,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              color: AppColors.iconSecondary.withOpacity(.82),
              child: Text(
                course.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}