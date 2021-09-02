import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Styles {
  static Color splashScreenBgColor = HexColor('#009EDF');
  static Color pageBgColor = Colors.black;
  static Color pageTextColor = Colors.white;
  static Color appBarTextColor = Colors.white;
  static Color primaryColor = HexColor("#009EDF");
  static Color primaryButtonBgColor = HexColor("#009EDF");
  static Color primaryButtonTextColor = Colors.white;
  static Color textFieldFillColor = Colors.white;
  static Color appShellUnselectedColor = Colors.white.withOpacity(0.6);
  static Color appShellSelectedColor = Colors.white;

  static double microFontSize = Platform.isAndroid ? 10.0: 12.0;
  static double smallFontSize = 14.0;
  static double mediumFontSize = 17.0;
  static double largeFontSize = 22.0;
  static double appBarFontSize = 18.0;
}