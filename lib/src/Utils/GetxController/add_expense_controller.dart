import 'package:bhargav_practicle/src/Constants/app_date_formate.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Model/TransactionModel/transaction_model.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:bhargav_practicle/src/Utils/Helper/DatabaseHelper/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController{

  final dbHelper = DatabaseHelper();
  var focusNode = <FocusNode>[FocusNode(), FocusNode(), FocusNode()].obs;

  addAndEditExpense()async{
    TransactionModel transactionModel = TransactionModel(transactionType: 0, description: addExpenseDescriptionController.text, transactionDate: addExpenseDateTimeController.text, transactionAmount: double.parse(addExpenseAmountController.text), openBalance: 0, closingBalance: 0, createdAt: DateTime.now().toString());
   var res = await dbHelper.addTransaction(transactionModel);
   if(res != null && res != 0) {
     Get.put(TransactionController()).loadTransactions();
     Get.back();
   }
  }

  updateExpense()async{
    TransactionModel transactionModel = TransactionModel(id: Get.put(TransactionController()).selectTransaction.id, transactionType: 0, description: addExpenseDescriptionController.text, transactionDate: addExpenseDateTimeController.text, transactionAmount: double.parse(addExpenseAmountController.text), openBalance: 0, closingBalance: 0, createdAt: DateTime.now().toString());
    var res = await dbHelper.updateTransaction(transactionModel);
    if(res != null && res != 0) {
      Get.put(TransactionController()).loadTransactions();
      Get.back();
    }
  }

  selectDate(selectDate, focusDate){
    addExpenseDateTimeController.text = DateUtilforpass().formattedDate(selectDate);
    Get.back();
  }

  initState(){
    final transactionController = Get.put(TransactionController());
    if(transactionController.isEditExpense.value){
      addExpenseDescriptionController.text = transactionController.selectTransaction.description ?? "";
      addExpenseDateTimeController.text = transactionController.selectTransaction.transactionDate ?? "";
      addExpenseAmountController.text = (transactionController.selectTransaction.transactionAmount ?? 0).toString();
    }else{
      addExpenseDescriptionController.text = "";
      addExpenseDateTimeController.text = "";
      addExpenseAmountController.text = "";
    }
  }

}