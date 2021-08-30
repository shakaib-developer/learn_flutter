import 'package:archline_flutter/utility/global_data.dart';

class ClsDocument {
  int documentId = 0;
  String typeId = "";
  String remarks = "";
  DateTime date = DateTime.now();
  String documentExtension = "";
  String documentType = "";
  String imagePath = "";

  ClsDocument();

  factory ClsDocument.fromJson(Map<String, dynamic> json) {
    ClsDocument document = ClsDocument();
    document.documentId = json["DocumentId"];
    document.typeId = json["TypeId"];
    document.remarks = json["Remarks"];
    document.date = DateTime.fromMicrosecondsSinceEpoch(GlobalData.epochToDate(json["Date"]));
    document.documentExtension = json["DocumentExtension"];
    document.documentType = json["DocumentType"];
    document.imagePath = json["ImagePath"];

    return document;
  }

  Map<String, dynamic> toJson() => {
        "DocumentId": documentId,
        "TypeId": typeId,
        "Remarks": remarks,
        "Date": date,
        "DocumentExtension": documentExtension,
        "DocumentType": documentType,
        "ImagePath": imagePath,
      };
}
