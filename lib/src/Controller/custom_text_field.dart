import 'package:bhargav_practicle/src/Element/responsive_size_values.dart';
import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

Widget customTextField(
    String title,
    TextEditingController controller,
    FormFieldValidator validator,
    FocusNode focusNode,
    TextInputAction textInputAction,
    TextInputType textInputType,
    String textHint,
    BuildContext context, {
      Key? key,
      double? width,
      int line = 1,
      int? maxLength,
      Function(String)? onChange,
      Function()? onTap,
      VoidCallback? onEditingComplete,
      VoidCallback? onSuffixIconTap,
      Color? cursorColor,
      Color? suffixIconColor,
      Color? errorTextColor,
      TextStyle? titleStyle,
      TextStyle? inputStyle,
      TextStyle? hintStyle,
      Color? borderColor,
      Color? focusColor,
      bool? readOnly,
      bool? isShowTitle,
      EdgeInsets? contentPadding,
      FormFieldSetter? onSave,
      ValueChanged<String>? submit,
      bool? obSecure,
      TextCapitalization? textCapitalization,
      String? icon,
    }) {
  return SizedBox(
    width: width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowTitle == false ? Container() : Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title, style: titleStyle??TextStyleTheme.customTextStyle(AppTextColors.black, 15, FontWeight.w600)),
        ),
        TextFormField(
            key: key,
            textAlignVertical: TextAlignVertical.center,
            autovalidateMode: AutovalidateMode.disabled,
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            onSaved: onSave,
            maxLines: line,
            maxLength: maxLength,
            readOnly: readOnly ?? false,
            onFieldSubmitted: submit,
            obscureText: obSecure ?? false,
            obscuringCharacter: 'x',
            onTap: onTap,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            onChanged: onChange,
            enabled: !(readOnly??false),
            onEditingComplete: onEditingComplete,
            style: inputStyle ?? TextStyleTheme.customTextStyle(AppTextColors.black, 15, FontWeight.w500),
            cursorColor: cursorColor ?? AppCommonColors.black,
            decoration: InputDecoration(
              counterText: '',
              isCollapsed: false,
              isDense : true,
              contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: setSp(20),vertical:setSp(10)),
              suffixIcon: icon?.isNotEmpty ?? false ?GestureDetector(
                onTap: onSuffixIconTap,
                child: Padding(
                    padding: EdgeInsets.all(setSp(10)),
                    child: SvgPicture.asset(icon ?? "", height: setSp(14), width: setSp(14), color: suffixIconColor ?? AppIconColors.black)),
              ):Padding(
                  padding: EdgeInsets.all(setSp(10)),child: SizedBox(height: setSp(14), width: setSp(14),)),
              hintText: textHint,
              focusColor: focusColor ?? AppBorderColors.black,
              errorStyle: TextStyleTheme.customTextStyle(AppTextColors.red, 13, FontWeight.w400),
              hintStyle: hintStyle ?? TextStyleTheme.customTextStyle(AppTextColors.hintGrey, 15, FontWeight.w400),
              errorBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: BorderSide(color: borderColor ?? AppBorderColors.red,width: 0.9,),),
              disabledBorder: readOnly == true ? OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: const BorderSide(color: AppBorderColors.black ,width: 0.9,),) : OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: const BorderSide(color: AppBorderColors.grey,width: 0.9,),),
              focusedErrorBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: BorderSide(color: borderColor ?? AppBorderColors.red,width: 0.9,),),
              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: BorderSide(color: borderColor ?? AppBorderColors.black, width: 0.9,),),
              focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: BorderSide(color: focusColor ?? AppBorderColors.black,width: 1.3),),
            ))
      ],
    ),
  );
}