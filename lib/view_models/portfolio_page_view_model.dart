import 'package:archline_flutter/api/api_calls.dart';
import 'package:archline_flutter/models/cls_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PortfolioViewModel extends GetxController {
  var portfolioList = <ClsPortfolio>[].obs;
  var pageController = PageController();
  var page = 0.obs;

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

  onPageChanged(int pg) {
    page(pg);
  }

  Future<void> fetchData() async {
    isLoading(true);

    await refreshPortfolioData();

    print("Portfolio Count = ${portfolioList.value.length}");

    isLoading(false);
  }

  Future<void> refreshPortfolioData() async {
    ApiCalls api = ApiCalls();
    portfolioList(await api.fetchPortfolio());
  }
}