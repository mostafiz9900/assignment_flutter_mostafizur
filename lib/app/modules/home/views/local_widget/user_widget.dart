import 'package:assignment_flutter_mostafizur/app/app_pkg.dart';
import 'package:assignment_flutter_mostafizur/app/global_widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customDivider()=> Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(thickness: 1,indent: 2,height: 2,color: hexToColor('#A0A9BD').withOpacity(0.3),endIndent: 2,),
    );
    Widget customTitle(String text)=>Text(text,style: TextStyle(color: hexToColor('#263238').withOpacity(0.80),fontWeight: FontWeight.w400,fontSize: 16),);
    return Scaffold(

      body: Padding(
        padding:
        AppSpace.pagePadding,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('My Account',
                style: TextStyle(color: hexToColor('#222455'),fontSize: 21,fontWeight: FontWeight.w700),
                ),
                AppSpace.spaceH30,
            
                DottedBorder(
                  borderType: BorderType.Circle,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  color: hexToColor('#FFADAD'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.transparent,
                    ),
                  ),
                ),
            
                AppSpace.spaceH30,
                Text('Mostafiz',style: TextStyle(
                  color: hexToColor('#000000'),
                  fontSize: 24,fontWeight: FontWeight.w900
                ),),
                AppSpace.spaceH6,
                Text('mostafiz9900@gmail.com',style: TextStyle(
                  color: hexToColor('#535353'),
                  fontSize: 18,fontWeight: FontWeight.w400
                ),),
                AppSpace.spaceH30,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: hexToColor('#4D5877').withOpacity(0.10),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      _CustomExpansionTileWidget(
                        leadingIcon: AssetsConstants.userIconSvg,
                        titleText: "Account",
                        children: [
                          customTitle('Email'),
                          AppSpace.spaceH6,
                            CustomEditTextFormField(
                              hintText: 'youremail@xmail.com',
                              backgroundColor: hexToColor('#FFFFFF'),
                              isEnabledBorder: true,
                              isBorder: true,
                              borderColor: hexToColor('#263238').withOpacity(0.13),
                            ),
                          AppSpace.spaceH6,
                          customTitle('Full Name'),
                          AppSpace.spaceH6,
                            CustomEditTextFormField(
                              hintText: 'William Bennett',
                              backgroundColor: hexToColor('#FFFFFF'),
                              isEnabledBorder: true,
                              isBorder: true,
                              borderColor: hexToColor('#263238').withOpacity(0.13),
                            ),
                          AppSpace.spaceH6,
                          customTitle('Street Address'),
                          AppSpace.spaceH6,
                            CustomEditTextFormField(
                              hintText: '465 Nolan Causeway Suite 079',
                              backgroundColor: hexToColor('#FFFFFF'),
                              isEnabledBorder: true,
                              isBorder: true,
                              borderColor: hexToColor('#263238').withOpacity(0.13),
                            ),
                          AppSpace.spaceH6,
                          customTitle('Apt, Suite, Bldg (optional)'),
                          AppSpace.spaceH6,
                            CustomEditTextFormField(
                              hintText: 'Unit 512',
                              backgroundColor: hexToColor('#FFFFFF'),
                              isEnabledBorder: true,
                              isBorder: true,
                              borderColor: hexToColor('#263238').withOpacity(0.13),
                            ),
                          AppSpace.spaceH6,
                          customTitle('Zip Code'),
                          AppSpace.spaceH6,
                            SizedBox(
                              width: 100,
                              child: CustomEditTextFormField(
                                hintText: '77017',
                                backgroundColor: hexToColor('#FFFFFF'),
                                isEnabledBorder: true,
                                isBorder: true,
                                borderColor: hexToColor('#263238').withOpacity(0.13),
                              ),
                            ),
                          AppSpace.spaceH30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButton(
                                  backgroundColor: Colors.white,
                                  borderColor: hexToColor('#979797').withOpacity(0.40),
                                  titleTextColor: hexToColor('#607374'),
                                  isBorder: true,
                                  radius: 10,
                                  fontSize: 17,
                                  onPressed: (){},
                                  title: 'Save',
                                height: 50,
                                width: Get.width*0.30,
                              ),
                              AppSpace.spaceW30,
                              CustomButton(
                                backgroundColor: hexToColor('#1ABC9C'),
                                radius: 10,
                                fontSize: 17,
                                onPressed: (){},
                                  title: 'Save',
                                height: 50,
                              width:  Get.width*0.30,
                              ),

                            ],
                          ),
                          AppSpace.spaceH30,
                        ],
                      ),

                      customDivider(),
                      _CustomExpansionTileWidget(
                        leadingIcon: AssetsConstants.passwordSvg,
                        titleText: "Passwords",
                        children: [
                          Text("Name : User "),
                          Text("Phone No: "),
                          const Text("isAdmin: No")
            
                        ],
                      ),
                      customDivider(),
                      _CustomExpansionTileWidget(
                        leadingIcon: AssetsConstants.notificationIconSvg,
                        titleText: "Notification",
                        children: [
                          Text("Name : User "),
                          Text("Phone No: "),
                          const Text("isAdmin: No")
            
                        ],
                      ),
                      customDivider(),
                      _CustomExpansionTileWidget(
                        leadingIcon: AssetsConstants.heartIconSvg,
                        titleText: "Wishlist (00)",
                        children: [
                          Text("Name : User "),
                          Text("Phone No: "),
                          const Text("isAdmin: No")
            
                        ],
                      ),
                    ],
                  ) ,
            
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _CustomExpansionTileWidget extends StatelessWidget {
  const _CustomExpansionTileWidget({super.key,required this.leadingIcon,required this.titleText,required this.children});
final String leadingIcon;
final String titleText;
 final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
    // collapsedShape: ShapeBorder(),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
    expandedCrossAxisAlignment: CrossAxisAlignment.start,
    leading: SvgPicture.asset(leadingIcon,width: 22,),
    title: Text(titleText,style: TextStyle(color:hexToColor('#000000'),fontSize: 17,fontWeight: FontWeight.w400 ),),
    children: children
    ));
  }
}
