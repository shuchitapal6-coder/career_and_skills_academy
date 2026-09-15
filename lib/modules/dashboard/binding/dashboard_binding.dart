 import 'package:get/get.dart';

import '../../../core/network/api_services.dart';

import '../../../core/widgets/drawer/drawer_controller.dart';

import '../../callender/controller/callender_controller.dart';
import '../../home/presentation/controller/home_controller.dart';

import '../../message/controller/message_controller.dart';
import '../../study/binding/study_binding.dart';
import '../../study/presentation/controller/study_controller.dart';
import '../data/data_source/dashboard_data_source.dart';
import '../presentation/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(Get.find()));

    Get.lazyPut<HomeController>(() => HomeController( ));
    Get.lazyPut<AppDrawerController>(() => AppDrawerController( ));
    Get.lazyPut<StudyController>(() => StudyController( ));
    Get.lazyPut<MessageController>(() => MessageController( ));
    Get.lazyPut<CallenderController>(() => CallenderController( ));

    /// CONTROLLER


    Get.lazyPut<DashboardDataSource>(() => DashboardDataSourceImpl(Get.find()));


    Get.lazyPut<ApiServices>(() => ApiServices(), fenix: true);


  }
}
