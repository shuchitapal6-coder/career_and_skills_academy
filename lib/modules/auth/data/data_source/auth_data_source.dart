

import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_services.dart';
import '../modal/auto_login_request.dart';
import '../modal/change_password_request_model.dart';
import '../modal/logout_reuest.dart';
import '../modal/reporter_login_request_model.dart';

abstract class AuthApiDataSource {
  /// Reporter Login
  Future<ResponseModel> reporterLogin(ReporterLoginRequestModel request);

  Future<ResponseModel> autoLogin(AutoLoginRequestModel request);

  Future<ResponseModel> logout(LogoutRequestModel request);

}

class AuthApiDataSourceImpl extends AuthApiDataSource {
  final ApiServices apiServices;

  AuthApiDataSourceImpl(this.apiServices);

  @override
  Future<ResponseModel> reporterLogin(ReporterLoginRequestModel request) async {
    return await apiServices.callPost(
      ApiConstants.Login,
      req: request.toMap(),

      isUserRequired: true,
    );
  }

  @override
  Future<ResponseModel> autoLogin(AutoLoginRequestModel request) async {
    return await apiServices.callPost(
      ApiConstants.AutoLogin,
      req: request.toMap(),
      isUserRequired: true,
    );
  }

  @override
  Future<ResponseModel> logout(LogoutRequestModel request) async {
    return await apiServices.callPost(
      ApiConstants. Logout,
      req: request.toMap(),
      isUserRequired: true,
    );

    /// Reporter
  }


}
