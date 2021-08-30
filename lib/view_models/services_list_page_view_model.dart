import 'package:archline_flutter/api/api_calls.dart';
import 'package:archline_flutter/models/cls_service.dart';
import 'package:get/get.dart';

class ServicesListPageViewModel extends GetxController {
  var servicesList = <ClsService>[].obs;
  var selectedService = ClsService().obs;

  RxBool isLoading = false.obs;

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

  Future fetchData() async {
    ApiCalls api = ApiCalls();

    isLoading(true);

    servicesList = await api.fetchServicesList();
    // if(servicesFromApi != null){
    //   servicesList = servicesFromApi;
    // }
    isLoading(false);
  }

  void updateItem(int index, ClsService newItem) {
    servicesList[index].description = "Updated Item description";
    servicesList[index].serviceName = "Updated Service";
    update();
  }
}
