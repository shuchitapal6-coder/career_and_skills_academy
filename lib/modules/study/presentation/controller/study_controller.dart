import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/modals/study_model.dart';




class StudyController extends GetxController {
  final RxBool isLoading = false.obs;

  final RxList<StudySubjectModel> subjects =
      <StudySubjectModel>[
        const StudySubjectModel(
          id: 1,
          name: 'Maths',
          chapters: 50,
          completed: 0,
        ),
        const StudySubjectModel(
          id: 2,
          name: 'English',
          chapters: 55,
          completed: 0,
        ),
        const StudySubjectModel(
          id: 3,
          name: 'Hindi',
          chapters: 81,
          completed: 0,
        ),
        const StudySubjectModel(
          id: 4,
          name: 'Computer Science',
          chapters: 5,
          completed: 0,
        ),
        const StudySubjectModel(
          id: 5,
          name: 'Social Studies',
          chapters: 31,
          completed: 0,
        ),
        const StudySubjectModel(
          id: 6,
          name: 'Sanskrit',
          chapters: 16,
          completed: 0,
        ),
        const StudySubjectModel(
          id: 7,
          name: 'Science',
          chapters: 59,
          completed: 0,
        ),
      ].obs;

  int get totalSubjects => subjects.length;

  int get totalChapters {
    return subjects.fold(
      0,
          (sum, subject) => sum + subject.chapters,
    );
  }

  int get completedChapters {
    return subjects.fold(
      0,
          (sum, subject) => sum + subject.completed,
    );
  }

  double get overallProgress {
    if (totalChapters == 0) {
      return 0;
    }

    return completedChapters / totalChapters;
  }

  int get overallProgressPercentage {
    return (overallProgress * 100).round();
  }

  void openSubject(StudySubjectModel subject) {
    Get.snackbar(
      subject.name,
      subject.isStarted
          ? 'Continue learning ${subject.name}'
          : 'Start learning ${subject.name}',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
      icon: const Icon(
        Icons.menu_book_rounded,
        color: Colors.white,
      ),
    );
  }

  void updateSubjectProgress({
    required int subjectId,
    required int completed,
  }) {
    final index = subjects.indexWhere(
          (subject) => subject.id == subjectId,
    );

    if (index == -1) {
      return;
    }

    final subject = subjects[index];

    subjects[index] = subject.copyWith(
      completed: completed.clamp(0, subject.chapters),
    );
  }

  Future<void> refreshSubjects() async {
    isLoading.value = true;

    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      // TODO:
      // Replace this section with your API call.
      //
      // Example:
      // final response = await ApiService.get(...);
      // subjects.assignAll(
      //   response.map(
      //     (item) => StudySubjectModel.fromJson(item),
      //   ),
      // );
    } finally {
      isLoading.value = false;
    }
  }
}