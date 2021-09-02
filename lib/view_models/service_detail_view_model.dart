import 'package:get/get.dart';

class ServiceDetailViewModel extends GetxController {
  var currentCarouselIndex = 0.obs;

  void updateCurrentCarouselIndex(int index, reason){
    currentCarouselIndex.value = index;
    update();
  }
}