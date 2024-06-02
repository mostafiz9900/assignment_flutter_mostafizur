import 'package:get/get.dart';

import '../../../app_pkg.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2),(){
      Get.offAllNamed(Routes.LOGIN);
    });
  }



}
