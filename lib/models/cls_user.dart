import 'dart:convert';

List<ClsUser> clsUserListFromJson(String str) => List<ClsUser>.from(json.decode
  (str).map((x) => ClsUser.fromJson(x)));

String clsUserListToJson(List<ClsUser> data) => json.encode(List<dynamic>.from
  (data.map((x) => x.toJson())));

class ClsUser {
  ClsUser({
    this.userId = 0,
    this.fullName,
    this.skill,
    this.contact,
    this.email,
    this.username,
    this.password,
    this.createdDate,
    this.createdBy,
    this.createdByString,
    this.updatedDate,
    this.updatedBy,
    this.updatedByString,
    this.isChangePassword,
    this.imagePath = "",
    this.deviceToken,
  });

  int userId;
  String? fullName;
  String? skill;
  String? contact;
  String? email;
  String? username;
  String? password;
  DateTime? createdDate;
  int? createdBy;
  String? createdByString;
  DateTime? updatedDate;
  int? updatedBy;
  String? updatedByString;
  bool? isChangePassword;
  String? imagePath;
  String? deviceToken;

  factory ClsUser.fromJson(Map<String, dynamic> json) => ClsUser(
    userId: json["UserId"],
    fullName: json["FullName"],
    skill: json["Skill"],
    contact: json["Contact"],
    email: json["Email"],
    username: json["Username"],
    password: json["Password"],
    createdDate: json["CreatedDate"],
    createdBy: json["CreatedBy"],
    createdByString: json["CreatedByString"],
    updatedDate: json["UpdatedDate"],
    updatedBy: json["UpdatedBy"],
    updatedByString: json["UpdatedByString"],
    isChangePassword: json["IsChangePassword"],
    imagePath: json["ImagePath"],
    deviceToken: json["DeviceToken"],
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "FullName": fullName,
    "Skill": skill,
    "Contact": contact,
    "Email": email,
    "Username": username,
    "Password": password,
    "CreatedDate": createdDate,
    "CreatedBy": createdBy,
    "CreatedByString": createdByString,
    "UpdatedDate": updatedDate,
    "UpdatedBy": updatedBy,
    "UpdatedByString": updatedByString,
    "IsChangePassword": isChangePassword,
    "ImagePath": imagePath,
    "DeviceToken": deviceToken,
  };
}