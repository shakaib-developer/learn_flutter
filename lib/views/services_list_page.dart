import 'package:archline_flutter/models/cls_service.dart';
import 'package:archline_flutter/view_models/services_list_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesListPage extends StatelessWidget {
  // final ServicesListPageViewModel vm = Get.put(ServicesListPageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
          GetBuilder<ServicesListPageViewModel>(
            init: ServicesListPageViewModel(),
            builder: (vm) {
              if(vm.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SERVICES',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                      itemCount: vm.servicesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // var svc = ClsService().obs;
                            // svc.value.serviceName = "New Service";
                            // svc.value.description = "This is a new service. This "
                            //     "is a"
                            //     " new service. This is a new service. This is a new service.";
                            // svc.value.imagePath = vm.servicesList[index].value
                            //     .imagePath;
                            //
                            // vm.servicesList.add(svc);
                            vm.updateItem(index, vm.servicesList[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0,
                                vertical: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Image.network(vm
                                        .servicesList[index].documentsList[0]
                                        .imagePath,
                                    fit: BoxFit.cover,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    )
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 10, 10,
                                          10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(vm.servicesList
                                              [index].serviceName ?? "",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 16.0,
                                            ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,),
                                          SizedBox(height: 5,),
                                          Text(vm.servicesList
                                              [index].description ?? "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ]
                ),
              );
  }
          ),
        
    );
  }
}
