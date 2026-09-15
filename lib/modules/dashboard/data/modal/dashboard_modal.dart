class DashboardModel {
  final bool? status;
  final String? message;
  final DashboardData? data;

  DashboardModel({
    this.status,
    this.message,
    this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? null
          : DashboardData.fromJson(json["data"]),
    );
  }
}

class DashboardData {
  final int? totalArticles;
  final int? approvedArticles;
  final int? pendingArticles;
  final int? rejectedArticles;
  final String? totalViews;

  DashboardData({
    this.totalArticles,
    this.approvedArticles,
    this.pendingArticles,
    this.rejectedArticles,
    this.totalViews,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      totalArticles: json["total_articles"]??"",
      approvedArticles: json["approved_articles"]??"",
      pendingArticles: json["pending_articles"]??"",
      rejectedArticles: json["rejected_articles"]??"",
      totalViews: json["total_views"].toString(),
    );
  }
}