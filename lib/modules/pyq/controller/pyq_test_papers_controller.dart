import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';
import '../data/modal/pyq_modal.dart';
import '../data/modal/pyq_test_paper_model.dart';
import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';
import '../data/modal/pyq_modal.dart';
import '../data/modal/pyq_test_paper_model.dart';

class PyqTestPapersController extends GetxController {
  late final PyqSubjectModel subject;

  final RxBool isLoading = false.obs;

  final RxMap<String, List<PyqTestPaperModel>> papersByYear =
      <String, List<PyqTestPaperModel>>{}.obs;

  final RxMap<String, bool> expandedYears = <String, bool>{}.obs;
  late final PyqTestPaperModel paper;

  @override
  void onInit() {
    super.onInit();


    subject = Get.arguments as PyqSubjectModel;

    getTestPapers();
  }

  Future<void> getTestPapers() async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(milliseconds: 500));

      papersByYear.assignAll({
        '2025': [
          PyqTestPaperModel(
            id: 1,
            title: '17 Sep - 2022 Sheet - 3',
            year: '2025',
            questionImages: [
              'assets/images/pyqs/question_1.jpg',
              'assets/images/pyqs/question_2.jpg',
              'assets/images/pyqs/question_3.jpg',
            ],
          ),
          PyqTestPaperModel(
            id: 2,
            title: '18 Sep 2022 Shift - 1',
            year: '2025',
            questionImages: [
              'assets/images/pyqs/question_1.jpg',
              'assets/images/pyqs/question_2.jpg',
              'assets/images/pyqs/question_3.jpg',
            ],
          ),
          PyqTestPaperModel(
            id: 3,
            title: '20 Sep 2022 Shift - 1',
            year: '2025',
            questionImages: [
              'assets/images/pyqs/question_1.jpg',
              'assets/images/pyqs/question_2.jpg',
              'assets/images/pyqs/question_3.jpg',
            ],
          ),
        ],
        '2022': [
          PyqTestPaperModel(
            id: 4,
            title: '13 Sept 2022 Shift 2',
            year: '2022',
            questionImages: [
              'assets/images/pyqs/question_1.jpg',
              'assets/images/pyqs/question_2.jpg',
              'assets/images/pyqs/question_3.jpg',
            ],
          ),
          PyqTestPaperModel(
            id: 5,
            title: '16 Sept 2022 Shift 1',
            year: '2022',
            questionImages: [
              'assets/images/pyqs/question_1.jpg',
              'assets/images/pyqs/question_2.jpg',
              'assets/images/pyqs/question_3.jpg',
            ],
          ),
          PyqTestPaperModel(
            id: 6,
            title: '16 Sept 2022 Shift 3',
            year: '2022',
            questionImages: [
              'assets/images/pyqs/question_1.jpg',
              'assets/images/pyqs/question_2.jpg',
              'assets/images/pyqs/question_3.jpg',
            ],
          ),
        ],
      });

      expandedYears.clear();

      for (final year in papersByYear.keys) {
        expandedYears[year] = true;
      }

      expandedYears.refresh();
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'something_went_wrong'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void toggleYear(String year) {
    expandedYears[year] = !(expandedYears[year] ?? false);
    expandedYears.refresh();
  }

  Future<void> refreshPapers() async {
    await getTestPapers();
  }

  void openTestPaper(PyqTestPaperModel paper) {
    // Get.toNamed(
    //   AppRoutes.pyqPaperDetail,
    //   arguments: paper,
    // );
  }
}
