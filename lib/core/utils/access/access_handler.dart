

import 'access_controller.dart';

class AccessHandler {
  static bool check(Map<String, dynamic> response) {
    // final controller = Get.find<AccessController>();
    //
    // final bool hasAccess = response["has_access"] ?? true;
    // final String message = response["access_note"] ?? "";

    return AccessController.instance.handleAccess(
      access: false,
      msg: "Please login first",
    );
  }
}