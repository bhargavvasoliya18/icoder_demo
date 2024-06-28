import 'package:bhargav_practicle/src/Element/padding_class.dart';
import 'package:bhargav_practicle/src/Page/AddEarningScreen/add_earning_screen.dart';
import 'package:bhargav_practicle/src/Page/AddExpenseScreen/add_expense_screen.dart';
import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:bhargav_practicle/src/Utils/Helper/getx_navigation.dart';
import 'package:bhargav_practicle/src/Widget/CustomWidget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionsScreen extends StatefulWidget {

  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final transactionController = Get.put(TransactionController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp){
      transactionController.initState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                paddingTop(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: customButton("Add Expense", borderRadius: 12, onTap: (){navigatePush(AddExpenseScreen());})),
                    paddingLeft(15),
                    Expanded(child: customButton("Add Earning", borderRadius: 12, onTap: (){navigatePush(AddEarningScreen());}))
                  ],
                ),
                paddingTop(20),
                SizedBox(
                  height: ScreenUtil().screenHeight / 1.22,
                  child: ListView.builder(
                    itemCount: transactionController.transactions.length,
                    // reverse: true,
                    itemBuilder: (context, index) {
                      final transaction = transactionController.transactions[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppBorderColors.black),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(transaction.description.toString()),
                                  subtitle: Text(transaction.transactionDate.toString(), style: TextStyleTheme.customTextStyle(transaction.transactionType == 0 ? AppTextColors.black : AppTextColors.red, 14, FontWeight.w500),),
                                  trailing: Text(transaction.transactionAmount.toString()),
                                  onTap: () { },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: customButton("Edit", onTap: (){transactionController.navigateEditExpenseScreen(transaction);})),
                                      paddingLeft(15),
                                      Expanded(child: customButton("Delete", buttonColor: AppBgColors.red, borderColor: AppBorderColors.transparent, buttonTitleColor: AppTextColors.textWhite, onTap: (){transactionController.deleteTransaction(transaction.id ?? 0);}))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}