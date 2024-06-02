
import 'package:get/get.dart';

import 'data/data.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    //provider
    Get.put(AuthProvider(), permanent: true);
    //Repository
    Get.put(AuthRepository(authProvider: Get.find()), permanent: true);
  }
}