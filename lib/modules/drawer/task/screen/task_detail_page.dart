import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../../core/widgets/animation/animated_scale_in.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/task_controller.dart';
import '../data/modal/task_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/task_controller.dart';
import '../data/modal/task_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_scafold.dart';

import '../controller/task_controller.dart';
import '../data/modal/task_model.dart';

import 'add_task.dart';

class TaskDetailPage extends GetView<TaskController> {
  final TaskModel task;

  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: 'View Task',
      showBackButton: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconButton(
            onPressed: () => _showDeleteDialog(context),
            icon:   Icon(
              CupertinoIcons.delete,
              color: AppColors.error,
            ),
          ),
        ),
      ],
      body: SafeArea(
        child: TweenFadeSlide(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                  child: Column(
                    children: [
                      // ==================================================
                      // TASK TYPE
                      // ==================================================
                      _buildDetailRow(
                        context,
                        icon: Icons.playlist_add_check,
                        value: task.subject,
                        label: 'Task Type',
                        showEdit: true,
                        onEdit: _openEditPage,
                      ),
          
                      // ==================================================
                      // TASK DETAILS
                      // ==================================================
                      _buildDetailRow(
                        context,
                        icon: Icons.description_outlined,
                        value: task.description,
                        label: 'Task Details',
                      ),
          
                      // ==================================================
                      // START DATE
                      // ==================================================
                      _buildDetailRow(
                        context,
                        icon: Icons.calendar_month_outlined,
                        value: _formatDateTime(task.startDateTime),
                        label: 'Start Date & Time',
                      ),
          
                      // ==================================================
                      // END DATE
                      // ==================================================
                      _buildDetailRow(
                        context,
                        icon: Icons.access_time_outlined,
                        value: _formatDateTime(task.endDateTime),
                        label: 'End Date & Time',
                      ),
          
                      // ==================================================
                      // ASSIGNED USER
                      // ==================================================
                      _buildDetailRow(
                        context,
                        icon: Icons.person_outline,
                        value: 'Shuchita pal',
                        label: 'Assigned User',
                      ),
          
                      // ==================================================
                      // ASSIGN DATE
                      // ==================================================
                      _buildDetailRow(
                        context,
                        icon: Icons.access_time_filled,
                        value: _formatDateTime(DateTime.now().toIso8601String()),
                        label: 'Assign Date & Time',
                        isLast: true,
                        muted: true,
                      ),
                    ],
                  ),
                ),
              ),
          
              // ========================================================
              // BOTTOM UPDATE BUTTON
              // ========================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomButton(title: 'Update Task', onTap: _openEditPage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // OPEN EDIT PAGE
  // ================================================================

  void _openEditPage() {
    controller.startEditTask(task);

    Get.to(() => const AddTaskPage());
  }

  void _showDeleteDialog(BuildContext context) {
    DialogService.show(
      title: 'Delete Task',
      message: 'Are you sure you want to delete this task?',
      type: DialogType.confirmation,
      confirmText: 'Delete',
      cancelText: 'Cancel',

      onCancel: () {
        Get.back(closeOverlays: true);
      },

      onConfirm: () {
        controller.deleteTask(task);

        Get.back(closeOverlays: true);

        Future.delayed(const Duration(milliseconds: 100), () {
          if (Get.currentRoute != '/TaskDetailPage') {
            return;
          }

          Get.back();
        });
      },
    );
  }


  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String value,
    String? label,
    bool showEdit = false,
    bool isLast = false,
    bool muted = false,
    VoidCallback? onEdit,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        SizedBox(

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildGradientIcon(icon),

                const SizedBox(width: 24),

                Expanded(
                  child: RichText(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: value,
                          style: theme.textTheme.titleMedium?.copyWith(),
                        ),

                        if (label != null)
                          TextSpan(
                            text: '\n$label',
                            style: theme.textTheme.bodySmall?.copyWith(),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        if (!isLast) Divider(height: 1, thickness: 1.2),
      ],
    );
  }

  // ================================================================
  // GRADIENT ICON
  // ================================================================

  Widget _buildGradientIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.mainBgGradient,
        boxShadow: AppColors.cyanGlowShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: AppColors.white),
      ),
    );
  }

  // ================================================================
  // FORMAT DATE
  // ================================================================

  String _formatDateTime(String value) {
    final dateTime = DateTime.tryParse(value);

    if (dateTime == null) {
      return value;
    }

    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;

    final minute = dateTime.minute.toString().padLeft(2, '0');

    final period = dateTime.hour >= 12 ? 'PM' : 'AM';

    final now = DateTime.now();

    final isToday =
        dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;

    final dayText = isToday
        ? 'Today'
        : '${dateTime.day.toString().padLeft(2, '0')}/'
              '${dateTime.month.toString().padLeft(2, '0')}/'
              '${dateTime.year}';

    return '$hour:$minute $period, $dayText';
  }
}
