import 'package:flutter/material.dart';

class AppColors {
  static const Color kBlack = Color(0xFF00001E);
  static const Color kLightGrey = Color(0xFFFBFBFB);
  static const Color kGrey = Color(0xFFF1F1F1);
  static const Color kDarkGrey = Color(0xFFA0A0A0);
  static const Color kWhite = Colors.white;
  static const Color kRed = Colors.red;
  static const Color kGreen = Colors.green;
  static const Color kBlackTwo = Color(0XFFF1F1F1);
  static const Color kTabBarTextColor = Color(0XFF595959);
  static const Color kLightGreyBTwoColor = Color(0XFF757575);
  static const Color kBidSendMessageColor = Color(0XFFE2E2E2);
  static const Color kBrandColor = Color(0xFF01337a);

  static const MaterialColor primarySwatch =
      MaterialColor(_primaryColorValue, <int, Color>{
    50: Color(0xFFE0E0E4),
    100: Color(0xFFB3B3BC),
    200: Color(0xFF80808F),
    300: Color(0xFF4D4D62),
    400: Color(0xFF262640),
    500: Color(_primaryColorValue),
    600: Color(0xFF00001A),
    700: Color(0xFF000016),
    800: Color(0xFF000012),
    900: Color(0xFF00000A),
  });
  static const int _primaryColorValue = 0xFF00001E;

  static const MaterialColor primaryColorAccent =
      MaterialColor(_primaryColorAccentValue, <int, Color>{
    100: Color(0xFF4F4FFF),
    200: Color(_primaryColorAccentValue),
    400: Color(0xFF0000E8),
    700: Color(0xFF0000CE),
  });
  static const int _primaryColorAccentValue = 0xFF1C1CFF;
}
