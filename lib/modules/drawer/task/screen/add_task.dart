import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../../core/widgets/animation/animated_scale_in.dart';
import '../../../../core/widgets/chips/app_choice_chip.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../../../../core/widgets/textfields/custom_textfields.dart';
import '../controller/task_controller.dart';


class AddTaskPage extends GetView<TaskController> {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditMode =
        controller.editingTaskId != null;

    return CustomScaffold(
      useAppBarGradient: true,

      title: isEditMode
          ? 'Update Task'
          : 'Add Task',

      showBackButton: true,

      body: SafeArea(
        child: TweenFadeSlide(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    26,
                    24,
                    24,
                  ),
                  child: TweenFadeSlide(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          context,
                          'Task Type',
                          required: true,
                        ),
                              
                        const SizedBox(height: 16),
                              
                        _buildTaskTypes(context),
                              
                        const SizedBox(height: 34),
                              
                        _buildLabel(
                          context,
                          'Task Details',
                          required: true,
                        ),
                              
                        const SizedBox(height: 12),
                              
                        _buildDetailsField(context),
                              
                        const SizedBox(height: 34),
                              
                        Obx(
                              () => _buildDateTimeField(
                            context,
                            label: 'Start Date & Time',
                            value:
                            controller.startDateTime.value,
                            onTap: () {
                              controller
                                  .selectStartDateTime(
                                context,
                              );
                            },
                          ),
                        ),
                              
                        const SizedBox(height: 12),
                              
                        Obx(
                              () => _buildDateTimeField(
                            context,
                            label: 'End Date & Time',
                            value:
                            controller.endDateTime.value,
                            onTap: () {
                              controller
                                  .selectEndDateTime(
                                context,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  8,
                  24,
                  20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    title: isEditMode
                        ? 'Update Task'
                        : 'Create New Task',
          
                    onTap: () {
                      bool success;
          
                      if (isEditMode) {
                        success =
                            controller.updateTask();
                      } else {
                        success =
                            controller.createTask();
                      }
          
                      if (success) {
                        Get.back(result: true);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LABEL
  // ============================================================

  Widget _buildLabel(
      BuildContext context,
      String label, {
        bool required = false,
      }) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: label,
        style:
        theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        children: required
            ? [
          TextSpan(
            text: ' *',
            style: theme
                .textTheme
                .titleMedium
                ?.copyWith(
              color:
              theme.colorScheme.error,
              fontWeight:
              FontWeight.w700,
            ),
          ),
        ]
            : null,
      ),
    );
  }

  // ============================================================
  // TASK TYPES
  // ============================================================

  Widget _buildTaskTypes(
      BuildContext context,
      ) {
    const types = [
      'Instruction',
      'Project',
      'Blog',
    ];

    return Obx(
          () => Wrap(
        spacing: 12,
        runSpacing: 8,
        children: types.map((type) {
          return AppChoiceChip(
            label: type,
            selected:
            controller.selectedTaskType.value ==
                type,
            onTap: () {
              controller.changeTaskType(type);
            },
          );
        }).toList(),
      ),
    );
  }

  // ============================================================
  // DETAILS
  // ============================================================

  Widget _buildDetailsField(
      BuildContext context,
      ) {
    return CustomTextFiled(
      controller:
      controller.taskDetailsController,
      hint: 'Enter task details',
      maxLines: 5,
      textInputAction:
      TextInputAction.newline,
      keyboardType:
      TextInputType.multiline,
    );
  }

  // ============================================================
  // DATE TIME
  // ============================================================

  Widget _buildDateTimeField(
      BuildContext context, {
        required String label,
        required DateTime? value,
        required VoidCallback onTap,
      }) {
    return CustomTextFiled(
      // We don't use a controller here because
      // this field is read-only.
      controller: TextEditingController(
        text: value == null
            ? ''
            : controller.formatDateTime(value),
      ),

      label: label,

      hint: 'Select ${label.toLowerCase()}',

      readOnly: true,

      onTap: onTap,

      suffixIcon:
      Icons.calendar_month_outlined,

      onSuffixTap: onTap,
    );
  }
}