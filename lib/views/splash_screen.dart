import 'package:archline_flutter/utility/styles.dart';
import 'package:archline_flutter/view_models/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  late final SplashScreenViewModel vm;

  SplashScreen() {
    vm = Get.put(SplashScreenViewModel());
    vm.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.splashScreenBgColor,
      body: Center(
        // child: Text('Hello this is a splash screen'),
        child: Image(
          image: AssetImage(
            'images/splashimage.png',
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
