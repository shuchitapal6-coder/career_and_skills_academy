import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/configure/routs/app_routs.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../../../../core/widgets/drawer/app_drawer.dart';

import '../../widget/ai_assist_section.dart';
import '../../widget/explore_ai_section.dart';
import '../../widget/explore_courses_section.dart';
import '../../widget/home_app_bar.dart';
import '../../widget/online_courses_section.dart';
import '../../widget/product_help_section.dart';
import '../../widget/quick_action_section.dart';
import '../../widget/student_header.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScaffold(
      showAppBar: true,
      useAppBarGradient: true,
      appBar: const HomeAppBar(),
      showMenuButton: true,
      drawer: AppDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // controller.fetchHomeData();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: TweenFadeSlide(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),

                  QuickActionSection(),

                  SizedBox(height: 18),

                  AiAssistSection(),

                  SizedBox(height: 18),

                  ExploreAiSection(),

                  SizedBox(height: 18),

                  OnlineCoursesSection(),

                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to courses
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: AspectRatio(
                          aspectRatio: 2.25,
                          child: Image.asset(
                            'assets/banner/banner1.png',
                            width: double.infinity,
                            fit: BoxFit.fill,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                color: AppColors.containerBg,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.school_rounded,
                                  size: 48,
                                  color: AppColors.primary,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  const ExploreCoursesSection(),

                  const SizedBox(height: 18),

                  const ProductHelpSection(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
