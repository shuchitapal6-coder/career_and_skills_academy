import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../controller/activities_controller.dart';

import '../../../../core/widgets/custom_scafold.dart';

import '../data/modal/activities_modal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/activities_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/activities_controller.dart';

class ActivitiesPage extends GetView<ActivitiesController> {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final activities = [
      const ActivityItem(
        subject: 'Biology',
        count: 22,
        icon: Icons.biotech_rounded,
      ),
      const ActivityItem(
        subject: 'Chemistry',
        count: 13,
        icon: Icons.science_rounded,
      ),
      const ActivityItem(
        subject: 'English',
        count: 23,
        icon: Icons.menu_book_rounded,
      ),
      const ActivityItem(
        subject: 'Geography',
        count: 17,
        icon: Icons.public_rounded,
      ),
      const ActivityItem(
        subject: 'Maths',
        count: 48,
        icon: Icons.calculate_rounded,
      ),
      const ActivityItem(
        subject: 'Physics',
        count: 75,
        icon: Icons.bolt_rounded,
      ),
    ];

    return CustomScaffold(
      useAppBarGradient: true,
      title: 'Activities',
      actions: const [],
      body: SafeArea(
        child: Column(
          children: [
            _ActivityHeader(
              totalActivities: activities.fold(
                0,
                    (sum, item) => sum + item.count,
              ),
            ),

            Expanded(
              child: activities.isEmpty
                  ? EmptyWidget(title: "Activity", subtitle: "Empty Activity")
                  : GridView.builder(
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
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final item = activities[index];

                  return _ActivityCard(
                    item: item,
                    onTap: () {
                      controller.openActivity(item.subject);
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
}

class _ActivityCard extends StatelessWidget {
  final ActivityItem item;
  final VoidCallback onTap;

  const _ActivityCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          decoration: AppDecorations.cardDecoration(
            context,
            radius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withOpacity(.10),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        item.icon,
                        color: AppColors.primaryLight,
                        size: 24,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Text(
                  item.subject,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${item.count}',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryLight,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        'Activities',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: _progressValue(item.count),
                    minHeight: 5,
                    backgroundColor:
                    theme.colorScheme.surfaceContainerHighest,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _progressValue(int count) {
    const maxActivities = 75;

    return (count / maxActivities).clamp(0.0, 1.0);
  }

}class _ActivityHeader extends StatelessWidget {
  final int totalActivities;

  const _ActivityHeader({
    required this.totalActivities,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      padding: const EdgeInsets.all(18),
      decoration: AppDecorations.cardDecoration(
        context,
        radius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.assignment_rounded,
              size: 28,
              color: AppColors.primaryLight,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Activities',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Practice and improve your subjects',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$totalActivities',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryLight,
                ),
              ),
              Text(
                'Activities',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}