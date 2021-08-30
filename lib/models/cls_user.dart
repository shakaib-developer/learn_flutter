import 'package:get/get.dart';

class ClsUser {
  RxInt userId = 0.obs;
  RxString fullName = "".obs;
  RxString skill = "".obs;
  RxString contact = "".obs;
  RxString email = "".obs;
  RxString username = "".obs;
  RxString password = "".obs;
  Rx<DateTime?> createdDate = DateTime.now().obs;
  RxInt? createdBy = 0.obs;
  RxString createdByString = "".obs;
  Rx<DateTime?> updatedDate = DateTime.now().obs;
  RxInt? updatedBy = 0.obs;
  RxString updatedByString = "".obs;
  RxInt? isChangePassword = 0.obs;
  RxString imagePath = "".obs;
}
