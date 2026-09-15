import 'package:get/get.dart';

import '../presentation/controller.dart';

class InternetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InternetController());
  }
}