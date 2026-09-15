import 'package:get/get.dart';

import '../core/storage/app_preferences.dart';
import '../core/network/api_services.dart';
import '../core/theme/controller/theme_controller.dart';

import '../core/utils/access/access_controller.dart';

import '../modules/internet/presentation/controller.dart';

import '../modules/splash/presentation/controller/splash_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(), permanent: true);

    Get.put(SharedPrefManager.instance, permanent: true);

    Get.lazyPut<ApiServices>(() => ApiServices(), fenix: true);


    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<InternetController>(() => InternetController(), fenix: true);


    Get.put(AccessController(), permanent: true);
  }
}
