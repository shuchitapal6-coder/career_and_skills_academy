import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../storage/app_preferences.dart';



class ThemeController extends GetxController {
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    isDarkMode.value =
        SharedPrefManager.instance.getBool("isDarkMode");

    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void toggleTheme(bool value) {
    isDarkMode.value = value;

    SharedPrefManager.instance.setBool(
      "isDarkMode",
      value,
    );

    Get.changeThemeMode(
      value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}