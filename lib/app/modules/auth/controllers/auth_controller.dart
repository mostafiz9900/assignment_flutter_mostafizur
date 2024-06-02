import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();



  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await authRepository.register(
        (
        email: registerEmailController.text,
        password: registerPasswordController.text,
        ),
      );



      if (res!.token.isNotEmpty) {
        StorageService.setString(StorageConstants.token, res.token);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      }
    }
  }

  Future<dynamic> login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      var res = await authRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
          deviceToken: ""
        ),
      );
      if (res?.data!=null) {
        StorageService.setString(StorageConstants.token, res!.data!.token);
        Get.toNamed(Routes.HOME);
      }
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



}