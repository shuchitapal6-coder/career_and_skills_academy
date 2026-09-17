import 'package:get/get.dart';

import '../controller/my_courses_controller.dart';

class MyCoursesDinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCoursesController>(
          () => MyCoursesController(),
    );
  }
}