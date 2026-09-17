import 'package:career_and_skills_academy/core/widgets/animation/animated_fade_slide.dart';
import 'package:career_and_skills_academy/core/widgets/custom_scafold.dart';
import 'package:career_and_skills_academy/core/widgets/empty_widget.dart';
import 'package:career_and_skills_academy/modules/drawer/task/screen/task_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/widgets/chips/app_choice_chip.dart';
import '../controller/explore_courses_controller.dart';
import '../data/modal/explore_courses_model.dart';


class ExploreCourses extends GetView<ExploreCoursesController> {
  const ExploreCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: 'Academic Courses',
      showBackButton: true,

      body:  TweenFadeSlide(
          child: Column(
            children: [


              const SizedBox(height: 8),

            ],

        ),
      ),


    );
  }

}

