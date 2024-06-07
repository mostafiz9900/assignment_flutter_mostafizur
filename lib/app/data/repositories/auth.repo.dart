

 import '../../app_pkg.dart';
import '../models/request/reg_request.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<ApiResponse<LoginResponse>?> login(LoginRequest data) async {
    var url=ApiUrl.login;
   final res = await authProvider.login(url, data);
   printLog('response body ::::  ');
   printLog('${res.body}123456');
   if (res.statusCode==200) {
    return ApiResponse.success(LoginResponse.fromMap(res.body));
   }else{
   return  ApiResponse.error(res.body!=null?res.body["code"].toString():"Server not response");
   }
  }

  Future<ApiResponse<String>> register(RegRequest data) async {
    var url=ApiUrl.reg;
   final res = await authProvider.register(url, data);
   if (res.statusCode==200) {
    return ApiResponse.success(res.body['message']??"");
   }else{
     return ApiResponse.error(res.body!=null?res.body['message']:"Not valid authentication");
   }
  }

  Future<dynamic> getUsers() async {
   final res = await authProvider.getUsers('/api/users?page=1&per_page=12');
   if (BaseResponse.handleApiResponse(res)) {
    return null;
    // UsersResponse.fromJson(res.body)
   }
  }
 }