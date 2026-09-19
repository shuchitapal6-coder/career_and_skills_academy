import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_scafold.dart';

import '../controller/pyq_test_papers_controller.dart';
import '../data/modal/pyq_test_paper_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/pyq_test_papers_controller.dart';
import '../data/modal/pyq_test_paper_model.dart';

class PyqTestPapersPage extends GetView<PyqTestPapersController> {
  const PyqTestPapersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,
      showBackButton: true,
      useAppBarGradient: true,
      title: 'test_papers'.tr,
      body: SafeArea(
        child: Obx(
              () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.papersByYear.isEmpty) {
              return const _EmptyTestPapers();
            }

            return RefreshIndicator(
              onRefresh: controller.refreshPapers,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.fromLTRB(
                  16,
                  18,
                  16,
                  30,
                ),
                itemCount: controller.papersByYear.length,
                itemBuilder: (context, index) {
                  final year =
                  controller.papersByYear.keys.elementAt(index);

                  final papers =
                      controller.papersByYear[year] ?? [];

                  return _YearSection(
                    year: year,
                    papers: papers,
                    onToggle: () {
                      controller.toggleYear(year);
                    },
                    onPaperTap: controller.openTestPaper,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _YearSection extends StatelessWidget {
  final String year;
  final List<PyqTestPaperModel> papers;
  final VoidCallback onToggle;
  final ValueChanged<PyqTestPaperModel> onPaperTap;

  const _YearSection({
    required this.year,
    required this.papers,
    required this.onToggle,
    required this.onPaperTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
          () {
        final isExpanded =
            Get.find<PyqTestPapersController>()
                .expandedYears[year] ??
                false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onToggle,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          year,
                          style:
                          theme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0 : 0.5,
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color:
                          theme.colorScheme.onSurfaceVariant,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: isExpanded
                  ? Column(
                children: [
                  const SizedBox(height: 4),
                  ...papers.map(
                        (paper) => _TestPaperItem(
                      paper: paper,
                      onTap: () => onPaperTap(paper),
                    ),
                  ),
                ],
              )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class _TestPaperItem extends StatelessWidget {
  final PyqTestPaperModel paper;
  final VoidCallback onTap;

  const _TestPaperItem({
    required this.paper,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            decoration: AppDecorations.cardDecoration(
              context,
              radius: BorderRadius.circular(12),
            ).copyWith(
              color: theme.colorScheme.surface,
              boxShadow: const [],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    paper.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyTestPapers extends StatelessWidget {
  const _EmptyTestPapers();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'no_test_papers_found'.tr,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}