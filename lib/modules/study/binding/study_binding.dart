import 'package:get/get.dart';

import '../presentation/controller/study_controller.dart';

import 'package:get/get.dart';

import '../presentation/controller/study_controller.dart';

class StudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyController>(
          () => StudyController(),
    );
  }
}