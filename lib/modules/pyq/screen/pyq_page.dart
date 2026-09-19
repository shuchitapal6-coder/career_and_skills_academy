import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/pyq_controller.dart';

import '../../../../core/widgets/custom_scafold.dart';


import '../../../../core/theme/app_colors.dart';

import '../../../../core/widgets/cards/activity_card.dart';


class PyqsPage extends GetView<PyqsController> {
  const PyqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      showAppBar: true,
      showBackButton: true,
      title: 'pyqs'.tr,
      actions: [
        IconButton(
          onPressed: controller.openFilter,
          icon: const Icon(
            Icons.filter_list_rounded,
          ),
        ),
      ],
      body: SafeArea(
        child: Column(
          children: [
            _buildCourseHeader(context),
            Expanded(
              child: Obx(
                    () {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (controller.subjects.isEmpty) {
                    return Center(
                      child: Text(
                        'no_pyqs_found'.tr,
                        style: context.textTheme.titleMedium,
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      4,
                      16,
                      24,
                    ),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.12,
                    ),
                    itemCount: controller.subjects.length,
                    itemBuilder: (context, index) {
                      final item = controller.subjects[index];

                      return ActivityCard(
                        title: item.subject,
                        count: item.testPaperCount,
                        countLabel: 'test_papers'.tr,
                        icon: controller.getSubjectIcon(
                          item.subject,
                        ),
                        onTap: () {
                          controller.openSubject(item);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        14,
      ),
      child: Row(
        children: [
          Icon(
            Icons.school_rounded,
            color: AppColors.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              controller.courseName,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Obx(
                () => Text(
              '${controller.totalPapers} ${'test_papers'.tr}',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}