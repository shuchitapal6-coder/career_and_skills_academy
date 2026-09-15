class ChangePasswordRequestModel {
  final String reporterId;
  final String newPassword;
  final String confirmNewPassword;

  ChangePasswordRequestModel({
    required this.reporterId,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      "reporter_id": reporterId,
      "new_password": newPassword,
      "confirm_new_password": confirmNewPassword,
    };
  }
}