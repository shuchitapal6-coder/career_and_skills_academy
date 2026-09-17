import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../controller/my_courses_controller.dart';

import '../../../../core/widgets/custom_scafold.dart';

import '../data/modal/my_courses_modal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../controller/my_courses_controller.dart';

class MyCoursesPage extends GetView<MyCoursesController> {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: 'My Courses',

      actions: const [],
      body: SafeArea(
        child:  Column(
            children: [

            ],
          ),
        ),

    );
  }


}

