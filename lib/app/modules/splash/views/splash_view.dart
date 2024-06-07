import 'package:assignment_flutter_mostafizur/app/app_pkg.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(controller.hashCode);
    return Scaffold(
      body:  Center(
        child: Image.asset(AssetsConstants.logo),
      ),
    );
  }
}
