import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/modal/explore_courses_model.dart';



class ExploreCoursesController extends GetxController {
  final isLoading = false.obs;
  final selectedFilter = 'All'.obs;

  late final List<AcademicCourse> courses;

  @override
  void onInit() {
    super.onInit();
    _initializeCourses();
  }

  void _initializeCourses() {
    courses = [
      AcademicCourse(
        id: '1',
        title: 'English Complete Course',
        image: 'assets/images/courses/english_course.png',
        onTap: () => openCourse('1'),
      ),
      AcademicCourse(
        id: '2',
        title: 'Class 12 Hindi Course',
        image: 'assets/images/courses/class_12_hindi.png',
        onTap: () => openCourse('2'),
      ),
      AcademicCourse(
        id: '3',
        title: 'Class 12 Complete Course',
        image: 'assets/images/courses/class_12.png',
        onTap: () => openCourse('3'),
      ),
      AcademicCourse(
        id: '4',
        title: 'Class 11 Complete Course',
        image: 'assets/images/courses/class_11.png',
        onTap: () => openCourse('4'),
      ),
    ];
  }

  void openCourse(String courseId) {
    // Navigate to course detail page.
    //
    // Example:
    // Get.toNamed(
    //   AppRoutes.courseDetail,
    //   arguments: {'courseId': courseId},
    // );
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}