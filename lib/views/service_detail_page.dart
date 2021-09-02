import 'package:archline_flutter/models/cls_service.dart';
import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/service_detail_view_model.dart';
import 'package:archline_flutter/views/book_service_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ServiceDetailPage extends StatelessWidget {
  dynamic argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.pageBgColor,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                  color: Styles.appBarTextColor),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  ((argumentData[0] as ClsService).serviceName ?? "").toUpperCase(),
                  style: TextStyle(
                    color: Styles.appBarTextColor,
                    fontSize: Styles.appBarFontSize
                  )
                ),
              ]
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GetBuilder<ServiceDetailViewModel>(
                        init: ServiceDetailViewModel(),
                        builder: (controller) {
                          return Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 280.0,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1,
                                  onPageChanged: controller.updateCurrentCarouselIndex,
                                ),
                                items: (argumentData[0] as ClsService).documentsList.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          width: MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl: i.imagePath,
                                                fit: BoxFit.cover,
                                                height: 250,
                                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                errorWidget: (context, url, error)
                                                => Icon(Icons.error, color: Styles.pageTextColor),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 5),
                                                color: Styles.primaryButtonBgColor,
                                                child: Text(
                                                  'Best World Class Services',
                                                  style: TextStyle(
                                                    color: Styles.primaryButtonTextColor,
                                                    fontSize: Styles.mediumFontSize,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          )
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 15),
                              AnimatedSmoothIndicator(
                                activeIndex: controller.currentCarouselIndex.value,
                                count: (argumentData[0] as ClsService).documentsList.length,
                                effect: SlideEffect(
                                    activeDotColor: Styles.primaryColor,
                                    dotColor: Colors.grey
                                ),
                              )
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 15),

                      Text(
                        (argumentData[0] as ClsService).description ?? "",
                        style: TextStyle(
                          fontSize: Styles.microFontSize,
                          color: Styles.pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      SizedBox(height: 15,),

                      ElevatedButton(
                          onPressed: (){
                            Get.to(() => BookServicePage());
                          },
                          child: Text(
                            'BOOK US NOW',
                            style: TextStyle(
                              color: Styles.primaryButtonTextColor,
                              fontSize: Styles.mediumFontSize,
                            ),
                          ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric
                            (vertical: 20.0, horizontal: 30.0)),
                          backgroundColor: MaterialStateProperty.all(Styles
                              .primaryButtonBgColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Styles.primaryButtonBgColor)
                                )
                            )
                        ),
                      )
                    ]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
