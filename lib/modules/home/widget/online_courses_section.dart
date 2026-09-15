import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';

class OnlineCoursesSection extends GetView<HomeController> {
  const OnlineCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      const CourseItem(
        title: 'Class 12',
        subtitle: 'Science Stream',
        image:
        'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800',
        progress: 72,
        subjects: 'Physics • Chemistry • Maths',
      ),
      const CourseItem(
        title: 'Class 10',
        subtitle: 'CBSE Board',
        image:
        'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=800',
        progress: 48,
        subjects: 'Maths • Science • English',
      ),
      const CourseItem(
        title: 'Class 8',
        subtitle: 'CBSE Board',
        image:
        'https://images.unsplash.com/photo-1588072432836-e10032774350?w=800',
        progress: 65,
        subjects: 'Maths • Science • English',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Online Courses',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              TextButton(
                onPressed: controller.openAllCourses,
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 265,
          child: ListView.separated(

            padding: const EdgeInsets.symmetric(horizontal: 14),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: courses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final course = courses[index];

              return _CourseCard(
                course: course,
                onTap: () {
                  controller.openCourse(course.title);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CourseItem {
  final String title;
  final String subtitle;
  final String image;
  final int progress;
  final String subjects;

  const CourseItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.progress,
    required this.subjects,
  });
}

class _CourseCard extends StatelessWidget {
  final CourseItem course;
  final VoidCallback? onTap;

  const _CourseCard({
    required this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 210,
        height: 165,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.borderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 110,
              child: Image.network(
                course.image,
                fit: BoxFit.cover,
                loadingBuilder: (
                    context,
                    child,
                    loadingProgress,
                    ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return Container(
                    color: AppColors.containerBg,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: AppColors.containerBg,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.school_outlined,
                      size: 42,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: 135,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  14,
                  10,
                  14,
                  12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            course.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${course.progress}%',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.secondaryDark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    Text(
                      course.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      course.subjects,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.iconSecondary,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: course.progress / 100,
                              minHeight: 6,
                              backgroundColor: AppColors.containerBg,
                              valueColor:
                              const AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        SizedBox(
                          height: 32,
                          child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                            ),
                            child:   Text(
                              'Continue',style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}