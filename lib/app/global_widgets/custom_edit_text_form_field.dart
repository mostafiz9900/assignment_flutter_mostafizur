import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_pkg.dart';

class CustomEditTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? isBorder;
  final bool isIcon;
  final int? maxLine;
  final IconData? icon;
  final double? borderRadius;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool isFocusedBorder;
  final bool isEnabledBorder;
  final bool autoFocus;
  final GestureTapCallback? onTap;
  final VoidCallback? suffixOnTap;
  final String? suffixIcon;
  final String? prefixIcon;
  final TextInputType? keyboardType;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final String? Function(String?)? validator;
  final bool? passwordVisible;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? validateMode;
  final TextStyle? hintStyle;
  final Function()? onChanging;

  const CustomEditTextFormField({
    super.key,
    this.hintText,
    this.isBorder = false,
    this.controller,
    this.maxLine,
    this.borderRadius,
    this.isIcon = false,
    this.icon,
    this.readOnly,
    this.onTap,
    this.isFocusedBorder = true,
    this.suffixOnTap,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.backgroundColor,
    this.hintTextColor,
    this.validator,
    this.passwordVisible,
    this.inputFormatters,
    this.hintStyle,
    this.initialValue,
    this.onChanged,
    this.validateMode,
    this.onChanging,
    this.autoFocus = false,
    this.isEnabledBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow:  [ BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2.0, // You can set this blurRadius as per your requirement
          ),]
      ),
      child: TextFormField(
        controller: controller,
        autovalidateMode: validateMode ?? AutovalidateMode.onUserInteraction,
        readOnly: readOnly ?? false,
        // obscuringCharacter: ".",
        onTap: onTap,
        maxLines: maxLine ?? 1,
        keyboardType: keyboardType,
        textAlign: TextAlign.left,
        initialValue: initialValue,
        onFieldSubmitted: (String? value) {
          if (value != null) {
            onChanged!(value);
          }
        },
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        onChanged: (String? value) {
          if (value != null) {
            onChanged!(value);
          }
        },
        autofocus: autoFocus,
        validator: validator,
        inputFormatters: inputFormatters,
        obscureText: passwordVisible ?? false,
        decoration: InputDecoration(
          filled: true,
          //<-- SEE HERE
          fillColor: backgroundColor ?? ColorConstants.editTextFillColor,
          hintTextDirection: TextDirection.ltr,
          contentPadding: EdgeInsets.only(
            left: AppDimens.space20,
            right: AppDimens.space14,
            top: maxLine != null ? AppDimens.space10 : 0,
            bottom: maxLine != null ? AppDimens.space10 : AppDimens.space5,
          ),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                color: hintTextColor ?? ColorConstants.hintTextColor,
                fontSize: AppDimens.space14.sp,
              ),
          errorMaxLines: 2,
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.space8.r)),
            borderSide: BorderSide(
              color: isEnabledBorder
                  ? ColorConstants.borderColor.withOpacity(0.50)
                  : Colors.transparent,
              width: 1.2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.space8.r)),
            borderSide: BorderSide(
              color: ColorConstants.borderColor.withOpacity(0.20),
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.space8.r)),
            borderSide: BorderSide(
              color: isFocusedBorder
                  ? ColorConstants.buttonColor.withOpacity(0.5)
                  : Colors.transparent,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.space8.r)),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.60),
              width: 1.2,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? InkWell(
            onTap: suffixOnTap,
            child: Padding(
              padding: EdgeInsets.all(AppDimens.space14.r),
              child: SvgPicture.asset(
                suffixIcon.toString(),
                height: AppDimens.space10.h,
                width: AppDimens.space10.w,
              ),
            ),
          )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: EdgeInsets.all(AppDimens.space12.r),
            child: SvgPicture.asset(
              prefixIcon.toString(),
              height: AppDimens.space12.h,
              width: AppDimens.space12.w,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
