class ClsBooking {
  String firstName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String message = "";

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Phone": phone,
    "Message": message,
  };
}