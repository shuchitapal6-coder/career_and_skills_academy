import 'package:career_and_skills_academy/core/widgets/animation/animated_fade_slide.dart';
import 'package:career_and_skills_academy/core/widgets/custom_scafold.dart';
import 'package:career_and_skills_academy/core/widgets/empty_widget.dart';
import 'package:career_and_skills_academy/modules/drawer/task/screen/task_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/widgets/chips/app_choice_chip.dart';
import '../controller/task_controller.dart';
import '../data/modal/task_model.dart';
import 'add_task.dart';

class TasksPage extends GetView<TaskController> {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: 'Tasks',
      showBackButton: true,

      body: Obx(
            () => TweenFadeSlide(
          child: Column(
            children: [
              TweenFadeSlide(child: _buildFilter(context)),

              const SizedBox(height: 8),

              Expanded(
                child: controller.filteredTasks.isEmpty
                    ? _buildEmptyState(context)
                    : ListView.separated(
                  padding:
                  const EdgeInsets.all(16),

                  itemCount:
                  controller.filteredTasks.length,

                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),

                  itemBuilder:
                      (context, index) {
                    final task = controller
                        .filteredTasks[index];

                    return TweenFadeSlide(
                      child: _TaskCard(
                        task: task,
                        onTap: () {
                          Get.to(
                                () => TaskDetailPage(
                              task: task,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () async {
          await Get.to(
                () => const AddTaskPage(),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
      ),
    );
  }

  // ============================================================
  // FILTER
  // ============================================================

  Widget _buildFilter(
      BuildContext context,
      ) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        scrollDirection: Axis.horizontal,

        itemCount:
        controller.filters.length,

        separatorBuilder: (_, __) =>
        const SizedBox(width: 8),

        itemBuilder: (context, index) {
          final filter =
          controller.filters[index];

          final isSelected =
              controller.selectedFilter.value ==
                  filter;

          return AppChoiceChip(
            label: filter,
            selected: isSelected,
            onTap: () {
              controller.changeFilter(
                filter,
              );
            },
          );
        },
      ),
    );
  }

  // ============================================================
  // EMPTY
  // ============================================================

  Widget _buildEmptyState(
      BuildContext context,
      ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                color:
                colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.task_alt_outlined,
                size: 36,
                color: colorScheme.primary,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'No Tasks Found',
              style: theme.textTheme.titleMedium
                  ?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'There are no tasks available in this category.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// TASK CARD
// ============================================================

class _TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onTap;

  const _TaskCard({
    required this.task,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration:
      AppDecorations.cardDecoration(context),

      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.border16,

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Text(
                      task.title,
                      maxLines: 2,
                      overflow:
                      TextOverflow.ellipsis,
                      style: theme
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      task.subject,
                      maxLines: 1,
                      overflow:
                      TextOverflow.ellipsis,
                      style: theme
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                        color:
                        colorScheme.primary,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(
                          Icons
                              .calendar_today_outlined,
                          size: 15,
                          color: colorScheme
                              .onSurfaceVariant,
                        ),

                        const SizedBox(width: 5),

                        Expanded(
                          child: Text(
                            task.dueDate,
                            maxLines: 1,
                            overflow:
                            TextOverflow.ellipsis,
                            style: theme
                                .textTheme
                                .bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              _StatusBadge(
                status: task.status,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STATUS BADGE
// ============================================================

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color backgroundColor;
    Color textColor;

    switch (status) {
      case 'Completed':
        backgroundColor =
            colorScheme.primaryContainer;
        textColor =
            colorScheme.primary;
        break;

      case 'In Progress':
        backgroundColor =
            colorScheme.secondaryContainer;
        textColor =
            colorScheme.secondary;
        break;

      default:
        backgroundColor =
            colorScheme.errorContainer;
        textColor =
            colorScheme.error;
    }

    return Container(
      constraints:
      const BoxConstraints(
        maxWidth: 90,
      ),

      padding:
      const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),

      decoration: BoxDecoration(
        color:
        backgroundColor.withOpacity(0.1),
        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Text(
        status,
        maxLines: 1,
        overflow:
        TextOverflow.ellipsis,
        style: theme
            .textTheme
            .labelSmall
            ?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}