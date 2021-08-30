import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageViewModel extends GetxController {
  var currentTab = 0.obs;

  void changeTabIndex(int index) {
    currentTab.value = index;
  }

}
