import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../controller/performance_controller.dart';

import '../../../../core/widgets/custom_scafold.dart';

import '../data/modal/performance_modal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/performance_controller.dart';

class PerformancePage extends GetView<PerformanceController> {
  const PerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: 'Performance',

      actions: const [],
      body: SafeArea(
        child: Obx(
              () => Column(
            children: [
              _buildTabs(context),

              Expanded(
                child: controller.selectedTab.value == 0
                    ? _buildOverall(context)
                    : _buildPreviousYearPapers(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // TABS
  // ----------------------------------------------------------

  Widget _buildTabs(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(
              context,
              title: 'Overall',
              index: 0,
            ),
          ),
          Expanded(
            child: _buildTab(
              context,
              title: 'Previous Year Papers',
              index: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
      BuildContext context, {
        required String title,
        required int index,
      }) {
    final theme = Theme.of(context);
    final isSelected =
        controller.selectedTab.value == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? AppColors.secondary
                  : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: isSelected
                ? FontWeight.w700
                : FontWeight.w500,
            color: isSelected
                ? AppColors.secondary
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // OVERALL
  // ----------------------------------------------------------

  Widget _buildOverall(BuildContext context) {
    final hasData = controller.performances.isNotEmpty;

    if (!hasData) {
      return _buildEmptyPerformance(context);
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        16,
        18,
        16,
        30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeHeader(context),

          const SizedBox(height: 18),

          _buildSummaryCards(context),

          const SizedBox(height: 26),

          _buildSectionTitle(
            context,
            title: 'Activity Overview',
            subtitle: 'Your test activity at a glance',
          ),

          const SizedBox(height: 12),

          _buildActivityCard(context),

          const SizedBox(height: 24),

          _buildSectionTitle(
            context,
            title: 'Performance Overview',
            subtitle: 'Track your average score',
          ),

          const SizedBox(height: 12),

          _buildPerformanceCard(context),

          const SizedBox(height: 24),

          _buildSectionTitle(
            context,
            title: 'Marks Overview',
            subtitle: 'Average marks against maximum marks',
          ),

          const SizedBox(height: 12),

          _buildMarksCard(context),

          const SizedBox(height: 24),

          _buildSectionTitle(
            context,
            title: 'Recent Tests',
            subtitle: 'Your latest test attempts',
          ),

          const SizedBox(height: 12),

          _buildRecentTests(context),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // HEADER
  // ----------------------------------------------------------

  Widget _buildWelcomeHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Performance',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Track your learning progress and improve your score.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // SUMMARY
  // ----------------------------------------------------------

  Widget _buildSummaryCards(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.55,
      children: [
        _buildSummaryCard(
          context,
          icon: Icons.assignment_outlined,
          title: 'Tests Taken',
          value: '${controller.performances.length}',
          subtitle: 'Total tests',
        ),
        _buildSummaryCard(
          context,
          icon: Icons.trending_up_outlined,
          title: 'Average Score',
          value:
          '${controller.averageScore.toStringAsFixed(0)}%',
          subtitle: 'Overall score',
        ),
        _buildSummaryCard(
          context,
          icon: Icons.repeat_outlined,
          title: 'Attempts',
          value: '${controller.totalAttempts}',
          subtitle: 'Total attempts',
        ),
        _buildSummaryCard(
          context,
          icon: Icons.emoji_events_outlined,
          title: 'Average Marks',
          value:
          controller.averageMarks.toStringAsFixed(1),
          subtitle: 'Average marks',
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String value,
        required String subtitle,
      }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppDecorations.cardDecoration(context),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: AppColors.mainBgGradient,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppColors.white,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color:
                    theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color:
                    theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // SECTION TITLE
  // ----------------------------------------------------------

  Widget _buildSectionTitle(
      BuildContext context, {
        required String title,
        required String subtitle,
      }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // ACTIVITY
  // ----------------------------------------------------------

  Widget _buildActivityCard(BuildContext context) {
    return Container(
      height: 245,
      padding: const EdgeInsets.all(18),
      decoration: AppDecorations.cardDecoration(context),
      child: Column(
        children: [
          Row(
            children: [
              _buildLegend(
                context,
                AppColors.primaryLight,
                'Practice Tests',
              ),
              const SizedBox(width: 20),
              _buildLegend(
                context,
                AppColors.secondary,
                'Worksheet Tests',
              ),
            ],
          ),

          const SizedBox(height: 18),

          Expanded(
            child: CustomPaint(
              painter: _PerformanceChartPainter(
                values: const [
                  2,
                  4,
                  3,
                  5,
                  4,
                  6,
                  5,
                ],
              ),
              child: const SizedBox.expand(),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [
              _chartLabel(context, 'Mon'),
              _chartLabel(context, 'Tue'),
              _chartLabel(context, 'Wed'),
              _chartLabel(context, 'Thu'),
              _chartLabel(context, 'Fri'),
              _chartLabel(context, 'Sat'),
              _chartLabel(context, 'Sun'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(
      BuildContext context,
      Color color,
      String title,
      ) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: theme.textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _chartLabel(
      BuildContext context,
      String text,
      ) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  // ----------------------------------------------------------
  // PERFORMANCE
  // ----------------------------------------------------------

  Widget _buildPerformanceCard(BuildContext context) {
    final theme = Theme.of(context);
    final score = controller.averageScore;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppDecorations.cardDecoration(context),
      child: Row(
        children: [
          SizedBox(
            width: 145,
            height: 145,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 130,
                  height: 130,
                  child: CircularProgressIndicator(
                    value: score / 100,
                    strokeWidth: 12,
                    backgroundColor:
                    theme.colorScheme
                        .surfaceContainerHighest,
                    valueColor:
                    const AlwaysStoppedAnimation(
                      AppColors.primaryLight,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${score.toStringAsFixed(0)}%',
                      style:
                      theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Average',
                      style:
                      theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme
                            .onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              children: [
                _buildPerformanceStat(
                  context,
                  'Average Score',
                  '${score.toStringAsFixed(0)}%',
                  AppColors.primaryLight,
                ),
                const SizedBox(height: 18),
                _buildPerformanceStat(
                  context,
                  'Total Attempts',
                  '${controller.totalAttempts}',
                  AppColors.secondary,
                ),
                const SizedBox(height: 18),
                _buildPerformanceStat(
                  context,
                  'Tests Completed',
                  '${controller.performances.length}',
                  AppColors.success,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceStat(
      BuildContext context,
      String title,
      String value,
      Color color,
      ) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.bodySmall,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // MARKS
  // ----------------------------------------------------------

  Widget _buildMarksCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppDecorations.cardDecoration(context),
      child: Column(
        children: [
          _buildMarksProgress(
            context,
            title: 'Average Marks',
            value: controller.averageMarks,
            max: 50,
            color: AppColors.primaryLight,
          ),

          const SizedBox(height: 20),

          _buildMarksProgress(
            context,
            title: 'Maximum Marks',
            value: 50,
            max: 50,
            color: AppColors.secondary,
          ),

          const SizedBox(height: 18),

          Divider(
            color: theme.dividerColor,
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 18,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Keep practicing to improve your marks.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color:
                    theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMarksProgress(
      BuildContext context, {
        required String title,
        required double value,
        required double max,
        required Color color,
      }) {
    final theme = Theme.of(context);

    final progress = max == 0
        ? 0.0
        : (value / max).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${value.toStringAsFixed(1)} / ${max.toStringAsFixed(0)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 9,
            backgroundColor:
            theme.colorScheme
                .surfaceContainerHighest,
            valueColor:
            AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // RECENT TESTS
  // ----------------------------------------------------------

  Widget _buildRecentTests(BuildContext context) {
    return Column(
      children: controller.performances.map(
            (test) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
            ),
            child: _buildTestCard(
              context,
              test,
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _buildTestCard(
      BuildContext context,
      dynamic test,
      ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.cardDecoration(context),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color:
              AppColors.primaryLight.withOpacity(.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.assignment_outlined,
              color: AppColors.primaryLight,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  test.testName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${test.subject} • ${test.date}',
                  style:
                  theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme
                        .onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Text(
                '${test.score.toStringAsFixed(0)}%',
                style:
                theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: test.score >= 80
                      ? AppColors.success
                      : AppColors.secondary,
                ),
              ),
              Text(
                '${test.attempts} attempts',
                style:
                theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme
                      .onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // PREVIOUS YEAR PAPERS
  // ----------------------------------------------------------

  Widget _buildPreviousYearPapers(
      BuildContext context,
      ) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          'Previous Year Papers',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'Practice previous year papers and track your performance.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color:
            theme.colorScheme.onSurfaceVariant,
          ),
        ),

        const SizedBox(height: 20),

        _buildPaperCard(
          context,
          title: 'Flutter Certification 2025',
          subject: 'Flutter',
          questions: '50 Questions',
        ),

        _buildPaperCard(
          context,
          title: 'Dart Programming 2025',
          subject: 'Dart',
          questions: '60 Questions',
        ),

        _buildPaperCard(
          context,
          title: 'Database Fundamentals 2025',
          subject: 'Database',
          questions: '50 Questions',
        ),
      ],
    );
  }

  Widget _buildPaperCard(
      BuildContext context, {
        required String title,
        required String subject,
        required String questions,
      }) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.cardDecoration(context),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: AppColors.mainBgGradient,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.menu_book_outlined,
              color: AppColors.white,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$subject • $questions',
                  style:
                  theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme
                        .onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.chevron_right,
            color:
            theme.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // EMPTY STATE
  // ----------------------------------------------------------

  Widget _buildEmptyPerformance(
      BuildContext context,
      ) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color:
                AppColors.primaryLight.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.analytics_outlined,
                size: 55,
                color: AppColors.primaryLight,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'No Performance Data',
              textAlign: TextAlign.center,
              style:
              theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Complete your first practice test to see your performance here.',
              textAlign: TextAlign.center,
              style:
              theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme
                    .onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// CHART PAINTER
// ==========================================================

class _PerformanceChartPainter
    extends CustomPainter {
  final List<double> values;

  const _PerformanceChartPainter({
    required this.values,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(.18)
      ..strokeWidth = 1;

    final linePaint = Paint()
      ..color = AppColors.primaryLight
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dotPaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.fill;

    const gridCount = 4;

    for (int i = 0; i <= gridCount; i++) {
      final y =
          size.height * (i / gridCount);

      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    if (values.length < 2) return;

    const maxValue = 6.0;

    final path = Path();

    for (int i = 0; i < values.length; i++) {
      final x = size.width *
          (i / (values.length - 1));

      final normalized =
          values[i] / maxValue;

      final y =
          size.height -
              normalized * size.height;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(
      path,
      linePaint,
    );

    for (int i = 0; i < values.length; i++) {
      final x = size.width *
          (i / (values.length - 1));

      final normalized =
          values[i] / maxValue;

      final y =
          size.height -
              normalized * size.height;

      canvas.drawCircle(
        Offset(x, y),
        4,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _PerformanceChartPainter oldDelegate,
      ) {
    return oldDelegate.values != values;
  }
}
