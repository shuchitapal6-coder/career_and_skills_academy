import 'package:get/get.dart';

import '../data/modal/my_courses_modal.dart';


class MyCoursesController extends GetxController {
  final selectedTab = 0.obs;

  final performances = <PerformanceModel>[
    const PerformanceModel(
      testName: 'Flutter Practice Test',
      subject: 'Flutter',
      date: '16 Sep 2026',
      attempts: 3,
      score: 82,
      marks: 41,
      totalMarks: 50,
    ),
    const PerformanceModel(
      testName: 'Dart DSA Test',
      subject: 'Dart',
      date: '14 Sep 2026',
      attempts: 2,
      score: 76,
      marks: 38,
      totalMarks: 50,
    ),
    const PerformanceModel(
      testName: 'Database Worksheet',
      subject: 'Database',
      date: '12 Sep 2026',
      attempts: 4,
      score: 91,
      marks: 45.5,
      totalMarks: 50,
    ),
    const PerformanceModel(
      testName: 'Programming Basics',
      subject: 'Programming',
      date: '10 Sep 2026',
      attempts: 2,
      score: 68,
      marks: 34,
      totalMarks: 50,
    ),
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  double get averageScore {
    if (performances.isEmpty) return 0;

    final total = performances.fold<double>(
      0,
          (sum, item) => sum + item.score,
    );

    return total / performances.length;
  }

  int get totalAttempts {
    return performances.fold(
      0,
          (sum, item) => sum + item.attempts,
    );
  }

  double get averageMarks {
    if (performances.isEmpty) return 0;

    final total = performances.fold<double>(
      0,
          (sum, item) => sum + item.marks,
    );

    return total / performances.length;
  }

  double get completionPercentage {
    if (performances.isEmpty) return 0;

    final completed = performances
        .where((item) => item.score >= 50)
        .length;

    return (completed / performances.length) * 100;
  }
}