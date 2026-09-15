import 'package:get/get.dart';

import '../controller/contact_us_controller.dart';
import '../controller/support_history_controller.dart';


class HelpSupportBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SupportDataSource>(() => SupportDataSourceImpl());

    Get.lazyPut<ContactUsController>(
      () => ContactUsController( ),
    );  Get.lazyPut<SupportHistoryController>(
      () => SupportHistoryController( ),
    );
  }
}
