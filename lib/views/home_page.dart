import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/home_page_view_model.dart';
import 'package:archline_flutter/views/about_page.dart';
import 'package:archline_flutter/views/contact_page.dart';
import 'package:archline_flutter/views/portfolio_page.dart';
import 'package:archline_flutter/views/services_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // final vm = Get.put(HomePageViewModel());

  buildBottomNavigationMenu(context) {
    return GetBuilder<HomePageViewModel>(
        builder: (landingPageController) {
          return SizedBox(
            height: 60,
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: landingPageController.changeTabIndex,
              currentIndex: landingPageController.currentTab.value,
              backgroundColor: Styles.primaryColor,
              unselectedItemColor: Styles.appShellUnselectedColor,
              selectedItemColor: Styles.appShellSelectedColor,
              unselectedLabelStyle: TextStyle(
                color: Styles.primaryColor,
              ),
              // selectedLabelStyle: TextStyle(
              //   color: Colors.red,
              // ),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.home_outlined,
                      size: 20.0,
                    ),
                  ),
                  label: 'Home',
                  backgroundColor: Styles.primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.history_edu_outlined,
                      size: 20.0,
                    ),
                  ),
                  label: 'Portfolio',
                  backgroundColor: Styles.primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: 20.0,
                    ),
                  ),
                  label: 'About',
                  backgroundColor: Styles.primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.contact_page_outlined,
                      size: 20.0,
                    ),
                  ),
                  label: 'Contact',
                  backgroundColor: Styles.primaryColor,
                ),
              ],
            ),
          );
        }
        );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
        init: HomePageViewModel(),
        builder: (vm) =>
            Scaffold(
                bottomNavigationBar:
                buildBottomNavigationMenu(context),
                body: SafeArea(
                  child: IndexedStack(
                    index: vm.currentTab.value,
                    children: [
                      ServicesListPage(),
                      PortfolioPage(),
                      AboutPage(),
                      ContactPage(),
                    ],
                  ),
                )
            ));
  }
}
