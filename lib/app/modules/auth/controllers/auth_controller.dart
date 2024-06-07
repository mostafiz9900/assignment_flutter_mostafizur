import 'package:assignment_flutter_mostafizur/app/data/models/request/reg_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../global_widgets/common.widget.dart';
import '../../../routes/app_pages.dart';


class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final userNameTextEditController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  bool isPasswordVisible = false;
bool loadRegReq=false;
  void register() async {
    var regReq=RegRequest(
      username: userNameTextEditController.text,
      email: registerEmailController.text,
      password: registerPasswordController.text,
    );
    try{
      if (await NetworkUtil.checkInternetConnection()) {
        loadRegReq=true;
        update();
        final res = await authRepository.register(regReq);
        if (res.data!=null) {
          loadRegReq=false;
          update();
          userNameTextEditController.clear();
          registerPasswordController.clear();
          registerEmailController.clear();
          registerConfirmPasswordController.clear();
          Get.back();
          Helpers.snackBarForSuccess2(bodyText: res.data??'');

        }else{
          loadRegReq=false;
          update();
          Helpers.snackbarForErorr2(bodyText: res.errorMessage??'');
        }
      }else{
        loadRegReq=false;
        update();
        Helpers.snackbarForErorr2(bodyText: AppConstants.noInternetConnection);
      }
    } on Exception catch (e) {
  printLog('login error :: $e');
  loadRegReq = false;
  update();
  Helpers.snackbarForErorr2(bodyText: "$e");
  }finally{
      loadRegReq = false;
      update();
    }
  }
bool isLoadLogin=false;
  Future<dynamic> login() async {
   try{
     if (await NetworkUtil.checkInternetConnection()) {
       isLoadLogin=true;
       update();
       var res = await authRepository.login(
         LoginRequest(
           userName: loginEmailController.text,
           password: loginPasswordController.text,
         ),
       );
       if (res?.data!=null) {
         StorageService.save(StorageConstants.token, res!.data!.token);
         StorageService.saveMap(StorageConstants.userInfo, res.data!.toMap());
         isLoadLogin=false;
         update();
         loginEmailController.clear();
         loginPasswordController.clear();
         Get.offAllNamed(Routes.HOME);
       }else{
         isLoadLogin=false;
         update();
         Helpers.snackbarForErorr2(bodyText: res?.errorMessage??'');
       }
     }else{
       isLoadLogin=false;
       update();
       Helpers.snackbarForErorr2(
           bodyText: AppConstants.noInternetConnection);
     }
   }on Exception catch (e) {
     printLog('login error :: $e');
     isLoadLogin = false;
     update();
     Helpers.snackbarForErorr2(bodyText: "$e");
   }finally{
     isLoadLogin = false;
     update();
   }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
  void showHidePassword() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }


}