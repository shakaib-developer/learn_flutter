import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/about_page_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.pageBgColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ABOUT US",
                          style: TextStyle(
                              color: Styles.appBarTextColor,
                              fontSize: Styles.appBarFontSize
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]
                  ),
                ),
              ),

              Expanded(child: GetBuilder<AboutViewModel>(
                  init: AboutViewModel(),
                  builder: (vm) {
                    if(vm.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              "images/about.jpg",
                              fit: BoxFit.contain,
                            ),

                            SizedBox(height: 30),

                            Text(
                              vm.about.value.aboutDescription ?? "",
                              style: TextStyle(
                                color: Styles.pageTextColor,
                                fontSize: Styles.smallFontSize,
                              ),
                              textAlign: TextAlign.justify,
                            ),

                            SizedBox(height: 30),

                            Text(
                              "OUR TEAM",
                              style: TextStyle(
                                  color: Styles.pageTextColor,
                                  fontSize: Styles.mediumFontSize,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            SizedBox(height: 30),

                            GridView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0,
                                ),
                                itemCount: vm.about.value.usersList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      CachedNetworkImage(
                                        height: 100,
                                        fit: BoxFit.contain,
                                        imageUrl: vm.about.value.usersList[index].imagePath ?? "",
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.error, color: Styles.pageTextColor),
                                      ),

                                      SizedBox(height: 10),

                                      Text(
                                        vm.about.value.usersList[index].fullName ?? "",
                                        style: TextStyle(
                                            color: Styles.pageTextColor
                                        ),
                                      ),

                                      Text(
                                        vm.about.value.usersList[index].skill ?? "",
                                        style: TextStyle(
                                            color: Styles.pageTextColor
                                        ),
                                      )
                                    ],
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    }
                  }
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
