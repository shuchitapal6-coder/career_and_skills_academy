import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:career_and_skills_academy/core/theme/app_colors.dart';
import 'package:career_and_skills_academy/core/theme/app_decoration.dart';
import 'package:career_and_skills_academy/core/widgets/custom_scafold.dart';

import '../../data/modals/study_model.dart';
import '../controller/study_controller.dart';

class StudyPage extends GetView<StudyController> {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
          () => CustomScaffold(
        useAppBarGradient: true,
        showBackButton: false,
        title: 'Study',
        isLoading: controller.isLoading.value,
        body: Container(
          width: double.infinity,
          decoration: AppDecorations.cardDecoration(context),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: controller.refreshSubjects,
              color: AppColors.secondary,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  SliverToBoxAdapter(
                    child: _StudyHeader(
                      controller: controller,
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        6,
                        16,
                        16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Your Subjects',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.containerBg,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${controller.totalSubjects} Subjects',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (controller.subjects.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: _EmptySubjects(),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        16,
                        30,
                      ),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final subject = controller.subjects[index];

                            return _SubjectCard(
                              subject: subject,
                              onTap: () {
                                controller.openSubject(subject);
                              },
                            );
                          },
                          childCount: controller.subjects.length,
                        ),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.88,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StudyHeader extends StatelessWidget {
  final StudyController controller;

  const _StudyHeader({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        20,
        16,
        18,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: AppColors.mainBgGradient,
          borderRadius: BorderRadius.circular(22),
          boxShadow: AppColors.cyanGlowShadow,
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.14),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.14),
                ),
              ),
              child: const Icon(
                Icons.auto_stories_rounded,
                color: AppColors.white,
                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keep Learning',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.white.withOpacity(0.76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Choose a subject to continue',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.18),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.academyGold.withOpacity(0.35),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_fire_department_rounded,
                    color: AppColors.academyGold,
                    size: 17,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '0',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectCard extends StatelessWidget {
  final StudySubjectModel subject;
  final VoidCallback onTap;

  const _SubjectCard({
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = _subjectColor(subject.name);
    final icon = _subjectIcon(subject.name);

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: AppDecorations.cardDecoration(
            context,
            radius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: accent.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        icon,
                        color: accent,
                        size: 22,
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      width: 38,
                      height: 38,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: subject.progress,
                            strokeWidth: 3.5,
                            backgroundColor: accent.withOpacity(0.10),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              accent,
                            ),
                          ),
                          Text(
                            '${subject.progressPercentage}%',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w800,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Text(
                  subject.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  '${subject.chapters} Chapters',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: subject.progress,
                    minHeight: 5,
                    backgroundColor: accent.withOpacity(0.10),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      accent,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subject.isCompleted
                            ? 'Completed'
                            : subject.isStarted
                            ? 'Continue learning'
                            : 'Start learning',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: accent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: accent.withOpacity(0.10),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: accent,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _subjectColor(String name) {
    switch (name.toLowerCase()) {
      case 'maths':
      case 'mathematics':
        return AppColors.primaryLight;

      case 'english':
        return AppColors.secondary;

      case 'hindi':
        return AppColors.academyGold;

      case 'computer science':
      case 'computer':
        return AppColors.info;

      case 'social studies':
      case 'social science':
        return AppColors.success;

      case 'sanskrit':
        return AppColors.secondaryDark;

      case 'science':
        return AppColors.primary;

      default:
        return AppColors.primaryLight;
    }
  }

  IconData _subjectIcon(String name) {
    switch (name.toLowerCase()) {
      case 'maths':
      case 'mathematics':
        return Icons.calculate_rounded;

      case 'english':
        return Icons.menu_book_rounded;

      case 'hindi':
        return Icons.translate_rounded;

      case 'computer science':
      case 'computer':
        return Icons.computer_rounded;

      case 'social studies':
      case 'social science':
        return Icons.public_rounded;

      case 'sanskrit':
        return Icons.history_edu_rounded;

      case 'science':
        return Icons.science_rounded;

      default:
        return Icons.school_rounded;
    }
  }
}

class _EmptySubjects extends StatelessWidget {
  const _EmptySubjects();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.containerBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu_book_outlined,
                color: AppColors.iconSecondary,
                size: 34,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              'No subjects available',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Your subjects will appear here once they are available.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}