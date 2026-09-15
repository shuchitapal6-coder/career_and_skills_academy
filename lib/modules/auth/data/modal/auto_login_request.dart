class AutoLoginRequestModel {
  final String deviceId;
  final String fcmToken;


  AutoLoginRequestModel({
    required this.deviceId,
    required this.fcmToken,

  });

  Map<String, dynamic> toMap() {
    return {
      "device_id": deviceId,
      "fcm_token": fcmToken,

    };
  }
}