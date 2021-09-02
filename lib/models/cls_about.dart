import 'dart:convert';

import 'package:archline_flutter/models/cls_user.dart';

List<ClsAbout> clsAboutListFromJson(String str) => List<ClsAbout>.from(json
    .decode(str).map((x) => ClsAbout.fromJson(x)));

String clsAboutListToJson(List<ClsAbout> data) => json.encode(List<dynamic>.from
  (data.map((x) => x.toJson())));

class ClsAbout {
  int aboutId = 0;
  String? aboutDescription = "";
  List<ClsUser> usersList = <ClsUser>[];

  ClsAbout({this.aboutId = 0, this.aboutDescription});

  factory ClsAbout.fromJson(Map<String, dynamic> json) => ClsAbout(
    aboutId: json["AboutId"] as int,
    aboutDescription: json["AboutDescription"] as String,
  );

  Map<String, dynamic> toJson() => {
    "AboutId": aboutId,
    "AboutDescription": aboutDescription ?? "",
  };
}