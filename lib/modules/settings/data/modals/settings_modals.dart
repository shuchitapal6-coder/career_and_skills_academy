class SettingsModel {
  final String companyName;
  final String emailId;
  final String phoneNo;
  final String whatsappNo;
  final String facebookLink;
  final String instagramLink;
  final String twitterLink;
  final String linkedinLink;
  final String youtubeLink;
  final String copyright;
  final String logo;
  final String address;

  SettingsModel({
    required this.companyName,
    required this.emailId,
    required this.phoneNo,
    required this.whatsappNo,
    required this.facebookLink,
    required this.instagramLink,
    required this.twitterLink,
    required this.linkedinLink,
    required this.youtubeLink,
    required this.copyright,
    required this.logo,
    required this.address,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      companyName: json["company_name"] ?? "",
      emailId: json["email_id"] ?? "",
      phoneNo: json["phone_no"] ?? "",
      whatsappNo: json["whatsapp_no"] ?? "",
      facebookLink: json["facebook_link"] ?? "",
      instagramLink: json["instagram_link"] ?? "",
      twitterLink: json["twitter_link"] ?? "",
      linkedinLink: json["linkedin_link"] ?? "",
      youtubeLink: json["youtube_link"] ?? "",
      copyright: json["copyright"] ?? "",
      logo: json["logo"] ?? "",
      address: json["address"] ?? "",
    );
  }
}