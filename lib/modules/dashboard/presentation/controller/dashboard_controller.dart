
import 'package:get/get.dart';

import '../../../../app/configure/routs/app_routs.dart';
import '../../data/data_source/dashboard_data_source.dart';
import '../../data/modal/dashboard_modal.dart';

class DashboardController extends GetxController {
  DashboardController(this._dataSource);

  final DashboardDataSource _dataSource;

  final selectedIndex = 0.obs;
  final selectedNavIndex = 0.obs;
  final selectedPageIndex = 0.obs;
  void changeBottomIndex(int index) {
    selectedNavIndex.value = index;

    switch (index) {
      case 0:
        selectedPageIndex.value = 0;
        break;

      case 1:
        selectedPageIndex.value = 1;
        break;

      case 2:
        selectedPageIndex.value = 2;
        break;

      case 3:
        selectedPageIndex.value = 3;
        break;
    }
  }


  final isLoading = false.obs;

  final dashboardModel = Rxn<DashboardModel>();
  final dashboardData = Rxn<DashboardData>();

  @override
  void onInit() {
    super.onInit();
  }




}
