import 'package:bhargav_practicle/src/Controller/custom_text_field.dart';
import 'package:bhargav_practicle/src/Element/padding_class.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/add_earning_controller.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_button.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddEarningScreen extends StatefulWidget {

  AddEarningScreen({super.key});

  @override
  State<AddEarningScreen> createState() => _AddEarningScreenState();
}

class _AddEarningScreenState extends State<AddEarningScreen> {

  final addEarningController = Get.put(AddEarningController());
  final transactionController = Get.put(TransactionController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      addEarningController.initState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
      child: Scaffold(
        appBar: AppBar(
          title: Text(transactionController.isEditExpense.value ? "Edit Earning" : "Add Earning", style: TextStyleTheme.customTextStyle(AppTextColors.textWhite, 22, FontWeight.w500),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              paddingTop(15),
              customTextField("Description", addEarningDescriptionController, (val) => null, addEarningController.focusNode[0], TextInputAction.next, TextInputType.text, "Enter description", context),
              paddingTop(15),
              customTextField("Amount", addEarningAmountController, (val) => null, addEarningController.focusNode[1], TextInputAction.done, TextInputType.number, "Enter amount", context),
              paddingTop(15),
              GestureDetector(
                  onTap: (){customCalender(DateTime.now(), "", onTapDateSelect: (selectDate, focusDate){addEarningController.selectDate(selectDate, focusDate);});},
                  child: customTextField("Date Time", addEarningDateTimeController, (val) => null, addEarningController.focusNode[2], TextInputAction.next, TextInputType.text, "Select date", context, onTap: (){}, readOnly: true)),
              paddingTop(35),
              customButton(transactionController.isEditExpense.value ? "Edit Earning" : "Add Earning", onTap: (){Get.put(TransactionController()).isEditEarning.value ? addEarningController.updateEarning() : addEarningController.addAndEditEarning();}, width: ScreenUtil().screenWidth / 2, buttonColor: Colors.blue, buttonTitleColor: AppTextColors.textWhite, borderColor: Colors.transparent)
            ],
          ),
        ),
      ),
    );
  }
}