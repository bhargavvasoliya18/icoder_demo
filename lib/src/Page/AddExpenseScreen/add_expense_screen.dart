import 'package:bhargav_practicle/src/Controller/custom_text_field.dart';
import 'package:bhargav_practicle/src/Element/padding_class.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/add_expense_controller.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_button.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatefulWidget {

  AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {

  final addExpenseController = Get.put(AddExpenseController());
  final transactionController = Get.put(TransactionController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      addExpenseController.initState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
      child: Scaffold(
        appBar: AppBar(
          title: Text(transactionController.isEditExpense.value ? "Edit Expense" : "Add Expense", style: TextStyleTheme.customTextStyle(AppTextColors.textWhite, 22, FontWeight.w500),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              paddingTop(15),
              customTextField("Description", addExpenseDescriptionController, (val) => null, addExpenseController.focusNode[0], TextInputAction.next, TextInputType.text, "Enter description", context),
              paddingTop(15),
              customTextField("Amount", addExpenseAmountController, (val) => null, addExpenseController.focusNode[1], TextInputAction.done, TextInputType.number, "Enter amount", context),
              paddingTop(15),
              GestureDetector(
                  onTap: (){customCalender(onTapDateSelect: (selectDate, focusDate){addExpenseController.selectDate(selectDate, focusDate);});},
                  child: customTextField("Date Time", addExpenseDateTimeController, (val) => null, addExpenseController.focusNode[2], TextInputAction.next, TextInputType.text, "Select date", context, onTap: (){}, readOnly: true)),
              paddingTop(35),
              customButton(transactionController.isEditExpense.value ? "Edit Expense" : "Add Expense", onTap: (){Get.put(TransactionController()).isEditExpense.value ? addExpenseController.updateExpense() : addExpenseController.addAndEditExpense();}, width: ScreenUtil().screenWidth / 2, buttonColor: Colors.blue, buttonTitleColor: AppTextColors.textWhite, borderColor: Colors.transparent)
            ],
          ),
        ),
      ),
    );
  }
}
