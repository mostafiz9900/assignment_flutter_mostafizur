import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../app_pkg.dart';
import '../../../global_widgets/custom_button.dart';

class RegistrationView extends GetView<AuthController> {
  const RegistrationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SafeArea(
            child: Padding(
              padding: AppSpace.pagePadding,
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppSpace.pagePadding,
                  child: Column(
                    children: [
                      AppSpace.spaceH20,
                      AppSpace.spaceH30,
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Container(
                            width: 121,
                            height: 121,
                            padding: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: hexToColor('#FFFFFF'),
                              borderRadius: BorderRadius.circular(90)
                            ),
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: SvgPicture.asset(AssetsConstants.userIconSvg,width: 25,height: 31,)),
                          ),
                          Positioned.fill(
                              bottom: -35,
                              right: -22,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: SvgPicture.asset(AssetsConstants.cameraIconSvg)))
                        ],
                      ),
                      AppSpace.spaceH30,
                      const Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                      AppSpace.spaceH30,
                      CustomEditTextFormField(
                        // controller: authController.loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        isBorder: true,
                        hintText: 'Name',
                        backgroundColor: Colors.white,
                        isEnabledBorder: false,
                        prefixIcon:AssetsConstants.userIconSvg ,
                        // validator: (text) {
                        //   return validateEmail(text!);
                        // },
                        onChanged: (value) {},
                      ),
                      AppSpace.spaceH10,
                      CustomEditTextFormField(
                        // controller: authController.loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        isBorder: true,
                        hintText: 'Email',
                        backgroundColor: Colors.white,
                        isEnabledBorder: false,
                        prefixIcon:AssetsConstants.gmailSvg ,
                        // validator: (text) {
                        //   return validateEmail(text!);
                        // },
                        onChanged: (value) {},
                      ),
                      AppSpace.spaceH10,
                      CustomEditTextFormField(
                        // controller: authController.loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        isBorder: true,
                        hintText: 'Password',
                        backgroundColor: Colors.white,
                        isEnabledBorder: false,
                        prefixIcon: AssetsConstants.passwordSvg,
                        passwordVisible: !authController.isPasswordVisible,
                        suffixOnTap: () {
                          authController.showHidePassword();
                        },
                        // validator: (text) {
                        //   return validateEmail(text!);
                        // },
                        onChanged: (value) {},
                      ),
                    AppSpace.spaceH10,
                      CustomEditTextFormField(
                        // controller: authController.loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        isBorder: true,
                        hintText: 'Confirm Password',
                        backgroundColor: Colors.white,
                        isEnabledBorder: false,
                        prefixIcon: AssetsConstants.passwordSvg,
                        passwordVisible: !authController.isPasswordVisible,
                        suffixOnTap: () {
                          authController.showHidePassword();
                        },
                        // validator: (text) {
                        //   return validateEmail(text!);
                        // },
                        onChanged: (value) {},
                      ),
                      AppSpace.spaceH42,
                      CustomButton(
                        onPressed: (){},
                        title:'Sign Up' ,
                      ),
                      AppSpace.spaceH20,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetsConstants.fbIcon,width: 55,),
                          AppSpace.spaceW6,
                          Image.asset(AssetsConstants.gIcon,width: 55,),
                        ],
                      ),
            
                      AppSpace.spaceH30,
                      CreateNewAccountReg(
                        alignment: Alignment.center,
                        titleOne: 'Already have an account? ',
                        titleTwo: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            printLog('data');
                           Get.toNamed(Routes.LOGIN);
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
    );
  }
}


class CreateNewAccountReg extends StatelessWidget {
  const CreateNewAccountReg({super.key,required this.recognizer,this.titleOne,this.titleTwo,this.alignment,this.titleTwoColor});
  final GestureRecognizer? recognizer;
  final String? titleOne;
  final String? titleTwo;
  final AlignmentGeometry? alignment;
  final Color? titleTwoColor;

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
                  color:titleTwoColor?? hexToColor("#2893E3"),
                  fontSize: 17.36,
                  fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
  }
}
