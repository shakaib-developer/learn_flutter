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

  Future<void> fetchData() async {
    isLoading(true);

    await refreshListData();
    // if(servicesFromApi != null){
    //   servicesList = servicesFromApi;
    // }
    isLoading(false);
  }

  Future<void> refreshListData() async {
    ApiCalls api = ApiCalls();
    setServicesList(await api.fetchServicesList());
  }

  void setServicesList(List<ClsService> servicesList){
    this.servicesList.value = servicesList;
    update();
  }
}
