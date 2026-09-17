import 'package:get/get.dart';

import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_services.dart';
import '../modals/settings_modals.dart';

abstract class SettingsDataSource {
  Future<SettingsModel> getSettings();
}

class SettingsDataSourceImpl extends SettingsDataSource {
  final apiService = Get.put(ApiServices());





  @override
  Future<SettingsModel> getSettings() async {
    final response = await apiService.callGet(
      ApiConstants.settings,
      isUserRequired: true,
    );

    print("DETAIL RESPONSE: ${response.data}");
    return SettingsModel.fromJson(response.data['data']);
  }


}