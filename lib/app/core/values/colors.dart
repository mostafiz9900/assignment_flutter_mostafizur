import 'package:flutter/material.dart';

class ColorConstants {
  static Color lightScaffoldBackgroundColor = hexToColor('#F8F8F8');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = const Color(0xFFF6F6F6);
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color black = const Color(0xFF000000);
  static Color borderColor = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color primaryColor = hexToColor('#084277');
  static Color secondaryColor = Colors.white;
  static Color whiteColor = Colors.white;
  static Color backgroundColor = hexToColor("#F2F4F7");
  static Color colorPrimary = hexToColor("#F2F4F7");
  static Color buttonColor = hexToColor("#EF693D");
  static Color editTextFillColor =hexToColor("#F7F7F7");
  static Color iconColor = hexToColor("#CCCCCC");
  static Color textColor = hexToColor("#084277");
  static Color mainTextColor = hexToColor("#000000");

  static Color secondaryTextColor = hexToColor("#6B6B6B");
  static Color labelTextColor = hexToColor("#111111");
  static Color hintTextColor = hexToColor("#CCCCCC");
  static Color subTextColor = hexToColor("#B7B7B7");
  static Color blueColor = hexToColor("#0092D2");
  static Color redColor = hexToColor("#F90000");
  static Color greenColor = hexToColor("#3BC900");
  static Color homeTopSectionTextColor = hexToColor("#1E1E1E");
  static Color imgBgColor = hexToColor("#0092D2");
  static Color outlineBorderRedColor = hexToColor("#EF693D");
  static Color textFormBGColor = hexToColor("#F7F7F7");
}
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}