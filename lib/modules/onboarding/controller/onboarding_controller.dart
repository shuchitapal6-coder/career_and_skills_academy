import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_images.dart';



import '../../../../core/storage/app_preferences.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../app/configure/routs/app_routs.dart';


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_images.dart';
import '../../../../core/storage/app_preferences.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../app/configure/routs/app_routs.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_images.dart';
import '../../../../core/storage/app_preferences.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../app/configure/routs/app_routs.dart';

class OnboardingController extends GetxController {
  /// =========================================================
  /// PAGE CONTROLLER
  /// =========================================================
  final PageController pageController = PageController();

  /// Current onboarding page
  final RxInt currentIndex = 0.obs;

  /// Prevent multiple navigation calls
  final RxBool isAnimating = false.obs;

  Timer? _autoSlideTimer;

  /// =========================================================
  /// ONBOARDING DATA
  /// =========================================================
  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onboarding1,
      "subtitle": "Welcome to",
      "title": "Smart Learning",
      "description":
      "Learn smarter with AI-powered tools designed to accelerate your career.",
    },
    {
      "image": AppImages.onboarding2,
      "subtitle": "Build your future",
      "title": "Master In-Demand Skills",
      "description":
      "Access expert-led courses and personalized learning paths for today's job market.",
    },
    {
      "image": AppImages.onboarding3,
      "subtitle": "Your journey starts",
      "title": "Unlock Career Opportunities",
      "description":
      "Become interview-ready and build the skills you need to achieve your career goals.",
    },
  ];

  /// =========================================================
  /// CONSTANTS
  /// =========================================================
  static const Duration pageAnimationDuration =
  Duration(milliseconds: 650);

  static const Duration autoSlideDuration =
  Duration(seconds: 5);

  static const Curve pageAnimationCurve =
      Curves.easeInOutCubic;

  /// =========================================================
  /// INIT
  /// =========================================================
  @override
  void onInit() {
    super.onInit();

    startAutoSlide();
  }

  /// =========================================================
  /// AUTO SLIDE
  /// =========================================================
  void startAutoSlide() {
    _autoSlideTimer?.cancel();

    _autoSlideTimer = Timer.periodic(
      autoSlideDuration,
          (_) {
        if (isAnimating.value) return;

        if (!pageController.hasClients) return;

        final nextIndex =
            currentIndex.value + 1;

        if (nextIndex < onboardingData.length) {
          _animateToPage(nextIndex);
        } else {
          /// Loop back to first page
          _animateToPage(0);
        }
      },
    );
  }

  /// =========================================================
  /// STOP AUTO SLIDE
  /// =========================================================
  void stopAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = null;
  }

  /// =========================================================
  /// RESTART AUTO SLIDE
  /// =========================================================
  void restartAutoSlide() {
    stopAutoSlide();

    Future.delayed(
      const Duration(seconds: 2),
          () {
        if (!isClosed) {
          startAutoSlide();
        }
      },
    );
  }

  /// =========================================================
  /// PAGE CHANGED
  /// =========================================================
  void onPageChanged(int index) {
    currentIndex.value = index;

    /// User manually swiped.
    /// Restart auto-slide timer.
    restartAutoSlide();
  }

  /// =========================================================
  /// NEXT PAGE
  /// =========================================================
  Future<void> nextPage() async {
    if (isAnimating.value) return;

    if (currentIndex.value <
        onboardingData.length - 1) {
      await _animateToPage(
        currentIndex.value + 1,
      );
    } else {
      await completeOnboarding();
    }
  }

  /// =========================================================
  /// PREVIOUS PAGE
  /// =========================================================
  Future<void> previousPage() async {
    if (isAnimating.value) return;

    if (currentIndex.value > 0) {
      await _animateToPage(
        currentIndex.value - 1,
      );
    }
  }

  /// =========================================================
  /// ANIMATE TO PAGE
  /// =========================================================
  Future<void> _animateToPage(int index) async {
    if (!pageController.hasClients) return;

    if (index < 0 ||
        index >= onboardingData.length) {
      return;
    }

    isAnimating.value = true;

    try {
      await pageController.animateToPage(
        index,
        duration: pageAnimationDuration,
        curve: pageAnimationCurve,
      );
    } finally {
      isAnimating.value = false;
    }
  }

  /// =========================================================
  /// COMPLETE ONBOARDING
  /// =========================================================
  Future<void> completeOnboarding() async {
    stopAutoSlide();

    await SharedPrefManager.instance.setBool(
      StorageKeys.onboardingCompleted,
      true,
    );

    if (isClosed) return;

    Get.offAllNamed(
      AppRoutes.dashboard,
    );
  }

  Future<void> skip() async {
    await completeOnboarding();
  }

  /// =========================================================
  /// CLEANUP
  /// =========================================================
  @override
  void onClose() {
    stopAutoSlide();

    pageController.dispose();

    super.onClose();
  }
}