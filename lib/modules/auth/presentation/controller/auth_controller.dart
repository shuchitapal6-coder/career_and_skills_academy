import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/configure/routs/app_routs.dart';

class AuthController extends GetxController {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final RxBool isOtpSent = false.obs;
  final RxBool canResend = false.obs;

  final RxInt seconds = 30.obs;
  final RxInt currentBanner = 0.obs;

  final RxString sentOtp = ''.obs;

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendOtp() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your mobile number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
      Get.snackbar(
        'Error',
        'Please enter a valid Indian mobile number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      // TODO: Replace this with your Send OTP API call.

      await Future.delayed(
        const Duration(seconds: 1),
      );

      // Temporary API response OTP.
      // Remove this when real API is integrated.
      const responseOtp = '123456';

      sentOtp.value = responseOtp;

      /// Show OTP section on the same page.
      isOtpSent.value = true;

      /// Start resend timer.
      startTimer();

      Get.snackbar(
        'OTP Sent',
        'OTP has been sent successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void verifyOtp() {
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter OTP',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (otp.length != 6) {
      Get.snackbar(
        'Error',
        'OTP must be 6 digits',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
      Get.snackbar(
        'Error',
        'OTP must contain only digits',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    /// Temporary OTP validation.
    /// Remove this when real Verify OTP API is integrated.
    if (sentOtp.value.isNotEmpty && otp != sentOtp.value) {
      Get.snackbar(
        'Error',
        'Invalid OTP',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    /// TODO: Call Verify OTP API here.

    timer?.cancel();

    Get.offAllNamed(
      AppRoutes.dashboard,
    );
  }

  void startTimer() {
    timer?.cancel();

    seconds.value = 30;
    canResend.value = false;

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          canResend.value = true;
          timer.cancel();
        }
      },
    );
  }

  Future<void> resendOtp() async {
    if (!canResend.value) {
      return;
    }

    isLoading.value = true;

    try {
      // TODO: Replace with actual Resend OTP API.

      await Future.delayed(
        const Duration(seconds: 1),
      );

      // Temporary OTP response.
      const responseOtp = '123456';

      sentOtp.value = responseOtp;

      otpController.clear();

      startTimer();

      Get.snackbar(
        'OTP Sent',
        'New OTP has been sent successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unable to resend OTP. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void changeMobileNumber() {
    timer?.cancel();

    isOtpSent.value = false;
    canResend.value = false;
    seconds.value = 30;

    otpController.clear();
  }

  void changeBanner(int index) {
    currentBanner.value = index;
  }

  @override
  void onClose() {
    timer?.cancel();

    phoneController.dispose();
    otpController.dispose();

    super.onClose();
  }
}