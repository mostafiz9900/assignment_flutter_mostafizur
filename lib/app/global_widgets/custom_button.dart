import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? titleTextColor;
  final double? width;
  final double? height;
  final double? iconHeight;
  final double? radius;
  final double? fontSize;
  final String? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool? isBorder;
  final Color? borderColor;
  final bool? isLoading;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.title,
      this.titleTextColor,
      this.width,
      this.height,
      this.fontSize,
      this.iconHeight,
      this.radius,
      this.icon,
      this.iconColor,
      this.backgroundColor,
      this.isBorder = false,
      this.borderColor,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading == true?null: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorConstants.buttonColor,
        minimumSize: Size(
          width ?? Get.width,
          height ?? 56,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        textStyle: Get.textTheme.labelLarge!.copyWith(
          color: titleTextColor ?? ColorConstants.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? AppDimens.space8.r),
        ),
        side: isBorder!
            ? BorderSide(
                width: 1,
                color: borderColor ?? hexToColor("#F75F55"),
                style: BorderStyle.solid,
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.space5),
        child: isLoading == true
            ?  Center(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon != null
                      ? SvgPicture.asset(
                          icon.toString(),
                          colorFilter: ColorFilter.mode(
                            iconColor ?? ColorConstants.redColor,
                            BlendMode.srcIn,
                          ),
                          height: iconHeight ?? 20,
                        ).paddingOnly(
                          right: title != null ? AppDimens.space8.w : 0)
                      : const SizedBox.shrink(),
                  title != null
                      ? Text(
                          title.toString(),
                          style: Get.textTheme.labelLarge!.copyWith(
                            fontSize: fontSize ?? AppDimens.fontSizeMedium,
                            color: titleTextColor ?? ColorConstants.white,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }
}
