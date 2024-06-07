import 'package:assignment_flutter_mostafizur/app/core/values/strings.dart';
import 'package:get/get.dart';

import '../../../app_pkg.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    var token=StorageService.read(StorageConstants.token);
    Future.delayed(const Duration(seconds: 2),(){
      if(token!=null){
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }



}
