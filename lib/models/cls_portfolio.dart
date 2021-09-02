import 'dart:convert';

import 'package:archline_flutter/utility/global_data.dart';

List<ClsPortfolio> clsPortfolioListFromJson(String str) => List<ClsPortfolio>
    .from(json.decode(str).map((x) => ClsPortfolio.fromJson(x)));

String clsPortfolioListToJson(List<ClsPortfolio> data) => json.encode
  (List<dynamic>.from(data.map((x) => x.toJson())));

class ClsPortfolio {
  ClsPortfolio({
    this.documentId = 0,
    this.typeId,
    this.remarks,
    this.date,
    this.documentExtension,
    this.documentType,
    this.imagePath,
    this.categoryId,
    this.categoryName,
  });

  int documentId;
  int? typeId;
  String? remarks;
  DateTime? date;
  String? documentExtension;
  String? documentType;
  String? imagePath;
  int? categoryId;
  String? categoryName;

  factory ClsPortfolio.fromJson(Map<String, dynamic> json) => ClsPortfolio(
    documentId: json["DocumentId"],
    typeId: json["TypeId"],
    remarks: json["Remarks"],
    date: DateTime.fromMillisecondsSinceEpoch(GlobalData.epochToDate(json["Date"])),
    documentExtension: json["DocumentExtension"],
    documentType: json["DocumentType"],
    imagePath: json["ImagePath"],
    categoryId: json["CategoryId"],
    categoryName: json["CategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "DocumentId": documentId,
    "TypeId": typeId,
    "Remarks": remarks,
    "Date": date,
    "DocumentExtension": documentExtension,
    "DocumentType": documentType,
    "ImagePath": imagePath,
    "CategoryId": categoryId,
    "CategoryName": categoryName,
  };
}