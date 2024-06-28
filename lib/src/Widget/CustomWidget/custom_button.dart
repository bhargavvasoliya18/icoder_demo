import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton(String buttonTitle, {double? height, double? width, Color? buttonColor, Color? buttonTitleColor, VoidCallback? onTap, double? borderRadius, Color? borderColor, double? fontSize}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width ?? ScreenUtil().screenWidth,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: buttonColor ?? AppBgColors.whiteBg,
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          border: Border.all(color: borderColor ?? AppBorderColors.black),
          boxShadow: [
            BoxShadow(color: AppBgColors.whiteBg, blurRadius: 0.5, spreadRadius: 0.005)
          ]
      ),
      child: Center(child: Text(buttonTitle, style: TextStyleTheme.customTextStyle(buttonTitleColor ?? AppTextColors.black, fontSize ?? 14, FontWeight.w500), overflow: TextOverflow.ellipsis,)),
    ),
  );
}