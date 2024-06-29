import 'package:bhargav_practicle/src/Controller/custom_text_field.dart';
import 'package:bhargav_practicle/src/Element/padding_class.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_button.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

filterView(){
  final transactionController = Get.put(TransactionController());
  return showDialog(
      context: Get.context!,
      useSafeArea: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppBgColors.whiteBg,),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: (){customCalender(onTapDateSelect: (selectDate, focusDate){transactionController.selectStartEndDate(selectDate, focusDate, isSelectStartDate: true);});},
                      child: customTextField("Start date", transactionStartDateController, (value) => null, FocusNode(), TextInputAction.done, TextInputType.text, "Start date", context, readOnly: true)),
                  paddingTop(20),
                  GestureDetector(
                      onTap: (){customCalender(onTapDateSelect: (selectDate, focusDate){transactionController.selectStartEndDate(selectDate, focusDate, isSelectStartDate: false);});},
                      child: customTextField("End date", transactionEndDateController, (value) => null, FocusNode(), TextInputAction.done, TextInputType.text, "End date", context, readOnly: true)),
                  paddingTop(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: customButton("Clear", borderRadius: 15, onTap: (){transactionController.clearFilter();})),
                      paddingLeft(20),
                      Expanded(child: customButton("Apply", borderRadius: 15, buttonColor: AppBgColors.blue, buttonTitleColor: AppTextColors.textWhite, borderColor: AppBorderColors.transparent, onTap: (){transactionController.applyFilter();})),
                    ],
                  )
                ],
              ),
            ),
          )
        );
      });
}