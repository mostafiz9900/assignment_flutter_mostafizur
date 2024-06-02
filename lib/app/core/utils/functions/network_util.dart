
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:get/get.dart';
class NetworkUtil {
  static Future<bool> checkNetworkConnectivity2() async {
    var connectivityResult = await (connectivity.Connectivity().checkConnectivity());
    return connectivityResult.contains( connectivity.ConnectivityResult.none);
  }
  Future<bool> checkInternetConnection() async {
    final  connectivityResult =
    await connectivity.Connectivity().checkConnectivity();
    if (GetPlatform.isAndroid) {
      if (connectivityResult.contains( connectivity.ConnectivityResult.mobile)) {
        return true;
      } else if (connectivityResult.contains( connectivity.ConnectivityResult.wifi)) {
        return true;
      }else if (connectivityResult.contains(  connectivity.ConnectivityResult.ethernet)) {
        return true;
      } else if (connectivityResult.contains( connectivity.ConnectivityResult.vpn)) {
        return true;
      } else if (connectivityResult.contains(  connectivity.ConnectivityResult.bluetooth)) {
        return true;
      } else if (connectivityResult.contains(connectivity.ConnectivityResult.other)) {
        return true;
      } else if (connectivityResult.contains( connectivity.ConnectivityResult.none)) {
        return false;
      } else {
        return false;
      }
    } else {
      if (connectivityResult.contains( connectivity.ConnectivityResult.mobile)) {
        return true;
      } else if (connectivityResult.contains( connectivity.ConnectivityResult.wifi)) {
        return true;
      }  else if (connectivityResult.contains(  connectivity.ConnectivityResult.ethernet)) {
        return true;
      } else if (connectivityResult.contains( connectivity.ConnectivityResult.vpn)) {
        return true;
      } else if (connectivityResult.contains(  connectivity.ConnectivityResult.bluetooth)) {
        return true;
      }else if (connectivityResult.contains( connectivity.ConnectivityResult.other)) {
        return true;
      } else if (connectivityResult.contains(connectivity.ConnectivityResult.none)) {
        return false;
      } else {
        return false;
      }
    }
  }
}