
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app_pkg.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await DependencyInjection.init();
  // change the status bar color to material color [green-400]
  await FlutterStatusbarcolor.setStatusBarColor(ColorConstants.lightScaffoldBackgroundColor);
  if (useWhiteForeground(ColorConstants.lightScaffoldBackgroundColor)) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }

// change the navigation bar color to material color [orange-200]
  await FlutterStatusbarcolor.setNavigationBarColor(ColorConstants.lightScaffoldBackgroundColor);
  if (useWhiteForeground(ColorConstants.lightScaffoldBackgroundColor)) {
  FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  } else {
  FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }
  runApp(
    const MyApp(),

  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
  // ..indicatorSize = 45.0
    ..radius = 10.0
  // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
  // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}