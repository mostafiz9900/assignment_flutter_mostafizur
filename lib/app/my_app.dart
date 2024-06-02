import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'app_pkg.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeServices themeController = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      translations: LocalizationService(),
      locale: LocalizationService.defaultLocale,
      fallbackLocale: LocalizationService.fallbackLocale,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeController.getThemeMode(),
      routingCallback: (routing) {
        if (routing?.current == '/onboarding') {
          // Perform any logic before navigating to onboarding page
          // printLog('Navigating to onboarding...');
        }
      },
      onInit: () {
        // printLog("app run oninit functin");
        // Helpers.hideKeyboard(context);
      },
      builder: EasyLoading.init(),
      // builder: (BuildContext context, child) {
      //   final originalTextScaleFactor = MediaQuery.of(context).textScaleFactor;
      //   final boldText = MediaQuery.boldTextOf(context);
      //   final newMediaQueryData = MediaQuery.of(context).copyWith(
      //     textScaleFactor: originalTextScaleFactor.clamp(0.8, 1.0),
      //     boldText: boldText,
      //   );
      //   return MediaQuery(
      //     data: newMediaQueryData,
      //     child: child ?? Container(),
      //   );
      // },
    );
  }
}
