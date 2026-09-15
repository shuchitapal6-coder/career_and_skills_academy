import 'package:get/get.dart';

import '../controller/callender_controller.dart';

class CallenderDinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallenderController>(
          () => CallenderController(),
    );
  }
}