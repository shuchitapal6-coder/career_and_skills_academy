

import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_services.dart';
import '../../../../core/storage/app_preferences.dart';
import '../modal/dashboard_modal.dart';


abstract class DashboardDataSource {
  Future<DashboardModel> dashboard();
}

class DashboardDataSourceImpl extends DashboardDataSource {

  final ApiServices apiServices;

  DashboardDataSourceImpl(this.apiServices);


  @override
  Future<DashboardModel> dashboard() async {
    final response = await apiServices.callPost(
      ApiConstants.dashboard,
      req: {
        "reporter_id" :SharedPrefManager.instance.userId
      },

 isUserRequired: true
    );

    return DashboardModel.fromJson(response.data);
  }

}
