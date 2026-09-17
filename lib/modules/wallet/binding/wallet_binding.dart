import 'package:get/get.dart';

import '../presentation/controller/wallet_controlller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(
          () => WalletController(),fenix: true
    );
  }
}