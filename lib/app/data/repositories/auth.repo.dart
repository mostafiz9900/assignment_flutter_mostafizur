

 import '../../app_pkg.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<ApiResponse<LoginResponse>?> login(LoginRequest data) async {
   final res = await authProvider.login('/api/login', data);
   if (BaseResponse.handleApiResponse(res)) {
    return ApiResponse.success(LoginResponse.fromJson(res.body));
   }else{
    ApiResponse.error(res.body["message"]);
   }
   return null;
  }

  Future<dynamic> register(dynamic data) async {
   final res = await authProvider.register('/api/register', data);
   if (BaseResponse.handleApiResponse(res)) {
    return null;
    // RegisterResponse.fromJson(res.body)
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