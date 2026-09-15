import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';
import '../custom_dialog.dart';
import 'drawer_modal.dart';

class AppDrawerController extends GetxController {
  final RxBool isDark = false.obs;

  late List<DrawerItemModel> menuItems;

  @override
  void onInit() {
    super.onInit();

    menuItems = [
      DrawerItemModel(
        title: "Home",
        icon: Icons.home_outlined,
        onTap: () => Get.offAllNamed(AppRoutes.home),
      ),

      DrawerItemModel(
        title: "Profile",
        icon: Icons.person_outline,
        onTap: () => Get.toNamed(AppRoutes.profile),
      ),





      DrawerItemModel(
        title: "Dark Mode",
        icon: Icons.dark_mode_outlined,
        isSwitch: true,
      ),

      DrawerItemModel(
        title: "Help & Support",
        icon: Icons.support_agent_outlined,
        onTap: () => Get.toNamed(AppRoutes.helpSupport),
      ),

      DrawerItemModel(
        title: "About Us",
        icon: Icons.info_outline,
        onTap: () => Get.toNamed(AppRoutes.aboutUs),
      ),
      DrawerItemModel(
        title: "Privacy Policy",
        icon: Icons.info_outline,
        onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
      ),

      DrawerItemModel(
        title: "Settings",
        icon: Icons.settings_outlined,
        onTap: () => Get.toNamed(AppRoutes.settings),
      ),
      // DrawerItemModel(
      //   title: "Login",
      //   icon: Icons.login,
      //   onTap: () => Get.toNamed(AppRoutes.sendOtp),
      // ),

      DrawerItemModel(
        title: "Logout",
        icon: Icons.logout,
        onTap: logout,
      ),
    ];
  }

  void toggleTheme(bool value) {
    isDark.value = value;

    Get.changeThemeMode(
      value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void logout() {
    DialogService.show(
      title: "Logout",
      message: "Are you sure you want to logout?",
      type: DialogType.confirmation,
      cancelText: "Cancel",
      confirmText: "Logout",

      onCancel: () {
        Get.back();
      },

      onConfirm: () {
        Get.back();
        Get.offAllNamed(AppRoutes.sendOtp);
      },
    );
  }
}