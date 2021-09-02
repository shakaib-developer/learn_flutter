import 'package:archline_flutter/api/api_calls.dart';
import 'package:archline_flutter/models/cls_contact.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactViewModel extends GetxController {
  var contact = ClsContact().obs;
  var isLoading = false.obs;

  @override
  void onInit() { // called immediately after the widget is allocated memory
    fetchData();
    super.onInit();
  }

  @override
  void onReady() { // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory
    super.onClose();
  }

  Future<void> fetchData() async {
    isLoading(true);

    ApiCalls api = ApiCalls();

    contact(await api.fetchContactInfo());
    print("Contact Info Fetched");

    isLoading(false);
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
    await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
    );
    } else {
    Get.snackbar("Oh No!", "Inavlid url!");
    }
  }
}