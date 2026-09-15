import 'package:get/get.dart';

import '../../../core/widgets/drawer/drawer_controller.dart';

import '../../auth/presentation/controller/auth_controller.dart';


import '../presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());

    if (!Get.isRegistered<AuthController>()) {
      Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    }
    Get.lazyPut<AppDrawerController>(() => AppDrawerController());

  }
}
