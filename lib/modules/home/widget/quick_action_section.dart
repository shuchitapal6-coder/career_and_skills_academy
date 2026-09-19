import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';

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
        icon: Icons.quiz_rounded,

        image: 'assets/images/pyqs.png',
      ),
      const QuickActionItem(
        title: 'Performance',
        icon: Icons.bar_chart_rounded,
        image: 'assets/images/performance.png',
      ),
      const QuickActionItem(
        title: 'Activities',
        icon: Icons.assignment_rounded,
        image: 'assets/images/activities.png',
      ),
      const QuickActionItem(
        title: 'PYQs',
        icon: Icons.quiz_rounded,
        image: 'assets/images/pyqs.png',
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

          return GestureDetector(
            onTap: () {
              controller.openQuickAction(item.title);
            },
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.borderColor),
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
                      alignment: Alignment.center,
                      child: item.image != null
                          ? Image.asset(
                              item.image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            )
                          : Icon(
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
        },
      ),
    );
  }
}

class QuickActionItem {
  final String title;
  final IconData icon;
  final String? image;

  const QuickActionItem({required this.title, required this.icon, this.image});
}
