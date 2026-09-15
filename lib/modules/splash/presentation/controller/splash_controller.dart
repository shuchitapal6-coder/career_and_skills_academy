import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';

import '../../../../app/configure/routs/app_routs.dart';
import '../../../../core/modals/user_modal.dart';
import '../../../../core/storage/app_preferences.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../internet/presentation/controller.dart';


class SplashController extends GetxController {

  final InternetController internetController = Get.find<InternetController>();

  //=========================================================
  // LOGO ANIMATION
  //=========================================================

  final RxDouble logoScale = 0.6.obs;
  final RxDouble logoOpacity = 0.0.obs;
  final RxDouble logoRotation = 0.0.obs;

  final RxDouble textOpacity = 0.0.obs;


  final RxBool showLoader = false.obs;

  final RxInt topCircle = (-120).obs;

  final RxInt bottomCircle = (-140).obs;

  final RxInt smallCircle = 120.obs;

  @override
  void onInit() {
    super.onInit();

    animateBackground();
    startAnimation();
  }

  //=========================================================
  // SPLASH ANIMATION
  //=========================================================

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));

    logoOpacity.value = 1;
    logoScale.value = 1;
    logoRotation.value = 0.02;

    await Future.delayed(const Duration(milliseconds: 900));

    textOpacity.value = 1;

    await Future.delayed(const Duration(milliseconds: 700));

    showLoader.value = true;

    await Future.delayed(const Duration(seconds: 2));

    await initializeApp();
  }

  //=========================================================
  // BACKGROUND FLOAT ANIMATION
  //=========================================================

  void animateBackground() {
    Future.doWhile(() async {
      topCircle.value = -100;
      bottomCircle.value = -110;
      smallCircle.value = 140;

      await Future.delayed(const Duration(seconds: 3));

      topCircle.value = -120;
      bottomCircle.value = -140;
      smallCircle.value = 120;

      await Future.delayed(const Duration(seconds: 3));

      return true;
    });
  }

  //=========================================================
  // INITIALIZE APP
  //=========================================================
  Future<void> initializeApp() async {
    try {
      final hasInternet = await internetController.hasInternet();

      if (!hasInternet) {
        Get.offAllNamed(AppRoutes.noInternet);
        return;
      }

      // 2. Check onboarding status
      final onboardingCompleted =
          SharedPrefManager.instance.getBool(
            StorageKeys.onboardingCompleted,
          ) ??
              false;

      if (!onboardingCompleted) {
        debugPrint("Opening Onboarding...");

        Get.offAllNamed(AppRoutes.onboarding);
        return;
      }

      // 3. Onboarding already completed
      debugPrint("Going to Dashboard...");

      // Get.offAllNamed(AppRoutes.dashboard);
      Get.offAllNamed(AppRoutes.onboarding);
    } catch (e, s) {
      print("Navigation Error: $e");
      print(s);
    }
  }
  // Future<void> initializeApp() async {
  //   final hasInternet = await internetController.hasInternet();
  //
  //   if (!hasInternet) {
  //     Get.offAllNamed(AppRoutes.noInternet);
  //     return;
  //   }
  //   Get.offNamed(AppRoutes.dashboard);
  //   // final updateAvailable = await checkForUpdate();
  //   //
  //   // if (updateAvailable) return;
  //   // Get.offNamed(AppRoutes.dashboard);
  //   // await checkLogin();
  // }


  //=========================================================
  // UPDATE CHECK
  //=========================================================

  Future<bool> checkForUpdate() async {
    try {
      final newVersion = NewVersionPlus(androidId: "com.example.realty_connect");

      final status = await newVersion.getVersionStatus();

      if (status != null && status.canUpdate) {
        newVersion.showUpdateDialog(
          context: Get.context!,
          versionStatus: status,
          dialogTitle: "Update Available",
          dialogText:
              "A newer version (${status.storeVersion}) is available.\nPlease update to continue.",
          updateButtonText: "Update",
          dismissButtonText: "Later",
          allowDismissal: true,
        );

        return true;
      }
    } catch (e) {
      debugPrint("Update Error : $e");
    }

    return false;
  }
}
