import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../app_pkg.dart';
import '../../../global_widgets/custom_button.dart';
import 'registration_view.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#F8F8F8'),
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Form(
                    key: authController.loginFormKey,
                    child: Column(
                      children: [
                        AppSpace.spaceH20,
                        AppSpace.spaceH30,
                        Image.asset(AssetsConstants.logo),
                        AppSpace.spaceH30,
                        const Text('Sign In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        AppSpace.spaceH30,
                        CustomEditTextFormField(
                          controller: authController.loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          isBorder: true,
                          hintText: 'Email',
                          backgroundColor: Colors.white,
                          isEnabledBorder: false,
                          prefixIcon:AssetsConstants.gmailSvg ,
                          // validator: (text) {
                          //   return validateText(text!);
                          // },
                          onChanged: (value) {},
                        ),
                        AppSpace.spaceH16,
                        CustomEditTextFormField(
                          controller: authController.loginPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          isBorder: true,
                          hintText: 'Password',
                          backgroundColor: Colors.white,
                          isEnabledBorder: false,
                          prefixIcon: AssetsConstants.passwordSvg,
                          suffixIcon: authController.isPasswordVisible
                              ? AssetsConstants.passwordVisibile
                              : AssetsConstants.passwordInvisibile,
                          passwordVisible: !authController.isPasswordVisible,
                          suffixOnTap: () {
                            authController.showHidePassword();
                          },
                          // validator: (text) {
                          //   return validateText(text!);
                          // },
                          onChanged: (value) {},
                        ),
                        AppSpace.spaceH20,
                        CreateNewAccount(
                          titleTwo: 'Forgot Password?',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              printLog('data');
                              // Get.to(() => const RegistrationView(),
                              //     binding: AuthBinding());
                            },
                        ),
                        AppSpace.spaceH42,
                        CustomButton(
                          isLoading:authController.isLoadLogin,
                          onPressed: (){
                              if(authController.loginEmailController.text==""){
                                Helpers.snackbarForErorr2(bodyText: 'Please input email');
                              }else if(authController.loginPasswordController.text==""){
                                Helpers.snackbarForErorr2(bodyText: 'Please input password');
                              }else{
                                authController.login();
                            }
                          },
                          title:'Login' ,
                        ),
                        AppSpace.spaceH42,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsConstants.fbIcon,width: 55,),
                            AppSpace.spaceW6,
                            Image.asset(AssetsConstants.gIcon,width: 55,),
                          ],
                        ),

                        AppSpace.spaceH42,
                        CreateNewAccount(
                          alignment: Alignment.center,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              printLog('data');
                              Get.to(() => const RegistrationView(),
                                  binding: AuthBinding());
                            },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}


class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key,required this.recognizer,this.titleOne,this.titleTwo,this.alignment});
  final GestureRecognizer? recognizer;
  final String? titleOne;
  final String? titleTwo;
  final AlignmentGeometry? alignment;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment?? Alignment.centerRight,
      padding: const EdgeInsets.only(right: 10),
      child: RichText(
        text: TextSpan(
          text:titleOne?? "",
          style: Get.textTheme.titleSmall!.copyWith(
              color: ColorConstants.black.withOpacity(0.8),
              fontSize: 17,
              fontWeight: FontWeight.w300

          ),
          children: [
            TextSpan(
              recognizer:recognizer,
              text: titleTwo??' Create New Account',
              style: Get.textTheme.titleSmall!.copyWith(
                  color: hexToColor("#383C40"),
                  fontSize: 17.36,
                  fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
      ),
    );
  }
}
