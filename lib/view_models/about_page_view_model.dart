import 'package:archline_flutter/api/api_calls.dart';
import 'package:archline_flutter/models/cls_about.dart';
import 'package:get/get.dart';

class AboutViewModel extends GetxController {
  var about = ClsAbout().obs;

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
    about(await api.fetchAboutInfo());

    print("Users In About = ${about.value.usersList.length}");

    isLoading(false);
  }
}