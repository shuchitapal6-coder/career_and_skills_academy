import 'package:get/get.dart';

import '../../../core/network/api_services.dart';
import '../data/data_source/auth_data_source.dart';
import '../presentation/controller/auth_controller.dart';


class AuthBinding extends Bindings {

  @override
  void dependencies() {

      Get.lazyPut<ApiServices>(() => ApiServices(), fenix: true);

      Get.lazyPut<AuthApiDataSource>(
            () => AuthApiDataSourceImpl(Get.find<ApiServices>()),
        fenix: true,
      );

      Get.lazyPut<AuthController>(
            () => AuthController( ),
        fenix: true,
      );
    }

}