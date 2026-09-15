import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_decoration.dart';
import '../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../core/widgets/custom_button.dart';
import '../controller/onboarding_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_decoration.dart';
import '../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../core/widgets/custom_button.dart';
import '../controller/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [


            /// PAGEVIEW (AUTO-SLIDABLE)
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, index) {
                  final item = controller.onboardingData[index];

                  return TweenFadeSlide(
                    child: Column(
                      children: [
                        /// IMAGE CONTAINER
                        Expanded(
                          child: Container(
                            // height: size.height * 0.42,
                            width: double.infinity,
                            decoration: AppDecorations.cardDecoration(
                              context,
                            ).copyWith(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                item["image"]!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),

                        // const SizedBox(height: 24),
                        //
                        // /// TITLE
                        // Text(
                        //   item["title"]!.tr,
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     fontFamily: 'Poppins',
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.w700,
                        //     height: 1.25,
                        //     letterSpacing: -0.3,
                        //   ),
                        // ),

                        // const SizedBox(height: 10),
                        //
                        // /// DESCRIPTION
                        // Text(
                        //   item["description"]!.tr,
                        //   textAlign: TextAlign.center,
                        //   style: context.textTheme.titleMedium?.copyWith(
                        //     color: Colors.grey.shade600,
                        //     fontSize: 14,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// BOTTOM SECTION
            TweenFadeSlide(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    /// INDICATOR DOTS
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.onboardingData.length,
                              (index) {
                            bool isActive =
                                controller.currentIndex.value == index;

                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: isActive ? 28 : 8,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primary
                                    : AppColors.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                      );
                    }),

                    const SizedBox(height: 24),

                    /// SIGN IN PROMPT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        GestureDetector(
                          onTap: controller.skip,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// ACTION BUTTON
                    Obx(
                          () => CustomButton(
                        title: controller.currentIndex.value ==
                            controller.onboardingData.length - 1
                            ? "Start Registration"
                            : "Next",
                        onTap: controller.nextPage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
