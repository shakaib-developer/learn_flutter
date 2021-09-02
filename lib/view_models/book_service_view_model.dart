import 'package:archline_flutter/models/cls_booking.dart';
import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/services_list_page_view_model.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class BookServiceViewModel extends GetxController {
  var booking = ClsBooking().obs;
  RxBool isLoading = false.obs;

  ClsBooking copyWith({String? firstName, String? lastName, String? email,
    String? phone, String? message}) {

    booking.value.firstName = firstName ?? booking.value.firstName;
    booking.value.lastName = lastName ?? booking.value.lastName;
    booking.value.email = email ?? booking.value.email;
    booking.value.phone = phone ?? booking.value.phone;
    booking.value.message = message ?? booking.value.message;

    update();

    return booking.value;
  }

  void setIsLoading(bool isLoading){
    this.isLoading(isLoading);
    update();
  }

  Future<void> sendMail() async {
    String subject = "New Booking Request from ${booking.value.firstName}";
    String body = "Hello,\n\nYou have a new Booking request. Details are as "
        "follows:\n\nUsername:\t${booking.value.firstName} ${booking.value
        .lastName}\nEmail:\t${booking.value.email}\nPhone:\t${booking.value
        .phone}\nService Name:\t ${Get.find<ServicesListPageViewModel>()
        .selectedService.value.serviceName}\nMessage:\n${booking
        .value.message}\n\n\nRegards,\nArchline App";

    final Email email = Email(
      body: body,
      subject: subject,
      recipients: ["shakaib.developer@gmail.com"],
      // attachmentPaths: attachments,
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      Get.back();
      Get.snackbar("Success", "Your booking has been made successfully.", snackPosition:
      SnackPosition.BOTTOM, backgroundColor: Styles.appBarTextColor);
    } catch (error) {
      Get.snackbar("Oh No!", "Something went wrong.", snackPosition:
      SnackPosition.BOTTOM, backgroundColor: Styles.appBarTextColor);
    }
  }
}