import 'package:archline_flutter/views/home_page.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController {
  Future loadData() async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(() => HomePage());
  }
}
