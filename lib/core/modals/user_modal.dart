class ReporterModel {
  final int id;
  final String reporterCode;
  final String idNo;
  final String name;
  final String phone;
  final String email;
  final String bio;
  final String dob;
  final String gender;
  final String fatherName;
  final String address;

  final int stateId;
  final String stateName;

  final int cityId;
  final String cityName;

  final String pincode;
  final String area;

  final String profileImage;
  final String? aadharCard;
  final String educationalDocument;

  final int yearOfEx;

  final int reporterLevelId;
  final String levelName;

  final int reporterJoiningTypeId;
  final String joiningTypeName;

  final int reporterDesignationId;
  final String designationName;

  final String qualification;
  final String status;

  final String? idCardValidity;

  ReporterModel({
    required this.id,
    required this.reporterCode,
    required this.idNo,
    required this.name,
    required this.phone,
    required this.email,
    required this.bio,
    required this.dob,
    required this.gender,
    required this.fatherName,
    required this.address,
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
    required this.pincode,
    required this.area,
    required this.profileImage,
    required this.aadharCard,
    required this.educationalDocument,
    required this.yearOfEx,
    required this.reporterLevelId,
    required this.levelName,
    required this.reporterJoiningTypeId,
    required this.joiningTypeName,
    required this.reporterDesignationId,
    required this.designationName,
    required this.qualification,
    required this.status,
    this.idCardValidity,
  });

  static int parseInt(dynamic value) {
    if (value == null) return 0;
    return int.tryParse(value.toString()) ?? 0;
  }

  factory ReporterModel.fromJson(Map<String, dynamic> json) {
    return ReporterModel(
      id: parseInt(json["id"]),
      reporterCode: json["reporter_code"]?.toString() ?? "",
      idNo: json["id_no"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      phone: json["phone"]?.toString() ?? "",
      email: json["email"]?.toString() ?? "",
      bio: json["bio"]?.toString() ?? "",
      dob: json["dob"]?.toString() ?? "",
      gender: json["gender"]?.toString() ?? "",
      fatherName: json["father_name"]?.toString() ?? "",
      address: json["address"]?.toString() ?? "",

      stateId: parseInt(json["state_id"]),
      stateName: json["state_name"]?.toString() ?? "",

      cityId: parseInt(json["city_id"]),
      cityName: json["city_name"]?.toString() ?? "",

      pincode: json["pincode"]?.toString() ?? "",
      area: json["area"]?.toString() ?? "",

      profileImage: json["profile_image"]?.toString() ?? "",
      aadharCard: json["aadhar_card"]?.toString() ?? "",
      educationalDocument:
      json["educational_document"]?.toString() ?? "",

      yearOfEx: parseInt(json["year_of_ex"]),

      reporterLevelId: parseInt(json["reporter_level_id"]),
      levelName: json["level_name"]?.toString() ?? "",

      reporterJoiningTypeId:
      parseInt(json["reporter_joining_type_id"]),
      joiningTypeName:
      json["joining_type_name"]?.toString() ?? "",

      reporterDesignationId:
      parseInt(json["reporter_designation_id"]),
      designationName:
      json["designation_name"]?.toString() ?? "",

      qualification: json["qualification"]?.toString() ?? "",
      status: json["status"]?.toString() ?? "",
      idCardValidity: json["id_card_validity"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "reporter_code": reporterCode,
      "id_no": idNo,
      "name": name,
      "phone": phone,
      "email": email,
      "bio": bio,
      "dob": dob,
      "gender": gender,
      "father_name": fatherName,
      "address": address,

      "state_id": stateId,
      "state_name": stateName,

      "city_id": cityId,
      "city_name": cityName,

      "pincode": pincode,
      "area": area,

      "profile_image": profileImage,
      "aadhar_card": aadharCard,
      "educational_document": educationalDocument,

      "year_of_ex": yearOfEx,

      "reporter_level_id": reporterLevelId,
      "level_name": levelName,

      "reporter_joining_type_id": reporterJoiningTypeId,
      "joining_type_name": joiningTypeName,

      "reporter_designation_id": reporterDesignationId,
      "designation_name": designationName,

      "qualification": qualification,
      "status": status,
      "id_card_validity": idCardValidity,
    };
  }
}