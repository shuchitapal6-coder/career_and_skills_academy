import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_scafold.dart';

import '../../../callender/screen/callender_page.dart';
import '../../../home/presentation/page/home_page.dart';

import '../../../message/screen/message_page.dart';
import '../../../study/presentation/page/study_page.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/boottom_appbar.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashboardController controller = Get.put(
    DashboardController(Get.find()),
  );
  final List<Widget> pages = [
    HomePage(),
    StudyPage(),
    MessagePage(),
    CallenderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
      bottomNavigationBar: AppBottomNavBar(),

      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, animation) {
            final offsetAnimation =
                Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );

            return SlideTransition(position: offsetAnimation, child: child);
          },
          child: KeyedSubtree(
            key: ValueKey(controller.selectedPageIndex.value),
            child: pages[controller.selectedPageIndex.value],
          ),
        ),
      ),
    );
  }
}
