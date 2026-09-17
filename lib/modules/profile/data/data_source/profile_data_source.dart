// import 'package:get/get.dart';
//
// import '../../../../../core/network/api_constant.dart';
// import '../../../../../core/network/api_services.dart';
// import '../../../../core/storage/app_preferences.dart';
// import '../modal/profile_modal.dart';
// import '../modal/profile_update_request_modal.dart';
// import 'package:dio/dio.dart' as dio;
//
// abstract class ProfileDataSource {
//
//   Future<ProfileModel> getProfile();
//
//
//   Future<ResponseModel> Updateprofile(UpdateProfileRequest request);
// }
//
// class ProfileDataSourceImpl extends ProfileDataSource {
//   final apiService = Get.find<ApiServices>();
//
//   Future<ProfileModel> getProfile() async {
//     final response = await apiService.callPost(
//       ApiConstants.profile,
//       req: {
//         "id": SharedPrefManager.userId.toString(),
//       },
//       isUserRequired: true,
//     );
//
//     return ProfileModel.fromJson(response.data);
//
//   }
//   @override
//   Future<ResponseModel> Updateprofile(UpdateProfileRequest request) async {
//     final dio.FormData formData = dio.FormData();
//     formData.fields.add(MapEntry("id", request.id.toString()));
//     formData.fields.add(MapEntry("name", request.name ?? ""));
//
//     formData.fields.add(MapEntry("email_id", request.emailId ?? ""));
//
//     formData.fields.add(MapEntry("gender", request.gender ?? ""));
//
//     if (request.profilePhoto != null) {
//       formData.files.add(
//         MapEntry(
//           "image",
//           await dio.MultipartFile.fromFile(
//             request.profilePhoto!.path,
//             filename: request.profilePhoto!.path.split('/').last,
//           ),
//         ),
//       );
//     }
//
//     final response = await apiService.callPost(
//       ApiConstants.updateprofile,
//       multipartRequest: formData,
//       isUserRequired: true,
//     );
//
//     return response;
//   }
// }
