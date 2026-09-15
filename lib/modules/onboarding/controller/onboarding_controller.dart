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
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;
  Timer? _autoSlideTimer;

  // Updated content for Career & Skill Academy
  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onboarding1,
      "title": "Powered by Smart AI",
      "description": "Learn smarter with Career & Skill AI Assist to accelerate your career path.",
    },
    {
      "image": AppImages.onboarding2,
      "title": "Master In-Demand Skills",
      "description": "Access expert-led courses and personalized roadmaps tailored for the job market.",
    },
    {
      "image": AppImages.onboarding3,
      "title": "Unlock Career Opportunities",
      "description": "Get interview-ready and connect directly with hiring managers and industry leaders.",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    startAutoSlide();
  }

  void startAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentIndex.value < onboardingData.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }

      if (pageController.hasClients) {
        pageController.animateToPage(
          currentIndex.value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
    // Restart timer when user swipes manually
    startAutoSlide();
  }

  Future<void> nextPage() async {
    if (currentIndex.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      await completeOnboarding();
    }
  }

  Future<void> completeOnboarding() async {
    _autoSlideTimer?.cancel();
    await SharedPrefManager.instance.setBool(
      StorageKeys.onboardingCompleted,
      true,
    );
    Get.offAllNamed(AppRoutes.sendOtp);
  }

  Future<void> skip() async {
    await completeOnboarding();
  }

  @override
  void onClose() {
    _autoSlideTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
