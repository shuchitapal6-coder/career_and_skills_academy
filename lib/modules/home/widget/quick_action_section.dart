import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';


class QuickActionSection extends GetView<HomeController> {
  const QuickActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      const QuickActionItem(
        title: 'My Courses',
        icon: Icons.menu_book_rounded,
      ),
      const QuickActionItem(
        title: 'Performance',
        icon: Icons.bar_chart_rounded,
      ),
      const QuickActionItem(
        title: 'Activities',
        icon: Icons.assignment_rounded,
      ),
    ];

    return SizedBox(
      height: 160,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = items[index];

          return _QuickActionCard(
            item: item,
            onTap: () {
              controller.openQuickAction(item.title);
            },
          );
        },
      ),
    );
  }
}

class QuickActionItem {
  final String title;
  final IconData icon;

  const QuickActionItem({
    required this.title,
    required this.icon,
  });
}

class _QuickActionCard extends StatelessWidget {
  final QuickActionItem item;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
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
              child: Container(
                width: double.infinity,
                color: AppColors.containerBg,
                child: Icon(
                  item.icon,
                  size: 90,
                  color: AppColors.primaryLight,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 38,
              alignment: Alignment.center,
              color: AppColors.iconSecondary.withOpacity(.8),
              child: Text(
                item.title,
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