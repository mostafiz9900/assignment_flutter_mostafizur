
import 'package:assignment_flutter_mostafizur/app/app_pkg.dart';
import 'package:get/get.dart';

import '../data.dart';
import '../models/request/reg_request.dart';

class AuthProvider extends BaseProvider{
  Future<Response> login(String path, LoginRequest data)async {
    var res=await post(path, data.toJson());
    printLog('res   ::: ${res.body}');
    return res;
  }

  Future<Response> register(String path, RegRequest data) {
    return post(path, data.toMap());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }
}