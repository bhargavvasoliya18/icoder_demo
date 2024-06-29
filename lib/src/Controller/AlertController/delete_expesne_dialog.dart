import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Element/padding_class.dart';

void showDeleteDialog(BuildContext context, {VoidCallback? onTapDelete}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppBgColors.whiteBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Delete...!!", style: TextStyleTheme.customTextStyle(AppTextColors.black, 22, FontWeight.w500),),
            paddingTop(12),
            const Divider(color: AppBorderColors.black, thickness: 0.1,),
            paddingTop(12),
            Text("Are you sure you want to delete", style: TextStyleTheme.customTextStyle(AppTextColors.black, 15, FontWeight.w500),),
            paddingTop(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roundBorderDialogButton("cancel", onTap: (){Get.back();}, width: 100),
                backGroundColorDialogButton("delete", onTap: onTapDelete, width: 100)
              ],
            ),
          ],
        ),
      );
    },
  );
}