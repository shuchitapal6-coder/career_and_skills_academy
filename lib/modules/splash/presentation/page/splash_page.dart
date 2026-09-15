import 'package:career_and_skills_academy/core/theme/app_decoration.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.cardDecoration(context),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ----------------------------------------------------
                      // LOGO
                      // ----------------------------------------------------
                      Obx(
                        () => AnimatedOpacity(
                          opacity: controller.logoOpacity.value,
                          duration: const Duration(milliseconds: 700),
                          child: AnimatedScale(
                            scale: controller.logoScale.value,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeOutBack,
                            child: Hero(
                              tag: "app_logo",
                              child: Container(
                                width: 190,
                                height: 190,
                                padding: const EdgeInsets.all(26),

                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
