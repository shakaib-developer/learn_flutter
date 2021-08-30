// To parse this JSON data, do
//
//     final clsService = clsServiceFromJson(jsonString);

import 'dart:convert';
import 'package:archline_flutter/utility/global_data.dart';
import 'package:get/get.dart';

import 'cls_document.dart';

List<ClsService> clsServiceFromJson(String str) => RxList<ClsService>.from
   (json.decode(str).map((x) => ClsService.fromJson(x)));

String clsServiceToJson(List<ClsService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*=========================================================================*/

class ClsService {
  int serviceId = 0;
  String? serviceName = "";
  String? description = "";
  String? imagePath = "";
  int? document1Id = 0;
  int? document2Id = 0;
  int? document3Id = 0;
  int? document4Id = 0;
  String? imageName1 = "";
  String? imageName2 = "";
  String? imageName3 = "";
  String? imageName4 = "";
  DateTime? createdDate = DateTime.now();
  int? createdBy = 0;
  String? createdByString = "";
  DateTime? updatedDate = DateTime.now();
  int? updatedBy = 0;
  String? updatedByString = "";
  List<ClsDocument> documentsList = <ClsDocument>[];

  ClsService();

  factory ClsService.fromJson(Map<String, dynamic> json) {
    var svc = ClsService();
    svc.serviceId = json["ServiceId"];
    svc.serviceName = json["ServiceName"];
    svc.description = json["Description"];
    svc.imagePath = json["ImagePath"];
    svc.document1Id = json["Document1Id"];
    svc.document2Id = json["Document2Id"];
    svc.document3Id = json["Document3Id"];
    svc.document4Id = json["Document4Id"];
    svc.imageName1 = json["ImageName1"];
    svc.imageName2 = json["ImageName2"];
    svc.imageName3 = json["ImageName3"];
    svc.imageName4 = json["ImageName4"];
    svc.createdDate = DateTime.fromMicrosecondsSinceEpoch(GlobalData.epochToDate(json["CreatedDate"]));
    svc.createdBy = json["CreatedBy"];
    svc.createdByString = json["CreatedByString"];
    svc.updatedDate = DateTime.fromMicrosecondsSinceEpoch(GlobalData
        .epochToDate(json["UreatedDate"]));
    svc.updatedBy = json["UpdatedBy"];
    svc.updatedByString = json["UpdatedByString"];
    svc.documentsList = List<ClsDocument>.from(json["DocumentsList"].map(
            (x) => ClsDocument.fromJson(x)));
    // svc.documentsList = (json["DocumentsList"].map(
    // (x) => ClsDocument.fromJson(x))) as RxList<ClsDocument>;

    return svc;
  }

  Map<String, dynamic> toJson() => {
        "ServiceId": serviceId,
        "ServiceName": serviceName,
        "Description": description,
        "ImagePath": imagePath,
        "Document1Id": document1Id,
        "Document2Id": document2Id,
        "Document3Id": document3Id,
        "Document4Id": document4Id,
        "ImageName1": imageName1,
        "ImageName2": imageName2,
        "ImageName3": imageName3,
        "ImageName4": imageName4,
        "CreatedDate": createdDate,
        "CreatedBy": createdBy,
        "CreatedByString": createdByString,
        "UpdatedDate": updatedDate,
        "UpdatedBy": updatedBy,
        "UpdatedByString": updatedByString,
        "DocumentsList": jsonEncode(documentsList),
      };
}


// class DocumentsList {
//   DocumentsList({
//     this.documentId,
//     this.typeId,
//     this.remarks,
//     this.date,
//     this.documentExtension,
//     this.documentType,
//     this.imagePath,
//     this.categoryId,
//     this.categoryName,
//   });
//
//   int documentId;
//   String typeId;
//   String remarks;
//   String date;
//   String documentExtension;
//   String documentType;
//   String imagePath;
//   int categoryId;
//   RxString categoryName;
//
//   factory DocumentsList.fromJson(Map<String, dynamic> json) => DocumentsList(
//     documentId: json["DocumentId"],
//     typeId: json["TypeId"],
//     remarks: json["Remarks"],
//     date: json["Date"],
//     documentExtension: json["DocumentExtension"],
//     documentType: json["DocumentType"],
//     imagePath: json["ImagePath"],
//     categoryId: json["CategoryId"],
//     categoryName: json["CategoryName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "DocumentId": documentId,
//     "TypeId": typeId,
//     "Remarks": remarks,
//     "Date": date,
//     "DocumentExtension": documentExtension,
//     "DocumentType": documentType,
//     "ImagePath": imagePath,
//     "CategoryId": categoryId,
//     "CategoryName": categoryName,
//   };
// }