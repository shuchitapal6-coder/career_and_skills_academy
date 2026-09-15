import 'dart:async';
import 'dart:io';

import 'package:career_and_skills_academy/core/network/retry_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:get/get.dart' hide FormData, Response, MultipartFile;



import '../storage/app_preferences.dart';
import 'api_constant.dart';

class ApiServices extends GetxService {
  late final Dio _dio;

  Dio get dio => _dio;

  @override
  void onInit() {
    super.onInit();

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          "Accept": "application/json",
          ApiConstants.xApiKey: ApiConstants.xApiValue,
        },

        /// ✅ FIXED (only accept valid HTTP responses)
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    _dio.interceptors.add(_buildRetry());

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  // ---------------- CORE HELPERS ----------------

  Map<String, String> _headers({bool auth = false, bool isMultipart = false}) {
    final headers = <String, String>{
      "Accept": "application/json",
      ApiConstants.xApiKey: ApiConstants.xApiValue,
      "Content-Type": isMultipart
          ? "multipart/form-data"
          : "application/json",
      "Authorization": ApiConstants.reporterAuthorization,
    };

    if (auth) {
      final token = SharedPrefManager.instance.userToken;
      if (token.isNotEmpty) {
        headers[ApiConstants.authorization] = "Bearer $token";
      }
    }

    return headers;
  }

  RetryInterceptor _buildRetry() {
    return RetryInterceptor(
      dio: _dio,
      retries: 3,
      retryEvaluator: (error, attempt) {
        return error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.connectionError;
      },
    );
  }

  // ---------------- POST ----------------
  Future<ResponseModel> callPost(
      String endpoint, {
        Map<String, dynamic>? req,
        FormData? multipartRequest,
        bool isUserRequired = false,
        String? customAuthorization,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: multipartRequest ?? req ?? {},
        options: Options(
          headers: _headers(
            auth: isUserRequired,
            isMultipart: multipartRequest != null,

          ),
        ),
      );

      return _parseResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ResponseModel(false, "Unexpected error", null);
    }
  }

  // ---------------- GET ----------------

  Future<ResponseModel> callGet(
      String endpoint, {
        Map<String, dynamic>? queryParams,
        bool isUserRequired = false,
      }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: _headers(auth: isUserRequired)),
      );

      return _parseResponse(response);
    } catch (e) {
      return ResponseModel(false, "Unexpected error", null);
    }
  }

  // ---------------- PARSER ----------------

  ResponseModel _parseResponse(Response response) {
    final data = response.data;

    final bool status = data["status"] ?? false;
    final String message = data["message"] ?? "";

    return ResponseModel(status, message, data);
  }

  // ---------------- ERROR HANDLER ----------------

  ResponseModel _handleDioError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;

      return ResponseModel(
        false,
        data["message"] ?? "Request failed",
        data,
      );
    }

    return ResponseModel(false, "Network error", null);
  }
}




void printMessage(String message) {
  print(message);
}

Future<ResponseModel> checkResponseModel(Response response) async {
  if (response.statusCode == 200 || response.statusCode == 201) {
    final status = response.data['status'] ?? false;
    final message = response.data['message'] ?? '';

    /// 🔥 IMPORTANT FIX
    final data = response.data;

    return ResponseModel(status, message, data);
  }

  final message = response.data['message'] ?? "Something went wrong";
  return ResponseModel(false, message, response.data);
}

class ResponseModel {
  final bool _status;
  final String _message;
  final dynamic _data;

  ResponseModel(this._status, this._message, this._data);

  String get message => _message;

  bool get status => _status;

  dynamic get data => _data;
}

