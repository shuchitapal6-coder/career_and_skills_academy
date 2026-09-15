import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../controller/dashboard_controller.dart';

class AppBottomNavBar extends StatelessWidget {
  AppBottomNavBar({super.key});

  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        decoration:   BoxDecoration(
          gradient: AppColors.mainBgGradient,
        ),
        child: NavigationBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          selectedIndex: controller.selectedNavIndex.value,
          onDestinationSelected: controller.changeBottomIndex,
          indicatorColor: AppColors.white.withOpacity(0.18),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                );
              }

              return TextStyle(
                color: AppColors.white.withOpacity(0.65),
                fontWeight: FontWeight.w500,
              );
            },
          ),

          destinations: const [
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.home,
                color: AppColors.white,
              ),
              selectedIcon: Icon(
                CupertinoIcons.house_fill,
                color: AppColors.white,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.book,
                color: AppColors.white,
              ),
              selectedIcon: Icon(
                CupertinoIcons.book_fill,
                color: AppColors.white,
              ),
              label: 'Study',
            ),
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.chat_bubble_2,
                color: AppColors.white,
              ),
              selectedIcon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
                color: AppColors.white,
              ),
              label: 'Message',
            ),
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.calendar,
                color: AppColors.white,
              ),
              selectedIcon: Icon(
                CupertinoIcons.calendar_today,
                color: AppColors.white,
              ),
              label: 'Calendar',
            ),
          ],
        )
      ),
    );
  }
}