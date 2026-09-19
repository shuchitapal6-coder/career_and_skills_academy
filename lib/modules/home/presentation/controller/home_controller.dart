
import 'package:career_and_skills_academy/app/configure/routs/app_routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/modals/user_modal.dart';
import '../../../../core/storage/app_preferences.dart';


class HomeController extends GetxController {
  final RxInt selectedTopTab = 0.obs;

  // final HomeDataSource dataSource;

  // HomeController(this.dataSource);



  final RxInt page = 1.obs;
  final RxBool hasMore = true.obs;
  var isLoading = false.obs;
  final pref = SharedPrefManager.instance;

  Rxn<ReporterModel> reporter = Rxn<ReporterModel>();

  final RxMap<int, bool> savedNews = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    reporter.value = SharedPrefManager.instance.getReporter();

  }

  void openWallet() {
Get.toNamed(AppRoutes.WalletPage);
  }

  void openNotifications() {

    
Get.toNamed(AppRoutes.notification);
  }
  final selectedIndex = 0.obs;

  final PageController pageController = PageController();

  final studentName = 'shuchita pal';
  final studentId = '43717';
  final studentClass = 'CLASS-VIII';
  final board = 'CBSE';

  void changeTab(int index) {
    selectedIndex.value = index;
  }



  void openQuickAction(String title) {
    switch (title) {
      case 'My Courses':
        Get.toNamed(AppRoutes.MyCourses);
        break;

      case 'Performance':
  Get.toNamed(AppRoutes.performancePage);
        break;

      case 'Activities':
        Get.toNamed(AppRoutes.activities);
        break;   case 'PYQs':
      Get.toNamed(AppRoutes.pyqs);
        break;
    }
  }

  void openAiAssist() {
    Get.snackbar(
      'AI Assist',
      'AI Study Assistant opened',
    );
  }

  void openAiFeature(String title) {
    Get.snackbar(
      title,
      '$title opened',
    );
  }

  void openCourse(String title) {
    Get.snackbar(
      title,
      'Course details opened',
    );
  }

  void openAllCourses() {
    Get.snackbar(
      'Courses',
      'All courses opened',
    );
  }



  void openExploreCourse(String title) {
    switch (title) {
      case 'Academic Courses':
        break;
      case 'Government Exams':
        break;
      case 'Entrance Exams':
        break;
    }
  }

  void openProductHelp(String title) {
    switch (title) {
      case 'How to login or\nregister on GradePlus':
        break;
      case 'Watch Videos on\nYoutube Channel':
        break;
      case 'Refer a Friend &\nRs 100 Cash Reward':
        break;
    }
  }

  void openPastVideos() {
    // Navigate to past videos
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();}
}
