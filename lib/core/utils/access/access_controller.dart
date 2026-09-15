
import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';



class AccessController extends GetxController {
  static AccessController get instance => Get.find();

  final RxBool hasAccess = true.obs;
  final RxString message = "".obs;

  bool handleAccess({
    required bool access,
    String? msg,
  }) {
    hasAccess.value = access;

    if (!access) {
      message.value = msg ?? "Access denied";

      Get.snackbar(
        "Access Denied",
        message.value,
        snackPosition: SnackPosition.BOTTOM,
      );

      Future.delayed(const Duration(milliseconds: 300), () {
        Get.offAllNamed(AppRoutes.sendOtp);
      });

      return false;
    }

    return true;
  }
}