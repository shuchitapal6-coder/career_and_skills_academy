



import '../utils/access/access_controller.dart';
import 'package:dio/dio.dart';



class ApiInterceptors extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;

    if (data is Map) {
      final bool hasAccess = data["has_access"] ?? true;
      // final String msg = data["access_note"] ?? "";

      if (!hasAccess) {
        AccessController.instance.handleAccess(
          access: false,
          msg: "Please login first",
        );
      }
    }

    super.onResponse(response, handler);
  }
}