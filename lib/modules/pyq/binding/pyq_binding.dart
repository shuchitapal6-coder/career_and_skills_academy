import 'package:get/get.dart';

import '../controller/pyq_controller.dart';
import '../controller/pyq_test_papers_controller.dart';

class PyqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PyqsController>(() => PyqsController());
    Get.lazyPut<PyqTestPapersController>(() => PyqTestPapersController());
  }
}