
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_pkg.dart';

class AppTheme {
  /// Light Theme
  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: ColorConstants.primaryColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      brightness: Brightness.light,
      onSurface: Colors.white,
      surface: ColorConstants.primaryColor,
      primary: Colors.black,
      secondary: Colors.red,
    ),
    scaffoldBackgroundColor: ColorConstants.backgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorConstants.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorConstants.primaryColor,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    brightness: Brightness.light,
 /*   primaryTextTheme: TextTheme(
      bodyMedium: AppTextStyleLight.displayMedium,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.displayLarge,
      ),
      displayMedium: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.displayMedium,
      ),
      displaySmall: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.displaySmall,
      ),
      headlineMedium: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.headlineMedium,
      ),
      headlineSmall: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.headlineSmall,
      ),
      titleLarge: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.titleLarge,
      ),
      titleMedium: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.titleMedium,
      ),
      titleSmall: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.titleSmall,
      ),
      bodyLarge: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.bodyLarge,
      ),
      bodyMedium: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.bodyMedium,
      ),
      bodySmall: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.bodySmall,
      ),
      labelLarge: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.labelLarge,
      ),
      labelMedium: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.labelMedium,
      ),
      labelSmall: GoogleFonts.rubik(
        textStyle: AppTextStyleLight.labelSmall,
      ),
    ),*/
    iconTheme: const IconThemeData(color: Colors.white, size: 25.0),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.primaryColor,
    //   titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
    //   iconTheme: const IconThemeData(color: Colors.white),
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //       statusBarIconBrightness: Brightness.light,
    //       statusBarColor: AppColors.primaryColor),
    // ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorConstants.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.primaryColor,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorConstants.primaryColor,
    ),
  );

  /// Dark Theme
  ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    brightness: Brightness.dark,
    // backgroundColor: Colors.black,
    primaryColor: Colors.amber,
    cardColor: Colors.black,
    cardTheme: const CardTheme(color: Colors.red),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.rubik(
          // textStyle: AppTextStyleDark.displayLarge
      ),
      displayMedium: GoogleFonts.rubik(
        // textStyle: AppTextStyleDark.displayMedium,
      ),
      displaySmall: GoogleFonts.rubik(
        // textStyle: AppTextStyleDark.displaySmall
      ),
      headlineMedium: GoogleFonts.rubik(
        // textStyle:  AppTextStyleDark.headlineMedium,
      ),
      headlineSmall: GoogleFonts.rubik(
        // textStyle: AppTextStyleDark.headlineSmall,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white, size: 25.0),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey.shade800,
    ),
  );
}
