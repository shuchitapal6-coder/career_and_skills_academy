import 'package:get/get.dart';

import '../presentation/controller/settings_controller.dart';



class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
          () => SettingsController(),
    );
  }
}
