import 'package:get/get.dart';

import '../data/modal/activities_modal.dart';


class ActivitiesController extends GetxController {
  void openActivity(String subject) {
    switch (subject) {
      case 'Biology':
      // Get.toNamed(AppRoutes.biologyActivities);
        break;

      case 'Chemistry':
      // Get.toNamed(AppRoutes.chemistryActivities);
        break;

      case 'English':
      // Get.toNamed(AppRoutes.englishActivities);
        break;

      case 'Geography':
      // Get.toNamed(AppRoutes.geographyActivities);
        break;

      case 'Maths':
      // Get.toNamed(AppRoutes.mathsActivities);
        break;

      case 'Physics':
      // Get.toNamed(AppRoutes.physicsActivities);
        break;
    }
  }
}