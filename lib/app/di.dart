
import 'package:get/get.dart';

import 'app_pkg.dart';



class DependencyInjection {
  static Future<void> init() async {
     Get.lazyPut(() => StorageService());
    Get.put<ThemeServices>(ThemeServices(),permanent: true);
  }
}