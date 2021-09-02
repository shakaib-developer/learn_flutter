import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/services_list_page_view_model.dart';
import 'package:archline_flutter/views/service_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesListPage extends StatelessWidget {
  // final ServicesListPageViewModel vm = Get.put(ServicesListPageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBgColor,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                ("HOME"),
                                style: TextStyle(
                                    color: Styles.appBarTextColor,
                                    fontSize: Styles.appBarFontSize
                                ),
                              textAlign: TextAlign.center,
                            ),
                          ]
                      ),
                    ),
                    Text(
                      'SERVICES',
                      style: TextStyle(
                        color: Styles.pageTextColor,
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: vm.refreshListData,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 0,
                              vertical: 4),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: false,
                          itemCount: vm.servicesList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                vm.selectedService(vm.servicesList[index]);
                                Get.to(() => ServiceDetailPage(), arguments:
                                [
                                  vm.servicesList[index],
                                ]);
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
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: vm.servicesList[index].documentsList[0].imagePath,
                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) => Icon(Icons.error, color: Styles.pageTextColor),
                                        )
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric
                                            (horizontal: 20, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(vm.servicesList
                                                  [index].serviceName ?? "",
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: Styles.smallFontSize,
                                                ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,),
                                              SizedBox(height: 5,),
                                              Text(vm.servicesList
                                                  [index].description ?? "",
                                                style: TextStyle(
                                                  color: Styles.pageTextColor,
                                                  fontSize: Styles.microFontSize,
                                                ),
                                              textAlign: TextAlign.justify,
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
                      ),
                    ),
                  ]
                ),
              );
  }
          ),
        
    );
  }
}
