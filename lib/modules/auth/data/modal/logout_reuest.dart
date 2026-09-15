class LogoutRequestModel {
  final String id;

  LogoutRequestModel({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      "reporter_id": id,
    };
  }
}