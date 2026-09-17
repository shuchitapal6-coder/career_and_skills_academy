import 'dart:math' as math;
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controller/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
            () {
          final currentIndex = controller.currentIndex.value;

          final item = controller.onboardingData[currentIndex];

          return Stack(
            children: [
              /// =========================================================
              /// BACKGROUND IMAGE
              /// =========================================================
              Positioned.fill(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.onboardingData.length,
                  itemBuilder: (context, index) {
                    return AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: index == currentIndex ? 1.0 : 1.1,
                      child: Image.asset(
                        controller.onboardingData[index]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              /// =========================================================
              /// DARK GRADIENT OVER IMAGE
              /// =========================================================
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.0,
                        0.35,
                        0.62,
                        1.0,
                      ],
                      colors: [
                        Colors.black.withOpacity(0.35),
                        Colors.transparent,
                        Colors.black.withOpacity(0.15),
                        Colors.black.withOpacity(0.90),
                      ],
                    ),
                  ),
                ),
              ),

              /// =========================================================
              /// SAFE AREA CONTENT
              /// =========================================================
              SafeArea(
                child: Column(
                  children: [
                    /// =====================================================
                    /// TOP BAR
                    /// =====================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          /// APP ICON
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.12),
                              ),
                            ),
                            child: const Icon(
                              Icons.school_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),

                          const SizedBox(width: 18),

                          /// PAGE INDICATORS
                          Expanded(
                            child: Row(
                              children: List.generate(
                                controller.onboardingData.length,
                                    (index) {
                                  final isActive = index == currentIndex;

                                  return Expanded(
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          /// SKIP
                          GestureDetector(
                            onTap: controller.skip,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 17,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.12),
                                ),
                              ),
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    /// =====================================================
                    /// BOTTOM CONTENT
                    /// =====================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// SMALL TITLE
                          Text(
                            item["subtitle"]?.tr ?? "Welcome to",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 8),

                          /// MAIN TITLE
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: _buildTitle(
                              context,
                              item["title"]!,
                            ),
                          ),
                          const SizedBox(height: 12),

                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              item["description"]!,
                              key: ValueKey(item["description"]),
                            ),
                          ),
                          const SizedBox(height: 26),

                          /// =================================================
                          /// ACTION BUTTON
                          /// =================================================
                          Row(
                            children: [
                              /// BACK BUTTON
                              GestureDetector(
                                onTap: currentIndex == 0
                                    ? null
                                    : controller.previousPage,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity: currentIndex == 0 ? 0.45 : 1,
                                  child: Container(
                                    height: 52,
                                    width: 52,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.10),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.15),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              /// NEXT BUTTON
                              Expanded(
                                child: _AnimatedNextButton(
                                  title: currentIndex ==
                                      controller.onboardingData.length - 1
                                      ? "Start Learning"
                                      : "Next",
                                  onTap: () {
                                    controller.nextPage();
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          /// SIGN IN
                          Center(
                            child: GestureDetector(
                              onTap: controller.skip,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an account? ",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.65),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          /// BOTTOM HOME INDICATOR
                          Center(
                            child: Container(
                              width: 90,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// ===============================================================
  /// TITLE
  /// ===============================================================
  Widget _buildTitle(
      BuildContext context,
      String title,
      ) {
    final words = title.split(' ');

    if (words.length <= 1) {
      return Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 38,
          height: 1.05,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
        ),
      );
    }

    final firstPart = words.sublist(0, words.length - 1).join(' ');
    final lastWord = words.last;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstPart\n',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              height: 1.05,
              fontWeight: FontWeight.w400,
              letterSpacing: -1,
            ),
          ),
          TextSpan(
            text: lastWord,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              height: 1.05,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chevron() {
    return Icon(
      Icons.chevron_right_rounded,
      size: 18,
      color: Colors.white.withOpacity(0.45),
    );
  }
}
class _AnimatedNextButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _AnimatedNextButton({
    required this.title,
    required this.onTap,
  });

  @override
  State<_AnimatedNextButton> createState() =>
      _AnimatedNextButtonState();
}

class _AnimatedNextButtonState
    extends State<_AnimatedNextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });

    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          borderRadius: BorderRadius.circular(30),
          splashColor: Colors.white.withOpacity(0.08),
          highlightColor: Colors.white.withOpacity(0.04),
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withOpacity(0.18),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                /// =====================================================
                /// ARROW CIRCLE
                /// =====================================================
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final pulse =
                        math.sin(
                          _animationController.value *
                              math.pi *
                              2,
                        ) *
                            1.5;

                    return Transform.translate(
                      offset: Offset(pulse, 0),
                      child: child,
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                /// =====================================================
                /// BUTTON TITLE
                /// =====================================================
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(
                      milliseconds: 350,
                    ),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder:
                        (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(
                              0.15,
                              0,
                            ),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      widget.title,
                      key: ValueKey(widget.title),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                /// =====================================================
                /// CHEVRONS
                /// =====================================================
                _AnimatedChevrons(),

                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}class _AnimatedChevrons extends StatefulWidget {
  const _AnimatedChevrons();

  @override
  State<_AnimatedChevrons> createState() =>
      _AnimatedChevronsState();
}

class _AnimatedChevronsState
    extends State<_AnimatedChevrons>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
                (index) {
              final progress =
                  (_controller.value -
                      (index * 0.18)) %
                      1.0;

              final opacity =
                  0.20 + (progress * 0.65);

              final offset =
                  progress * 3.0;

              return Transform.translate(
                offset: Offset(offset, 0),
                child: Opacity(
                  opacity: opacity.clamp(
                    0.2,
                    0.85,
                  ),
                  child: const Icon(
                    Icons.chevron_right_rounded,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}