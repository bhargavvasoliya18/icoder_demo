import 'package:bhargav_practicle/src/Constants/app_date_formate.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Model/TransactionModel/transaction_model.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:bhargav_practicle/src/Utils/Helper/DatabaseHelper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEarningController extends GetxController{

  final dbHelper = DatabaseHelper();
  var focusNode = <FocusNode>[FocusNode(), FocusNode(), FocusNode()].obs;

  addAndEditEarning()async{
    print("add earning button call");
    TransactionModel transactionModel = TransactionModel(transactionType: 1, description: addEarningDescriptionController.text, transactionDate: addEarningDateTimeController.text, transactionAmount: double.parse(addEarningAmountController.text), openBalance: 0, closingBalance: 0, createdAt: DateTime.now().toString());
    var res = await dbHelper.addTransaction(transactionModel);
    // if(res != null && res != 0) {
      Get.put(TransactionController()).loadTransactions();
      Get.back();
    // }
  }

  updateEarning()async{
    TransactionModel transactionModel = TransactionModel(id: Get.put(TransactionController()).selectTransaction.id, transactionType: 0, description: addExpenseDescriptionController.text, transactionDate: addExpenseDateTimeController.text, transactionAmount: double.parse(addExpenseAmountController.text), openBalance: 0, closingBalance: 0, createdAt: DateTime.now().toString());
    var res = await dbHelper.updateTransaction(transactionModel);
    if(res != null && res != 0) {
      Get.put(TransactionController()).loadTransactions();
      Get.back();
    }
  }

  selectDate(selectDate, focusDate){
    addEarningDateTimeController.text = DateUtilforpass().formattedDate(selectDate);
    Get.back();
  }

  initState(){
    final transactionController = Get.put(TransactionController());
    if(transactionController.isEditExpense.value){
      addEarningDescriptionController.text = transactionController.selectTransaction.description ?? "";
      addEarningDateTimeController.text = transactionController.selectTransaction.transactionDate ?? "";
      addEarningAmountController.text = (transactionController.selectTransaction.transactionAmount ?? 0).toString();
    }else{
      addEarningDescriptionController.text = "";
      addEarningDateTimeController.text = "";
      addEarningAmountController.text = "";
    }
  }

}