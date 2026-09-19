import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';
import '../data/modal/pyq_modal.dart';

class PyqsController extends GetxController {
  final RxList<PyqSubjectModel> subjects = <PyqSubjectModel>[].obs;
  final RxBool isLoading = false.obs;

  final String courseName = 'Rrb group-d';

  int get maxPaperCount {
    if (subjects.isEmpty) return 0;

    return subjects
        .map((item) => item.testPaperCount)
        .reduce((a, b) => a > b ? a : b);
  }

  int get totalPapers {
    return subjects.fold(
      0,
          (sum, item) => sum + item.testPaperCount,
    );
  }

  IconData getSubjectIcon(String subject) {
    switch (subject.toLowerCase()) {
      case 'maths':
        return Icons.calculate_rounded;

      case 'science':
        return Icons.science_rounded;

      case 'gen intelligence and reasoning':
        return Icons.psychology_rounded;

      case 'general awareness':
        return Icons.public_rounded;

      default:
        return Icons.menu_book_rounded;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPyqs();
  }

  Future<void> getPyqs() async {
    try {
      isLoading.value = true;

      subjects.assignAll([
        const PyqSubjectModel(
          subject: 'Maths',
          testPaperCount: 46,
        ),
        const PyqSubjectModel(
          subject: 'Science',
          testPaperCount: 12,
        ),
        const PyqSubjectModel(
          subject: 'Gen Intelligence and Reasoning',
          testPaperCount: 12,
        ),
        const PyqSubjectModel(
          subject: 'General Awareness',
          testPaperCount: 19,
        ),
      ]);
    } finally {
      isLoading.value = false;
    }
  }
  void openSubject(PyqSubjectModel subject) {
    Get.toNamed(
      AppRoutes.pyqTestPapers,
      arguments: subject,
    );
  }
  void openFilter() {
    // Open filter
  }
}