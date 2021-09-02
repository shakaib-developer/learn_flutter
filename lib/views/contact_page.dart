import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/contact_view_model.dart';
import 'package:archline_flutter/views/book_service_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
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
                            "CONTACT US",
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
                  child: GetBuilder<ContactViewModel>(
                    init: ContactViewModel(),
                    builder: (vm) {
                      if(vm.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/contactus.png",
                                fit: BoxFit.contain,
                              ),

                              SizedBox(height: 30),

                              Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white.withOpacity(0.75),
                                child: Column(
                                  children: [
                                    rowWith('images/phone.png', vm.contact
                                        .value.contactNo ?? ""),
                                    rowWith('images/message.png', vm.contact
                                        .value.email ?? ""),
                                    rowWith('images/location.png', vm.contact
                                        .value.address ?? ""),
                                    Padding(
                                      padding: const EdgeInsets.symmetric
                                        (vertical: 5, horizontal: 20),
                                      child: Row(
                                        children: [
                                          Text('Find us on Social Media:',
                                            style: TextStyle(
                                              fontSize: Styles.microFontSize,
                                              color: Colors.white,
                                            ),
                                          ),

                                          GestureDetector(
                                              child: Image.asset('images/fb.png', width: 35),
                                              onTap: () async {
                                                await vm.launchURL(vm.contact.value.facebookLink ?? "");
                                              },
                                          ),

                                          SizedBox(width: 10),
                                          GestureDetector(
                                            child: Image.asset('images/insta.png', width: 35),
                                            onTap: () async {
                                              await vm.launchURL(vm.contact.value.instagramLink ?? "");
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(height: 30),

                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20,
                                    horizontal: 10),
                                  color: Colors.white.withOpacity(0.75),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Every great architect is '
                                            'necessarily a great poet. He must be a great original interpreter of his time, his day, his age.',
                                        style: TextStyle(
                                          color: Styles.pageTextColor,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        maxLines: 5,
                                      ),

                                      SizedBox(height: 20),

                                      Text(
                                        'FRANK LIOYD WRIGHT',
                                        style: TextStyle(
                                          color: Styles.pageTextColor
                                        ),
                                      )
                                    ],
                                  )
                              ),

                              SizedBox(height: 15),

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
                            ],
                          ),
                        );
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget rowWith(String image, String text){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Image.asset(image, width: 17),
        ),
        Expanded(child: Text(text, style: TextStyle(
          color: Colors.white,
          fontSize: Styles.smallFontSize,
        ),))
      ],
    );
  }
}
