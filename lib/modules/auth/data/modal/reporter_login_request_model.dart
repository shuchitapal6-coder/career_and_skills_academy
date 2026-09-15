class ReporterLoginRequestModel {
  final String email;
  final String password;
  final String deviceId;
  final String fcmToken;

  ReporterLoginRequestModel({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.fcmToken,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
      "device_id": deviceId,
      "fcm_token": fcmToken,
    };
  }
}