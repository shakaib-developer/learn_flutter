import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/portfolio_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:get/get.dart';

class PortfolioPage extends StatelessWidget {

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
                            "PORTFOLIO",
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

                Expanded(
                  child: GetBuilder<PortfolioViewModel>(
                    init: PortfolioViewModel(),
                    builder: (vm) {
                      if(vm.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        // return Text(vm.portfolioList.value.length.toString());
                        return GalleryImageView(
                          listImage: vm.portfolioList.map((e) => Image.network(e.imagePath ?? "").image).toList(),
                          width: 200,
                          height: 200,
                          imageDecoration:
                          BoxDecoration(border: Border.all(color: Colors.white)),
                          galleryType: 1,
                        );
                        //   GalleryView(
                        //   crossAxisCount: 2,
                        //   imageUrlList: vm.portfolioList.map((e) => e.imagePath ?? "").toList(),
                        //   key: Key("myGallery"),
                        // );
                    },
                  )
                )
              ],
            )
          )
        )
    );
  }
}
