import 'dart:convert';

List<ClsContact> clsContactListFromJson(String str) => List<ClsContact>.from
  (json.decode(str).map((x) => ClsContact.fromJson(x)));

String clsContactListToJson(List<ClsContact> data) => json.encode(List<dynamic>
    .from(data.map((x) => x.toJson())));

class ClsContact {
  ClsContact({
    this.contactId = 0,
    this.contactNo,
    this.email,
    this.address,
    this.facebookLink,
    this.instagramLink,
  });

  int contactId;
  String? contactNo;
  String? email;
  String? address;
  String? facebookLink;
  String? instagramLink;

  factory ClsContact.fromJson(Map<String, dynamic> json) => ClsContact(
    contactId: json["ContactId"],
    contactNo: json["ContactNo"],
    email: json["Email"],
    address: json["Address"],
    facebookLink: json["FacebookLink"],
    instagramLink: json["InstagramLink"],
  );

  Map<String, dynamic> toJson() => {
    "ContactId": contactId,
    "ContactNo": contactNo,
    "Email": email,
    "Address": address,
    "FacebookLink": facebookLink,
    "InstagramLink": instagramLink,
  };
}