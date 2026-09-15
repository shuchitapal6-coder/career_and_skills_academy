// import 'package:get/get.dart';
//
// import '../../../../core/network/api_constant.dart';
// import '../../../../core/network/api_services.dart';
//
//
// abstract class HomeDataSource {
//   // Future<CategoryResponse> getCategories();
//
//   Future<BreakingNewsResponse> getBreakingNews();
//
//   Future<NewsListResponseModel> getNews(NewsListRequestModel request);
//
//   Future<NewsDetailResponseModel> getNewsDetail(NewsDetailRequestModel request);
//
//   Future<AddCommentResponseModel> addNewsComment(
//     AddCommentRequestModel request,
//   );
//
//   Future<GetComments> getComments(GetcommentRequest request);
//
//
//   Future<SaveNewsResponseModel> saveNews(
//       SaveNewsRequestModel request,
//       );
// }
//
// class HomeDataSourceImpl extends HomeDataSource {
//   final ApiServices apiServices;
//
//   HomeDataSourceImpl(this.apiServices);
//
//   Future<BreakingNewsResponse> getBreakingNews() async {
//     final response = await apiServices.callPost(
//       ApiConstants.breskingNews,
//       isUserRequired: false,
//     );
//
//     return BreakingNewsResponse.fromJson(response.data);
//   }
//
//   @override
//   Future<NewsListResponseModel> getNews(NewsListRequestModel request) async {
//     try {
//       final response = await apiServices.callPost(
//         ApiConstants.newsList,
//         req: request.toJson(),
//         isUserRequired: false,
//       );
//
//       return NewsListResponseModel.fromJson(response.data ?? {});
//     } catch (e) {
//       throw Exception("News List API Failed: $e");
//     }
//   }
//
//   @override
//   Future<NewsDetailResponseModel> getNewsDetail(
//     NewsDetailRequestModel request,
//   ) async {
//     final response = await apiServices.callPost(
//       ApiConstants.newsDetail,
//       req: request.toJson(),
//       isUserRequired: false,
//     );
//
//     return NewsDetailResponseModel.fromJson(response.data);
//   }
//
//   @override
//   Future<AddCommentResponseModel> addNewsComment(
//     AddCommentRequestModel request,
//   ) async {
//     try {
//       final response = await apiServices.callPost(
//         ApiConstants.addNewsComment,
//         req: request.toJson(),
//       );
//
//       return AddCommentResponseModel.fromJson(response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   @override
//   Future<GetComments> getComments(GetcommentRequest request) async {
//     final response = await apiServices.callPost(
//       ApiConstants.getcomments,
//       req: request.toJson(),
//       isUserRequired: false,
//     );
//
//     return GetComments.fromJson(response.data);
//   }
//
//
//
//   @override
//   Future<SaveNewsResponseModel> saveNews(
//       SaveNewsRequestModel request,
//       ) async {
//
//     final response = await apiServices.callPost(
//       ApiConstants.saveNews,
//       req: request.toJson(),
//     );
//
//     return SaveNewsResponseModel.fromJson(response.data);
//   }
// }
