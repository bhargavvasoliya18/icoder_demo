import 'package:bhargav_practicle/src/Constants/app_images.dart';
import 'package:bhargav_practicle/src/Controller/AlertController/delete_expesne_dialog.dart';
import 'package:bhargav_practicle/src/Element/padding_class.dart';
import 'package:bhargav_practicle/src/Page/AddEarningScreen/add_earning_screen.dart';
import 'package:bhargav_practicle/src/Page/AddExpenseScreen/add_expense_screen.dart';
import 'package:bhargav_practicle/src/Page/ProfileScreen/profile_screen.dart';
import 'package:bhargav_practicle/src/Page/TransactionsScreen/Module/filter_view.dart';
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
      appBar: AppBar(title: const Text("Transactions"), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
              onTap: (){navigatePush(const ProfileScreen());},
              child: Image.asset(AppImages.userIcon, height: 25, width: 25, color: AppIconColors.white,)),
        )
      ],),
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                paddingTop(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Filter", style: TextStyleTheme.customTextStyle(AppTextColors.black, 16, FontWeight.w500),),
                    GestureDetector(
                        onTap: (){filterView();},
                        child: Image.asset(AppImages.filterIcon, height: 30, width: 30,))
                  ],),
                ),
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
                    itemCount: transactionController.filterTransactionsList.isNotEmpty ? transactionController.filterTransactionsList.length : transactionController.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactionController.filterTransactionsList.isNotEmpty ? transactionController.filterTransactionsList[index] : transactionController.transactions[index];
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
                                  subtitle: Text(transaction.transactionDate.toString()),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(transaction.transactionType == 0 ? "Expense" : "Earning", style: TextStyleTheme.customTextStyle(transaction.transactionType == 0 ? AppTextColors.red : AppTextColors.green, 14, FontWeight.w500),),
                                      Text(transaction.transactionAmount.toString(), style: TextStyleTheme.customTextStyle(transaction.transactionType == 0 ? AppTextColors.red : AppTextColors.green, 14, FontWeight.w500),),
                                    ],
                                  ),
                                  onTap: () { },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: customButton("Edit", onTap: (){transactionController.navigateEditExpenseScreen(transaction);})),
                                      paddingLeft(15),
                                      Expanded(child: customButton("Delete", buttonColor: AppBgColors.red, borderColor: AppBorderColors.transparent, buttonTitleColor: AppTextColors.textWhite, onTap: (){showDeleteDialog(context, onTapDelete: (){transactionController.deleteTransaction(transaction.id ?? 0); Get.back();});}))
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