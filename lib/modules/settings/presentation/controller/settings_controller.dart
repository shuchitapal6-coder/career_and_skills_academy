import 'package:get/get.dart';

import '../../data/data_source/settings_data_source.dart';
import '../../data/modals/settings_modals.dart';

class SettingsController extends GetxController {
  final SettingsDataSourceImpl dataSource =
  SettingsDataSourceImpl();

  RxBool isLoading = false.obs;
  Rxn<SettingsModel> settings = Rxn<SettingsModel>();

  @override
  void onInit() {
    super.onInit();
    // fetchSettings();
  }

  Future<void> fetchSettings() async {
    try {
      isLoading.value = true;

      final result = await dataSource.getSettings();

      settings.value = result;
      print("setting======> $result");
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}